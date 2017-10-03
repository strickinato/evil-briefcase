;;; evil-briefcase.el --- Switch cases super easily in visual mode

;; Copyright (C) 2017-2017 Aaron Strick

;; Author: Aaron Strick <aaronstrick@gmail.com>
;; Version: 0.0.1
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

(use-package evil-macros)
(use-package s)

(evil-define-operator evil-briefcase-camel (beg end type)
  "Convert to camel"
  (if (eq type 'block)
      (evil-apply-on-block #'evil-upcase beg end nil)
      (let ((str (s-lower-camel-case (buffer-substring-no-properties beg end)))
           )
        (progn
          (delete-region beg end)
          (insert str)))))
