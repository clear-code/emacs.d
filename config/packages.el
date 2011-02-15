(require 'cl)

(defvar package-base-dir "~/.emacs.d/packages")

(defun package-path-basename (path)
  (file-name-sans-extension (file-name-nondirectory path)))

(defun package-directory (files)
  (concat package-base-dir "/"
          (package-path-basename (car files))))

(defun package-run-shell-command (command)
  (message (format "running...: %s" command))
  (shell-command command))

(defun package-install-from-emacswiki (files)
  (shell-command
   (format "mkdir -p %s" (package-directory files)))
  (package-run-shell-command
   (format "wget --directory-prefix %s %s"
           (package-directory files)
           (mapconcat (lambda (name)
                        (concat "http://www.emacswiki.org/emacs/download/"
                                name))
                      files
                      " "))))

(defun package-install-from-github (files)
  (package-run-shell-command
   (format (concat "git clone https://github.com/%s.git %s")
           (car files)
           (package-directory files))))

(defun package-install-from-repo.or.cz (files)
  (package-run-shell-command
   (format (concat "git clone git://repo.or.cz/%s.git %s")
           (car files)
           (package-directory files))))

(defun package-alist-value (alist key default-value)
  (if (listp alist)
      (let ((alist-item (assoc key alist)))
        (if alist-item
            (cdr alist-item)
          default-value))
    default-value))

(defun package-install (type package-spec require-name &optional force)
  (let ((files (package-alist-value package-spec 'files
                                    (if (listp package-spec)
                                        package-spec
                                      (list package-spec))))
        (base-path (package-alist-value package-spec 'base-path "."))
        (additional-paths (package-alist-value package-spec 'additional-paths
                                               nil))
        (install-proc (case type
                        (emacswiki
                         'package-install-from-emacswiki)
                        ('github
                         'package-install-from-github)
                        ('repo.or.cz
                         'package-install-from-repo.or.cz)
                        (t
                         (error "unknown package type: <%s>(%s)"
                                type package)))))
    (add-to-list 'load-path
                 (format "%s/%s"
                         (package-directory files)
                         base-path))
    (dolist (additional-path additional-paths)
      (add-to-list 'load-path (format "%s/%s"
                                      (package-directory files)
                                      additional-path)))
    (condition-case err
        (require require-name)
      (error
       (message (format "installing %s..." files))
       (funcall install-proc files)))
    (require require-name)))


;;; *grep*で編集できるようにする
(package-install 'emacswiki "grep-edit.el" 'grep-edit)
(add-hook 'grep-setup-hook
          (lambda ()
            (define-key grep-mode-map (kbd "C-c C-c") 'grep-edit-finish-edit)))


;;; 自動補完
(package-install 'github "m2ym/auto-complete" 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (format "%s/auto-complete/dict" package-base-dir))
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))


;;; Anything
(let ((original-browse-url-browser-function browse-url-browser-function))
  (setq anything-command-map-prefix-key "C-c C-<SPC>")
  (package-install 'repo.or.cz '((files . ("anything-config"))
                                 (additional-paths . ("extensions")))
                   'anything-startup)
  (define-key global-map (kbd "C-x b") 'anything-for-files)
  (define-key anything-map (kbd "C-z") nil)
  (define-key anything-map (kbd "C-l") 'anything-execute-persistent-action)
  (define-key anything-map (kbd "C-o") nil)
  (define-key anything-map (kbd "C-M-n") 'anything-next-source)
  (define-key anything-map (kbd "C-M-p") 'anything-previous-source)
  (setq browse-url-browser-function original-browse-url-browser-function))


;;; テスト実行
(package-install 'github '((files . ("kou/run-test"))
                           (base-path . "lib"))
                 'run-test-setting)
