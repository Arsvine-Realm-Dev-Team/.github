# 统计有效代码量的 PowerShell 脚本（排除非代码文件）
# 用法: .\count-code.ps1 [目录路径]

param(
    [string]$Dir = "."
)

Write-Host "统计目录: $Dir"
Write-Host "排除: node_modules, .next, dist, build, .git, 图片/字体/媒体文件"
Write-Host "=========================="

$excludeDirs = @('node_modules', '.next', 'dist', 'build', '.git', 'vendor', 'public', '.archive', '.claude', '.codex-runtime')
$excludeExt = @('*.jpg', '*.jpeg', '*.png', '*.gif', '*.svg', '*.ico', '*.woff', '*.woff2', '*.ttf', '*.eot', '*.mp3', '*.mp4', '*.wav', '*.zip', '*.tar', '*.gz', '*.pdf', '*.lock', '*.min.*')

function Get-CodeFiles {
    param([string]$Path)
    
    Get-ChildItem -Path $Path -Recurse -File | Where-Object {
        $fullName = $_.FullName
        $name = $_.Name
        
        # 排除目录
        $excluded = $false
        foreach ($dir in $excludeDirs) {
            if ($fullName -like "*\$dir\*") {
                $excluded = $true
                break
            }
        }
        
        # 排除文件扩展名
        if (-not $excluded) {
            foreach ($ext in $excludeExt) {
                if ($name -like $ext) {
                    $excluded = $true
                    break
                }
            }
        }
        
        # 排除空行和纯空白文件
        if (-not $excluded) {
            $content = Get-Content $fullName -ErrorAction SilentlyContinue
            $hasContent = $content | Where-Object { $_ -match '\S' } | Select-Object -First 1
            $excluded = -not $hasContent
        }
        
        -not $excluded
    }
}

# 统计行数
function Count-Lines {
    param([string]$Path)
    
    $files = Get-CodeFiles -Path $Path
    $totalLines = 0
    foreach ($file in $files) {
        $lines = (Get-Content $file.FullName -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        $totalLines += $lines
    }
    $totalLines
}

Write-Host "有效代码总行数:"
$totalLines = Count-Lines -Path $Dir
Write-Host "$totalLines 行"

Write-Host ""
Write-Host "各项目统计:"
$projects = Get-ChildItem -Path $Dir -Directory | Where-Object {
    $excludeDirs -notcontains $_.Name
}

foreach ($project in $projects) {
    $projectLines = Count-Lines -Path $project.FullName
    Write-Host "$($project.Name): $projectLines 行"
}