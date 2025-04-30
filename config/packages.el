;;; Copyright (C) 2011-2025  Sutou Kouhei <kou@clear-code.com>
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

;;; use-package
;; デフォルトで(use-package :ensure t)にする。
;; :ensure tにするとインストールされていなかったらインストールする。
;; 2025-01-18
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;; package.el
;; Emacs標準のパッケージ管理システム
;; 2013-12-31
(use-package package
  :config
  ;; MELPAからもインストールする。
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")
               t)
  ;; 初期化。
  (package-initialize)
  ;; 初回起動時はパッケージリストを更新する。
  (unless package-archive-contents
    (package-refresh-contents)))



;;; Flycheck
;; 2022-04-01
(use-package flycheck)


;;; wgrep
;; *grep*で編集できるようにする
(use-package wgrep
  :config
  ;; *grep*で"r"を押すと編集できる（Diredと同じ）
  (setq wgrep-enable-key "r")
  ;; 編集したら自動で保存する
  (setq wgrep-auto-save-buffer t))


;;; ポップアップ
;; 2012-03-16
(use-package popup)


;;; Auto Complete
;; 自動補完
(use-package auto-complete
  :hook (auto-complete-mode
         .
         (lambda ()
           (keymap-set ac-completing-map "C-n" 'ac-next)
           (keymap-set ac-completing-map "C-p" 'ac-previous))))


;;; Migemo
;; ローマ字で日本語をインクリメンタルサーチする。
;; 2012-03-19
;; インストールされていたら有効にする。
(require 'migemo nil t)


;;; rabbit-mode
;; 2012-03-16
;; (el-get 'sync '(rabbit-mode))


;;; run-test
;; テスト実行
;; (el-get 'sync '(run-test))


;;; Magit
;; 2012-03-24
(load "config/packages/magit")


;;; textile-mode
;; Textile編集用のモード
;; 2012-04-11
(use-package textile-mode)


;;; less-css-mode
;; LESS編集用のモード
;; 2012-09-23
(use-package less-css-mode)


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


;;; go-mode
;; 2014-08-16
(use-package go-mode)


;;; yaml-mode
;; 2014-09-26
(use-package yaml-mode)


;;; EditorConfig
;; 2014-10-21
(load "config/packages/editorconfig")


;;; rust-mode
;; 2017-03-16
(use-package rust-mode)


;;; dockerfile-mode
;; 2017-04-08
(use-package dockerfile-mode)


;;; ESS
;; 2017-05-17
(load "config/packages/ess")


;;; poly-R
;; 2019-12-25
(use-package poly-R)


;;; Meson
;; 2017-10-09
(use-package meson-mode)


;;; Lua
;; 2018-03-16
(use-package lua-mode)


;;; CP5022x
;; 2018-07-02
(use-package cp5022x
  :config
  (coding-system-put 'iso-2022-jp :decode-translation-table
                     '(cp51932-decode japanese-ucs-cp932-to-jis-map)))


;;; PHP
;; 2019-02-07
(use-package php-mode)


;;; PowerShell
;; 2019-09-06
(use-package powershell)


;;; Qt
;; 2020-02-23
(use-package qml-mode)


;;; NSIS
;; 2020-07-20
(use-package nsis-mode)


;;; Protocol Buffers
;; 2020-09-11
(use-package protobuf-mode)


;;; Cython
;; 2020-10-23
(load "config/packages/cython-mode")


;;; Org mode
;; 2021-01-29
(load "config/packages/org-mode")


;;; CMake mode
;; 2023-05-11
(use-package cmake-mode)


;;; Vala
;; 2022-04-25
(use-package vala-mode)


;;; Debian
;; 2022-12-16
(use-package dpkg-dev-el)


;;; TypeScript mode
;; 2023-11-22
(use-package typescript-mode)


;;; highlight-parentheses
;; 2023-12-27
(use-package highlight-parentheses
  :config
  (global-highlight-parentheses-mode t))


;;; Swift mode
;; 2024-01-10
(use-package swift-mode)


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-15
(load "config/packages/local" t)
