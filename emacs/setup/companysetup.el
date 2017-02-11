;;; package --- Summary
;;; commentary:
;;; Code:

(require 'package)
(use-package company 
  :init (progn (add-hook 'after-init-hook 'global-company-mode) 
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
                                                                                     company-capf)))))
               (add-hook 'text-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-ispell company-files
                                                                                     company-dabbrev)))))
               (add-hook 'latex-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-auctex
                                                                company-auctex-bib-candidates
                                                                company-auctex-bibs
                                                                company-math-symbols-latex
                                                                company-math-symbols-unicode
                                                                company-latex-commands
                                                                                     company-dabbrev)))))

               (add-hook 'cmake-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-cmake
                                                                                     company-dabbrev)))))
               (add-hook 'org-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-dabbrev)))))
               (add-hook 'octave-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-dabbrev)))))
               (add-hook 'python-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-jedi company-dabbrev-code)))))
               (add-hook 'nxml-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-nxml company-dabbrev-code)))))
               (add-hook 'shell-mode-hook (lambda () 
                                                 (setq-local company-backends
                                                             '((company-files company-shell company-dabbrev-code)))))


                         ))

(provide 'companysetup.el)
;;; companysetup.el ends here
