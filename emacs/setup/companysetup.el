;;; package --- Summary
;;; commentary:
;;; Code:

(require 'package)
(use-package 
  company 
  :init (progn (add-hook 'after-init-hook
                         'global-company-mode) 
               (setq company-minimum-prefix-length 1) 
               (setq company-idle-delay 0.1) 
               (use-package 
                 company-statistics 
                 :init (progn (company-statistics-mode) 
                              (company-quickhelp-mode 1))) 
               (use-package 
                 company-math) 
               (use-package 
                 company-auctex) 
               (add-hook 'emacs-lisp-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-dabbrev-code company-files
                                                                                     company-oddmuse
                                                                                     company-capf)))))))
(provide 'companysetup.el)
;;; companysetup.el ends here
