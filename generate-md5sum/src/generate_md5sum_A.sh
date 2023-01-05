function generate_md5sum_A
{
    echo 'ループの中で md5sum を実行する.' >&2

    for file in $(find "${FILES_DIR}" -type f)
    do
        md5sum "${file}"
    done
}

