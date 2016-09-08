;;; package --- Summary
;;; commentary:
;;; Code:

(require 'package)
(use-package company
  :init (progn
          (add-hook 'after-init-hook 'global-company-mode)
          (setq company-minimum-prefix-length 1)
          (setq company-idle-delay 0.1)
          (use-package company-statistics
            :init (progn
            (company-statistics-mode)
            (company-quickhelp-mode 1)
            ))
          (use-package company-math)
          (use-package company-auctex)
          )
  :config (progn
            (defun my-init-mode-hooks ()
              "MY-INIT-MODE-HOOKS."
              (setq company-backends '((
                            company-files
                            company-dabbrev-code
                            company-dabbrev
                            company-oddmuse
                            company-capf
                            )))
              (semantic-mode t)
              )
            (add-hook 'after-init-hook #'my-init-mode-hooks)
          )
)

(provide 'companysetup.el)
;;; companysetup.el ends here
