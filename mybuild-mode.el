;;; mybuild-mode.el --- Major mode for editing Mybuild files from Embox  -*- lexical-binding: t; -*-

;; Copyright (c) 2022 Evgeny Simonenko

;; Author: Evgeny Simonenko <easimonenko@gmail.com>
;; Keywords: languages
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))
;; Created: August 2022
;; URL: https://github.com/easimonenko/mybuild-mode
;; Repository: https://github.com/easimonenko/mybuild-mode

;;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Major mode for editing Mybuild files from Embox operating system

;;; Code:

(defvar mybuild-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for `mybuild-mode'.")

(defvar mybuild-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?@ "w" st)
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\( "()" st)
    (modify-syntax-entry ?\) ")(" st)
    (modify-syntax-entry ?\/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for `mybuild-mode'.")

(defvar mybuild-keywords
  '("package" "import" "annotation" "interface" "extends" "feature" "module"
    "static" "abstract" "depends" "provides" "requires" "source" "object" "option"))

(defvar mybuild-types
  '("string" "number" "boolean"))

(defvar mybuild-constants
  '("true" "false"))

(defvar mybuild-highlights
  `(("'''[^z-a]*?'''" . 'font-lock-string-face)
    ("@[A-Za-z][A-Za-z0-9-+_]*" . 'font-lock-preprocessor-face)
    ( ,(regexp-opt mybuild-keywords 'words) . 'font-lock-keyword-face)
    ( ,(regexp-opt mybuild-types 'words) . 'font-lock-type-face)
    ( ,(regexp-opt mybuild-constants 'words) . 'font-lock-constant-face)
    ("[A-Za-z][A-Za-z0-9-+/_]*" . 'font-lock-function-name-face))
  "Mybuild syntax highlighting with `'font-lock-mode'.")

;;;###autoload
(define-derived-mode mybuild-mode c-mode "Mybuild"
  "Major mode for editing Mybuild files from Embox operating system."
  :syntax-table mybuild-mode-syntax-table
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local indent-tabs-mode nil)
  (setq-local font-lock-defaults '(mybuild-highlights)))

;;;###autoload
(add-to-list 'auto-mode-alist '("/Mybuild\\'" . mybuild-mode))

(provide 'mybuild-mode)
;;; mybuild-mode.el ends here
