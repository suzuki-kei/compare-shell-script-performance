function generate_jsonl_D
{
    echo 'A に対して, JSONL を echo で生成するように変更.' >&2

    for file_path in $(list_files)
    do
        declare file_name="$(basename "${file_path}")"
        declare extension="$(echo "${file_name}" | sed -r 's/^([^.]*\.)*//')"
        declare lines="$(wc -l "${file_path}" | cut -d' ' -f1)"

        echo "{\"file_name\":\"${file_name}\",\"extension\":\"${extension}\",\"lines\":\"${lines}\"}"
    done
}

