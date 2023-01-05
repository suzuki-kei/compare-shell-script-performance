function noop_A
{
    echo 'カレントシェルで実行する.' >&2

    for i in $(seq ${N})
    do
        :
    done
}

