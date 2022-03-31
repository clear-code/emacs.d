;;; Copyright (C) 2022  Sutou Kouhei <kou@clear-code.com>
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

;;; Ivy mode
;;; 2022-03-28

(package-ensure-install 'ivy)
(package-ensure-install 'counsel)
(package-ensure-install 'swiper)

;; 最近開いたファイルやブックマークなどすべての仮想バッファーを使う。
;; 2022-03-28
(setq ivy-use-virtual-buffers t)

;; マッチした数だけではなく現在何番目のマッチを見ているかも表示する。
;; 2022-03-28
(setq ivy-count-format "(%d/%d) ")


;; もろもろにIvyを使う。
;; 2022-03-31
(ivy-mode 1)

;; もろもろにCounselを使う。
;; 2022-03-31
(counsel-mode 1)

;; isearchの代わりにSwiperを使う。
;; 2022-03-28
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-r") 'swiper-isearch-backward)

;; switch-bufferにIvyを使う。
;; 2022-03-28
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

;; Ivyの表示をリッチにする。
;; 2022-03-31
(package-ensure-install 'ivy-rich)
(ivy-rich-mode 1)
