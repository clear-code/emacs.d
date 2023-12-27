;;; Copyright (C) 2011-2020  Kouhei Sutou <kou@clear-code.com>
;;; Copyright (C) 2015  Yasuyuki Tanaka <yasuyuki.tanaka@inf.ethz.ch>
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

;;; package.el
;; Emacs標準のパッケージ管理システム
;; 2013-12-31
(require 'package)

;; MELPAからもインストールする。
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
;; 初期化。
(package-initialize)
;; 初回起動時はパッケージリストを更新する。
(unless package-archive-contents
  (package-refresh-contents))

;; 便利関数。インストールされていなかったらインストールする。
(defun package-ensure-install (name)
  (unless (package-installed-p name)
    (package-install name)))


;;; Flycheck
;; 2022-04-01
(package-ensure-install 'flycheck)


;;; wgrep
;; *grep*で編集できるようにする
(package-ensure-install 'wgrep)
;; *grep*で"r"を押すと編集できる（Diredと同じ）
(setq wgrep-enable-key "r")
;; 編集したら自動で保存する
(setq wgrep-auto-save-buffer t)


;;; ポップアップ
;; 2012-03-16
(package-ensure-install 'popup)


;;; Auto Complete
;; 自動補完
(package-ensure-install 'auto-complete)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))


;;; Migemo
;; ローマ字で日本語をインクリメンタルサーチする。
;; 2012-03-19
;; インストールされていたら有効にする。
(require 'migemo nil t)


;;; ruby-mode
;; 2012-03-15
(load "config/packages/ruby-mode")


;;; rabbit-mode
;; 2012-03-16
;; (el-get 'sync '(rabbit-mode))


;;; run-test
;; テスト実行
;; (el-get 'sync '(run-test))


;;; Magit
;; 2012-03-24
(if (version<= "24.4.0" emacs-version)
    (load "config/packages/magit"))


;;; textile-mode
;; Textile編集用のモード
;; 2012-04-11
(package-ensure-install 'textile-mode)


;;; coffee-mode
;; CoffeeScript編集用のモード
;; 2012-04-04
(package-ensure-install 'coffee-mode)


;;; less-css-mode
;; LESS編集用のモード
;; 2012-09-23
(package-ensure-install 'less-css-mode)


;;; Milkode
;; ソースコード検索エンジン
;; 2012-09-28
(package-ensure-install 'milkode)


;;; markdown-mode
;; Markdown編集用のモード
;; 2012-10-15
(load "config/packages/markdown-mode")


;;; expand-region
;; 2012-12-06
(load "config/packages/expand-region")


;;; multiple-cursors
;; 2012-12-05
(load "config/packages/multiple-cursors")


;;; anzu
;; 2013-12-31
(load "config/packages/anzu")


;;; Monky
;; MagitのようなインターフェイスのMercurialクライアント
;; 2014-02-15
(package-ensure-install 'monky)


;;; go-mode
;; 2014-08-16
(load "config/packages/go-mode")


;;; yaml-mode
;; 2014-09-26
(package-ensure-install 'yaml-mode)


;;; EditorConfig
;; 2014-10-21
(load "config/packages/editorconfig")


;;; scss-mode
;; 2014-10-22
(load "config/packages/scss-mode")


;;; rust-mode
;; 2017-03-16
(package-ensure-install 'rust-mode)


;;; dockerfile-mode
;; 2017-04-08
(package-ensure-install 'dockerfile-mode)


;;; ESS
;; 2017-05-17
(load "config/packages/ess")


;;; poly-R
;; 2019-12-25
(package-ensure-install 'poly-R)


;;; Meson
;; 2017-10-09
(package-ensure-install 'meson-mode)


;;; Lua
;; 2018-03-16
(package-ensure-install 'lua-mode)


;;; CP5022x
;; 2018-07-02
(package-ensure-install 'cp5022x)
(require 'cp5022x)
(coding-system-put 'iso-2022-jp :decode-translation-table
                   '(cp51932-decode japanese-ucs-cp932-to-jis-map))


;;; PHP
;; 2019-02-07
(package-ensure-install 'php-mode)


;;; PowerShell
;; 2019-09-06
(package-ensure-install 'powershell)


;;; Qt
;; 2020-02-23
(load "config/packages/qt")


;;; NSIS
;; 2020-07-20
(package-ensure-install 'nsis-mode)


;;; Protocol Buffers
;; 2020-09-11
(package-ensure-install 'protobuf-mode)


;;; Cython
;; 2020-10-23
(load "config/packages/cython-mode")


;;; Org mode
;; 2021-01-29
(load "config/packages/org-mode")


;;; CMake mode
;; 2023-05-11
(package-ensure-install 'cmake-mode)


;;; Vala
;; 2022-04-25
(package-ensure-install 'vala-mode)


;;; Debian
;; 2022-12-16
(package-ensure-install 'dpkg-dev-el)


;;; TypeScript mode
;; 2023-11-22
(package-ensure-install 'typescript-mode)


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-15
(load "config/packages/local" t)
