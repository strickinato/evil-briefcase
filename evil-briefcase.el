;;; evil-briefcase.el --- Switch cases super easily in visual mode

;; Copyright (C) 2017-2017 Aaron Strick

;; Author: Aaron Strick <aaronstrick@gmail.com>
;; Version: 0.0.1
;; Package-Requires: ((evil "1.2.13") (s "1.12.0"))
;; Keywords: strings, evil

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; All credit to @magnars for the amazing https://github.com/magnars/s.el
;;; And to the https://github.com/emacs-evil team!

;;; Code:

(require 'evil-macros)
(require 'evil-core)
(require 's)

(evil-define-operator evil-briefcase-camel-upper (beg end type)
  "Convert text to CamelCase with a Capital C"
  (if (eq type 'block)
      (evil-apply-on-block #'s-upper-camel-case beg end nil)
      (let ((str (s-upper-camel-case (buffer-substring-no-properties beg end)))
           )
        (progn
          (delete-region beg end)
          (insert str)))))

(evil-define-operator evil-briefcase-camel-lower (beg end type)
  "Convert text to camelCase with a small C"
  (if (eq type 'block)
      (evil-apply-on-block #'s-lower-camel-case beg end nil)
    (let ((str (s-lower-camel-case (buffer-substring-no-properties beg end)))
          )
      (progn
        (delete-region beg end)
        (insert str)))))

(evil-define-operator evil-briefcase-snake-lower (beg end type)
  "Convert text to snake_case, slithering"
  (if (eq type 'block)
      (evil-apply-on-block #'s-snake-case beg end nil)
    (let ((str (s-snake-case (buffer-substring-no-properties beg end)))
          )
      (progn
        (delete-region beg end)
        (insert str)))))

(evil-define-operator evil-briefcase-snake-upper (beg end type)
  "Convert text to SNAKE_CASE, AKA SCREAMING_SNAKE_CASE"
  (if (eq type 'block)
      (evil-apply-on-block #'s-snake-case beg end nil)
    (let ((str (s-upcase (s-snake-case (buffer-substring-no-properties beg end))))
          )
      (progn
        (delete-region beg end)
        (insert str)))))

(evil-define-operator evil-briefcase-kebab-upper (beg end type)
  "Convert text to KEBAB-KASE, mmmm... THICK MEAT"
  (if (eq type 'block)
      (evil-apply-on-block #'s-dashed-words beg end nil)
    (let ((str (s-dashed-words (buffer-substring-no-properties beg end)))
          )
      (progn
        (delete-region beg end)
        (insert (upcase str))))))

(evil-define-operator evil-briefcase-kebab-lower (beg end type)
  "Convert text to kebab-kase, mmmm... hyphens"
  (if (eq type 'block)
      (evil-apply-on-block #'s-dashed-words beg end nil)
    (let ((str (s-dashed-words (buffer-substring-no-properties beg end)))
          )
      (progn
        (delete-region beg end)
        (insert str)))))

(defvar evil-briefcase-mode-map
  (let ((map (make-sparse-keymap)))
    (evil-define-key* '(normal motion visual) map "zC" #'evil-briefcase-camel-upper)
    (evil-define-key* '(normal motion visual) map "zc" #'evil-briefcase-camel-lower)
    (evil-define-key* '(normal motion visual) map "zS" #'evil-briefcase-snake-upper)
    (evil-define-key* '(normal motion visual) map "zs" #'evil-briefcase-snake-lower)
    (evil-define-key* '(normal motion visual) map "zK" #'evil-briefcase-kebab-upper)
    (evil-define-key* '(normal motion visual) map "zk" #'evil-briefcase-kebab-lower)
    map))

;;;###autoload
(define-minor-mode evil-briefcase-mode
  :lighter " evil-briefcase"
  )

(provide 'evil-briefcase)
;;; evil-briefcase.el ends here
