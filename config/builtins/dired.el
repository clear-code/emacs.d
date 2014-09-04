;;; dired

;; バージョン管理システム
;; diredから適切なバージョン管理システムの*-statusを起動
(defun dired-vc-status (&rest args)
  (interactive)
  (let ((path (find-path-in-parents (dired-current-directory)
                                    '(".svn" ".git" ".hg"))))
    (cond ((null path)
           (message "not version controlled."))
          ((string-match-p "\\.svn$" path)
           (svn-status (file-name-directory path)))
          ((string-match-p "\\.git$" path)
           (magit-status (file-name-directory path)))
          ((string-match-p "\\.hg$" path)
           (monky-status (file-name-directory path))))))
(define-key dired-mode-map "V" 'dired-vc-status)
