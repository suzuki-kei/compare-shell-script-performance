function generate_jsonl_F
{
    echo 'A に対して, B, C, D, E の改善を全て適用.' >&2

    while read lines file_path
    do
        declare file_name="${file_path##*/}"
        declare extension="${file_name##*.}"

        echo "{\"file_name\":\"${file_name}\",\"extension\":\"${extension}\",\"lines\":\"${lines}\"}"
    done < <(list_files | xargs wc -l | sed -r '/^ *[0-9]+ total$/d')
}

