#!/bin/bash

set -eu

# テストに使用するデータ数 (ファイル数).
declare -r N=1000

declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r SOURCE_DIR="${ROOT_DIR}/src"
declare -r TARGET_DIR="${ROOT_DIR}/target"
declare -r FILES_DIR="${TARGET_DIR}/files"
declare -r OUTPUT_DIR="${TARGET_DIR}/output"
declare -r RESULT_DIR="${TARGET_DIR}/result"

function main
{
    cleanup

    {
        echo "N=${N}"
        echo

        echo '==== setup'
        time setup
        echo

        for name in A B C D E F
        do
            declare function_name="generate_jsonl_${name}"
            declare source_file_path="${SOURCE_DIR}/${function_name}.sh"
            declare output_file_path="${OUTPUT_DIR}/${function_name}.jsonl"

            echo "==== ${function_name}"
            source "${source_file_path}"
            time ${function_name} > "${output_file_path}"
            echo
        done
    } 2>&1 | tee "${RESULT_DIR}/result.txt"
}

function cleanup
{
    for path in "${FILES_DIR}" "${OUTPUT_DIR}" "${RESULT_DIR}"
    do
        rm -rf "${path}"
        mkdir -p "${path}"
    done
}

function setup
{
    for i in $(seq ${N})
    do
        seq $i > "${FILES_DIR}/${i}.txt"
    done
}

function list_files
{
    find "${FILES_DIR}" -type f
}

main

