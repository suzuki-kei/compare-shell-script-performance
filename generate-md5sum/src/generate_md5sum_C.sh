function generate_md5sum_C
{
    echo 'ループを使わずコマンドをパイプで繋ぐ'

    find "${FILES_DIR}" -type f | xargs md5sum
}

