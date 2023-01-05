function generate_md5sum_B
{
    echo 'ループの外側で md5sum を実行する' >&2

    while read md5sum_value
    do
        echo "${md5sum_value}"
    done < <(find "${FILES_DIR}" -type f | xargs md5sum)
}

