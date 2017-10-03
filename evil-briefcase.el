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
