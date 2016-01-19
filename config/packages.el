;;; package.el
;; Emacs標準のパッケージ管理システム
;; 2013-12-31
(require 'package)

;; MELPAからもインストールする。
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
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


;;; el-get
;; 複数のソースからパッケージをインストールできるパッケージ管理システム
;; 2012-03-15
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
;; レシピ置き場
(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes"))
;; 追加のレシピ置き場
(add-to-list 'el-get-recipe-path
             "~/.emacs.d/config/el-get/local-recipes")


;;; grep-edit
;; *grep*で編集できるようにする
(el-get 'sync '(grep-edit))
(add-hook 'grep-setup-hook
          (lambda ()
            (define-key grep-mode-map
              (kbd "C-c C-c") 'grep-edit-finish-edit)))


;;; ポップアップ
;; 2012-03-16
(el-get 'sync '(popup))


;;; Auto Complete
;; 自動補完
(el-get 'sync '(auto-complete))
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))


;;; Helm
;; 2014-06-20
;; iswitchbの代わり
(el-get 'sync '(helm))
(require 'helm-config)
(setq helm-command-prefix-key "C-c C-<SPC>")
(require 'helm)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x g") 'helm-semantic-or-imenu)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x 8") 'helm-ucs)
(define-key helm-map (kbd "C-z") nil)
(define-key helm-map (kbd "C-l") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-o") nil)
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)


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
(el-get 'sync '(rabbit-mode))


;;; run-test
;; テスト実行
(el-get 'sync '(run-test))


;;; Magit
;; 2012-03-24
(if (version<= "24.4.0" emacs-version)
    (load "config/packages/magit"))


;;; rst-mode
;; reStructuredText編集用のモード
;; 2012-03-24
(el-get 'sync '(rst-mode))


;;; textile-mode
;; Textile編集用のモード
;; 2012-04-11
(el-get 'sync '(textile-mode))


;;; coffe-mode
;; CoffeeScript編集用のモード
;; 2012-04-04
(el-get 'sync '(coffee-mode))


;;; less-css-mode
;; LESS編集用のモード
;; 2012-09-23
(el-get 'sync '(less-css-mode))


;;; Milkode
;; ソースコード検索エンジン
;; 2012-09-28
(el-get 'sync '(milkode))


;;; markdown-mode
;; Markdown編集用のモード
;; 2012-10-15
(el-get 'sync '(markdown-mode))


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
(el-get 'sync '(yaml-mode))


;;; EditorConfig
;; 2014-10-21
(package-ensure-install 'editorconfig)


;;; scss-mode
;; 2014-10-22
(load "config/packages/scss-mode")


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-15
(load "config/packages/local" t)
