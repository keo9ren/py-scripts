;;; package --- Summary
;;; commentary:
;;; Code:

(use-package flycheck
  :config (progn
            (add-hook 'after-init-hook #'global-flycheck-mode)
            (use-package flycheck-checkbashisms
              :config (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))
             )
            )
)

(provide 'flychecksetup.el)
;;; flychecksetup.el ends here
