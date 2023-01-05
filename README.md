# compare-shell-script-performance

シェルスクリプトで実装方法によるパフォーマンスを比較します.

## generate-md5sum

ファイルの md5sum を求める処理について,
実装方法による違いを比較した結果は以下の通りです.

### 実装パターン

| 実装 | 説明                                   |
| :--- | :------------------------------------- |
| A    |  ループの中で md5sum を実行する.       |
| B    |  ループの外側で md5sum を実行する.     |
| C    |  ループを使わずコマンドをパイプで繋ぐ. |

### 実行時間の比較結果

| 実装 | 実行時間 | 実行時間比 |
| :--- | -------: | ---------: |
| A    |  49.502s |        105 |
| B    |   1.821s |          4 |
| C    |   0.471s |          1 |

## generate-jsonl

ファイルの情報を持つ JSONL を生成する処理について,
実装方法による違いを比較した結果は以下の通りです.

### 実装パターン

| 実装 | 説明                                                               |
| :--- | :----------------------------------------------------------------- |
| A    |  比較の基準となる実装: 変数値をコマンドで生成, JSONL を jq で生成. |
| B    |  A に対して, 変数に代入する値をパラメータ置換で生成するように変更. |
| C    |  A に対して, JSONL を sed と tr で生成するように変更.              |
| D    |  A に対して, JSONL を echo で生成するように変更.                   |
| E    |  A に対して, wc をループの外側で実行するように変更.                |
| F    |  A に対して, B, C, D, E の改善を全て適用.                          |

### 実行時間の比較結果

| 実装 | 実行時間 | 実行時間比 |
| :--- | -------: | ---------: |
| A    |  59.341s |        248 |
| B    |  48.594s |        203 |
| C    |  31.294s |        131 |
| D    |  18.888s |         79 |
| E    |  51.575s |        216 |
| F    |   0.239s |          1 |

