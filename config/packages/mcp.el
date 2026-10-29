;;; Copyright (C) 2026  Sutou Kouhei <kou@clear-code.com>
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

;;; MCP
;;; 2026-10-29

;; config/packages/gptelの後に読み込むとgptelからMCPのツールを使える
;; MCPサーバーはmcp-hub-serversで指定する

(use-package mcp
  :defer t)

;; gptelを読み込んだらMCPのツールを有効にする
(with-eval-after-load 'gptel
  (when (bound-and-true-p mcp-hub-servers)
    (require 'gptel-integrations)
    (gptel-mcp-connect (mapcar #'car mcp-hub-servers))))
