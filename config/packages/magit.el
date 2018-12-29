;;; Copyright (C) 2012-2015  Kouhei Sutou <kou@clear-code.com>
;;; Copyright (C) 2012  yuta yamada <sleepboy.zzz@gmail.com>
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

;;; Magit
;;; 2012-03-23

(package-ensure-install 'magit)

;; コミットメッセージをHelmで挿入できるようにする
(defvar helm-c-source-git-commit-messages
  '((name . "Git Commit Messages")
    (candidates . helm-c-git-commit-messages-candidates)
    (action . (("Insert" . (lambda (str) (insert str)))))
    (migemo)
    (multiline))
  "Source for browsing and inserting commit messages.")

(defun helm-c-git-commit-messages-candidates ()
  (let* ((messages-string
          (shell-command-to-string "\\git \\log -50 --format=\"%x00%B\""))
         (raw-messages (string-to-list (split-string messages-string "\0")))
         (messages (mapcar (lambda (raw-message)
                             (string-strip raw-message))
                           raw-messages)))
    (remove-if (lambda (message)
                 (string-equal message ""))
               messages)))

(defun helm-git-commit-messages ()
  "`helm' for git commit messages."
  (interactive)
  (helm-other-buffer 'helm-c-source-git-commit-messages
                     "*helm commit messages*"))

(defun magit-enable-helm ()
  ;; 過去のコミットメッセージを挿入
  (define-key git-commit-mode-map
    (kbd "C-c i") 'helm-git-commit-messages))
(add-hook 'magit-mode-hook 'magit-enable-helm)

;; diff関連の設定
;; 2012-04-02
(defun magit-setup-diff ()
  ;; diffを表示しているときに文字単位での変更箇所も強調表示する
  ;; 'allではなくtにすると現在選択中のhunkのみ強調表示する
  ;; 2012-04-02
  (setq magit-diff-refine-hunk 'all))
(add-hook 'magit-mode-hook 'magit-setup-diff)

;; push関連の設定
;; 2015-08-17
(defun magit-setup-push ()
  ;; pushするときに確認しない
  ;; pushするときは現在のブランチのみをpushする
  ;; 2015-08-17
  (setq magit-push-always-verify nil))
(add-hook 'magit-mode-hook 'magit-setup-push)
