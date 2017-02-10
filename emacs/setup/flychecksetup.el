;;; package --- Summary
;;; commentary:
;;; Code:

(use-package flycheck
  :config (progn
            (add-hook 'after-init-hook #'global-flycheck-mode)
            (setq-default flycheck-disabled-checkers
                   (append flycheck-disabled-checkers '(javascript-jshint)))
            ;(flycheck-add-mode 'json-python-json 'web-mode)
            ;(flycheck-add-mode 'jshint 'web-mode)
            (flycheck-add-mode 'typescript-tslint 'web-mode)
            (flycheck-add-mode 'sass/scss-sass-lint 'web-mode)
            (flycheck-add-mode 'sass/scss-sass-lint 'web-mode)
            (flycheck-add-mode 'html-tidy 'web-mode)
            (flycheck-add-mode 'css-csslint 'web-mode)
            (use-package flycheck-checkbashisms
              :config (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))
             )
            )
)

(provide 'flychecksetup.el)
;;; flychecksetup.el ends here
