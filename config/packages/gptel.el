;;; Copyright (C) 2025-2026  Sutou Kouhei <kou@clear-code.com>
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

;;; gptel
;;; 2025-10-02

;; 2026-10-27
(defvar local-gptel-make-backend nil
  "gptelのバックエンドを返す関数。このファイルを読み込む前に設定する。
gptelを読み込んだ後に引数なしで呼ばれる。例:

  (lambda ()
    (gptel-make-openai \"llama-cpp\"
      :stream t
      :protocol \"http\"
      :host \"localhost:8080\"
      :models \\='(llama-cpp-model)))

バックエンドの最初のモデルを使う。")

(use-package gptel
  :config
  (when local-gptel-make-backend
    (setq gptel-backend (funcall local-gptel-make-backend))
    (setq gptel-model (car (gptel-backend-models gptel-backend))))
  :bind (("C-c C-l" . gptel-menu)))
