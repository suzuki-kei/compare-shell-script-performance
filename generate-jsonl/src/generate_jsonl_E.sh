function generate_jsonl_E
{
    echo 'A に対して, wc をループの外側で実行するように変更.' >&2

    while read lines file_path
    do
        declare file_name="$(basename "${file_path}")"
        declare extension="$(echo "${file_name}" | sed -r 's/^([^.]*\.)*//')"

        cat <<EOS | jq -cM .
            {
                "file_name":"${file_name}",
                "extension":"${extension}",
                "lines":"${lines}"
            }
EOS
    done < <(list_files | xargs wc -l | sed -r '/^ *[0-9]+ total$/d')
}

