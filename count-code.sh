#!/bin/bash

# 统计有效代码量的脚本（排除非代码文件）
# 用法: ./count-code.sh [目录路径]

DIR="${1:-.}"

echo "统计目录: $DIR"
echo "排除: node_modules, .next, dist, build, .git, 图片/字体/媒体文件"
echo "=========================="

# 排除目录
EXCLUDE_DIRS="node_modules|.next|dist|build|.git|vendor|public|.archive|.claude|.codex-runtime"

# 排除的文件扩展名（非代码文件）
EXCLUDE_EXT="jpg|jpeg|png|gif|svg|ico|woff|woff2|ttf|eot|mp3|mp4|wav|zip|tar|gz|pdf|lock"

# 统计有效代码文件
count_lines() {
    local dir="$1"
    find "$dir" -type f \
        -not -path "*/($EXCLUDE_DIRS)/*" \
        -not -name "*.{jpg,jpeg,png,gif,svg,ico,woff,woff2,ttf,eot,mp3,mp4,wav,zip,tar,gz,pdf,lock}" \
        -not -name "*.min.*" \
        -not -name "package-lock.json" \
        | xargs grep -l "[^[:space:]]" 2>/dev/null \
        | xargs wc -l 2>/dev/null \
        | tail -1
}

echo "有效代码总行数:"
count_lines "$DIR"

echo ""
echo "各项目统计:"
for project in "$DIR"/*/; do
    if [ -d "$project" ]; then
        project_name=$(basename "$project")
        # 跳过排除的目录
        if [[ "$project_name" =~ ^($EXCLUDE_DIRS)$ ]]; then
            continue
        fi
        result=$(count_lines "$project")
        if [ -n "$result" ]; then
            lines=$(echo "$result" | awk '{print $1}')
            echo "$project_name: $lines 行"
        fi
    fi
done