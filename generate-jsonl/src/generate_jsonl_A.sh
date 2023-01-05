function generate_jsonl_A
{
    echo '比較の基準となる実装: 変数値をコマンドで生成, JSONL を jq で生成.' >&2

    for file_path in $(list_files)
    do
        declare file_name="$(basename "${file_path}")"
        declare extension="$(echo "${file_name}" | sed -r 's/^([^.]*\.)*//')"
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

