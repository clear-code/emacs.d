;;; ロードパス
;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d")
                 load-path))


;;; 追加の関数定義
;; 2012-03-24
;; 便利関数の定義
(load "functions/convenience")
;; 個別の関数定義があったら読み込む
(load "functions/local" t)


;;; 日本語環境
;; Localeに合わせた環境の設定
(set-locale-environment nil)


;;; キーバインド
;; C-hでバックスペース
;; 2012-03-18
(keyboard-translate ?\C-h ?\C-?)
;; 基本
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動
;; ウィンドウ移動
;; 2011-02-17
;; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-n") 'next-multiframe-window)
;; 前のウィンドウへ移動
(define-key global-map (kbd "C-M-p") 'previous-multiframe-window)
;; 定義へ移動
;; 2012-04-15
;; C-x F -> 関数定義へ移動
;; C-x K -> キーにバインドされている関数定義へ移動
;; C-x V -> 変数定義へ移動
(find-function-setup-keys)


;;; grep
;; 再帰的にgrep
;; 2011-02-18
(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))


;;; 画像
;; 画像ファイルを表示
(auto-image-file-mode t)


;;; バー
;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)


;;; カーソル
;; カーソルの点滅を止める
(blink-cursor-mode 0)


;;; eval
;; evalした結果を全部表示
(setq eval-expression-print-length nil)


;;; 括弧
;; 対応する括弧を光らせる。
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)


;;; 空白
;; 2011-10-27
;; 空白や長すぎる行を視覚化する。
(require 'whitespace)
;; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-line-column 80)
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         lines-tail        ; 長すぎる行のうち
                                           ; whitespace-line-column以降のみを
                                           ; 対象とする。
                         space-before-tab  ; タブの前にあるスペースを対象とする。
                         space-after-tab)) ; タブの後にあるスペースを対象とする。
;; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)


;;; 位置
;; 現在行を目立たせる
(global-hl-line-mode)
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)
;; カーソルの位置が何行目かを表示する
(line-number-mode t)
;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)


;;; 行
;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)


;;; バックアップ
;; バックアップファイルを作らない
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)


;;; 補完
;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 部分一致の補完機能を使う
;; p-bでprint-bufferとか
(partial-completion-mode t)
;; 補完可能なものを随時表示
;; 少しうるさい
(icomplete-mode 1)


;;; 履歴
;; 履歴数を大きくする
(setq history-length 10000)
;; ミニバッファの履歴を保存する
(savehist-mode 1)
;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)


;;; 圧縮
;; gzファイルも編集できるようにする
(auto-compression-mode t)


;;; diff
;; ediffを1ウィンドウで実行
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのオプション
(setq diff-switches '("-u" "-p" "-N"))


;;; ディレクトリ
;; diredを便利にする
(require 'dired-x)
;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;; バッファ名
;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;;; shebangがあるファイルを保存すると実行権をつける。
;; 2012-03-15
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;;; リージョンの大文字小文字変換を有効にする。
;; C-x C-u -> upcase
;; C-x C-l -> downcase
;; 2011-03-09
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;;; 現在の関数名をウィンドウ上部に表示する。
;; 2011-03-15
(which-function-mode 1)


;;; Emacsサーバー
;; emacsclientで接続できるようにする。
;; 2011-06-14
(server-start)


;;; 追加の設定
;; 標準Elispの設定
(load "config/builtins")
;; 非標準Elispの設定
(load "config/packages")
;; 個別の設定があったら読み込む
;; 2012-02-15
(load "config/local" t)
