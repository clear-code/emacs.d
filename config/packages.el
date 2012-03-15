;;; el-get
;; 複数のソースからパッケージをインストールできるパッケージ管理システム
;; 2012-03-15
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (status)
     (end-of-buffer)
     (eval-print-last-sexp))))
;; レシピ置き場
(add-to-list 'el-get-recipe-path
             "~/.emacs.d/config/el-get/recipes")
;; 追加のレシピ置き場
(add-to-list 'el-get-recipe-path
             "~/.emacs.d/config/el-get/local-recipes")

(defvar packages '()
  "List of package names to be installed")

(require 'package)

;;; grep-edit
;; *grep*で編集できるようにする
(package-install 'emacswiki "grep-edit.el" 'grep-edit)
(add-hook 'grep-setup-hook
          (lambda ()
            (define-key grep-mode-map (kbd "C-c C-c") 'grep-edit-finish-edit)))


;;; Auto Complete
;; 自動補完
(package-install 'github "m2ym/auto-complete" 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (format "%s/auto-complete/dict" package-base-dir))
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))


;;; Anything
;; iswitchbの代わり
(let ((original-browse-url-browser-function browse-url-browser-function))
  (setq anything-command-map-prefix-key "C-c C-<SPC>")
  (package-install 'repo.or.cz '((files . ("anything-config"))
                                 (additional-paths . ("extensions" "contrib")))
                   'anything-startup)
  (define-key global-map (kbd "C-x b") 'anything-for-files)
  (define-key anything-map (kbd "C-z") nil)
  (define-key anything-map (kbd "C-l") 'anything-execute-persistent-action)
  (define-key anything-map (kbd "C-o") nil)
  (define-key anything-map (kbd "C-M-n") 'anything-next-source)
  (define-key anything-map (kbd "C-M-p") 'anything-previous-source)
  (setq browse-url-browser-function original-browse-url-browser-function))


;;; run-test
;; テスト実行
(package-install 'github '((files . ("kou/run-test"))
                           (base-path . "lib"))
                 'run-test-setting)


;;; uim
;; 2011-06-27
(load "config/packages/uim")


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-15
(condition-case err
    (load "config/packages/local")
  (error))

;;; パッケージをインストール
;; 2012-03-15
(el-get 'sync packages)
