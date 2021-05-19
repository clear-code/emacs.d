;;; Copyright (C) 2012-2013  Kouhei Sutou <kou@clear-code.com>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; cc-mode
;; C言語と同じような構文のプログラミング言語用の設定
;; 2012-03-18

;; hookを利用するとEditorConfigの設定を上書きしてしまうので
;; スタイルの変更にはhookを使わない。
;; 2021-05-19
(require 'cc-mode)

;; BSDスタイルをベースに2スペースでインデントするモードを作る。
(setq c-style-2-spaces (copy-alist (cdr (assoc "bsd" c-style-alist))))
;; スペースでインデントをする。
(setq c-style-2-spaces `((indent-tabs-mode . nil) ,@c-style-2-spaces))
;; インデント幅を2にする。
(setcdr (assoc 'c-basic-offset c-style-2-spaces) 2)
;; C++は開き波括弧の位置を調整する
;; 定義開始時の開き波かっこ「{」の前で改行しない
;; デフォルトでは前後に改行が入る
;; afterを指定すると後だけに改行がはいる
;; (defun-open before after)にすると前後に改行が入る
(setq c++-style-2-spaces
      `((c-hanging-braces-alist . (;; トップレベルの関数定義
                                   (defun-open after)
                                   ;; クラス定義
                                   (class-open after)
                                   ;; クラス定義内のインラインメソッド定義
                                   (inline-open after)
                                   ;; デフォルト設定も使う
                                   ,@(cdr (assoc
                                           'c-hanging-braces-alist
                                           c-fallback-style))))
        ,@c-style-2-spaces))
;; スタイルを登録する。
(setq c-style-alist
      `(("2-spaces-c" ,@c-style-2-spaces)
        ("2-spaces-c++" ,@c++-style-2-spaces)
        ,@c-style-alist))
;; デフォルトで2スペースでインデントするスタイルを使う。
(setq c-default-style
      `((c-mode . "2-spaces-c")
        (c++-mode . "2-spaces-c++")
        ,@c-default-style))

;; c-modeやc++-modeなどcc-modeベースのモード共通の設定
(add-hook
 'c-mode-common-hook
 (lambda ()
   ;; 自動改行（auto-new-line）と
   ;; 連続する空白の一括削除（hungry-delete）を
   ;; 有効にする
   (c-toggle-auto-hungry-state 1)

   ;; CamelCaseの語でも単語単位に分解して編集する
   ;; GtkWindow         => Gtk Window
   ;; EmacsFrameClass   => Emacs Frame Class
   ;; NSGraphicsContext => NS Graphics Context
   (subword-mode 1)))
