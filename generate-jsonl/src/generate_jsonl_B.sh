function generate_jsonl_B
{
    echo 'A に対して, 変数に代入する値をパラメータ置換で生成するように変更.' >&2

    for file_path in $(list_files)
    do
        declare file_name="${file_path##*/}"
        declare extension="${file_name##*.}"
        declare lines="$(wc -l "${file_path}" | cut -d' ' -f1)"

        cat <<EOS | jq -cM .
            {
                "file_name":"${file_name}",
                "extension":"${extension}",
                "lines":"${lines}"
            }
EOS
    done
}

