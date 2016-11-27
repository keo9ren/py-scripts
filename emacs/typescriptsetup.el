;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package tide
             :commands tide
             :bind ()
             :config (add-hook 'web-mode-hook
                                (lambda ()
                                  (when (string-equal "jsx" (file-name-extension buffer-file-name))
                                    (setup-tide-mode)))))

(provide 'typescriptsetup.el)
;;; typescriptsetup.el ends here
