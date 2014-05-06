;;; Semantic
;; 各種プログラミング言語を解析するライブラリー。
;; コンテキストに応じた処理もできる。
;; 2014-05-06

;; 何も操作しないと現在のポイントにあるシンボルをハイライトする。
(add-to-list 'semantic-default-submodes
             'global-semantic-idle-local-symbol-highlight-mode)
;; 何も操作しないと現在のポイントにあるシンボルの情報をミニバッファーに表示する。
(add-to-list 'semantic-default-submodes
             'global-semantic-idle-summary-mode)
;; 表示されている内容の先頭行の関数名をバッファーのヘッダーに表示する。
(add-to-list 'semantic-default-submodes
             'global-semantic-stickyfunc-mode)

;; Semanticを有効にする。
(semantic-mode)
