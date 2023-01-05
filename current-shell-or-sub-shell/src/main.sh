#!/bin/bash

set -eu

# テスト回数 (ループ回数).
declare -r N=100000

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SOURCE_DIR="${ROOT_DIR}/src"
declare -r TARGET_DIR="${ROOT_DIR}/target"
declare -r RESULT_DIR="${TARGET_DIR}/result"

function main
{
    cleanup

    {
        echo "N=${N}"
        echo

        for name in A B
        do
            declare function_name="noop_${name}"

            echo "==== ${function_name}"
            declare source_file_path="${SOURCE_DIR}/${function_name}.sh"
            source "${source_file_path}"
            time ${function_name}
            echo
        done
    } 2>&1 | tee "${RESULT_DIR}/result.txt"
}

function cleanup
{
    for path in "${RESULT_DIR}"
    do
        rm -rf "${path}"
        mkdir -p "${path}"
    done
}

main

