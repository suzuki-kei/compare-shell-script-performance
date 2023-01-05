function noop_B
{
    echo 'サブシェルで実行する.' >&2

    for i in $(seq ${N})
    do
        ( : )
    done
}

