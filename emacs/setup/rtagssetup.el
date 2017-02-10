;;; package --- Summary
;;; commentary:
;;; Code:
(load-file "/usr/share/emacs/site-lisp/rtags/rtags.el")
(load-file "/usr/share/emacs/site-lisp/rtags/company-rtags.el")
(load-file "/usr/share/emacs/site-lisp/rtags/flycheck-rtags.el")
(require 'use-package)
(use-package 
  rtags 
  :commands rtags 
  :bind(("C-c r s" . rtags-display-summary) 
        ("C-c r f" . rtags-find-symbol) 
        ("C-c r n" . rtags-rename-symbol) 
        ("C-c r r" . rtags-find-references) 
        ("C-c r v" . rtags-find-virtuals-at-point)))
(provide 'rtagssetup.el)
;;; rtagssetup.el ends here
