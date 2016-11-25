;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package evil-smartparens
  :ensure t
  :init (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
)
(provide 'evilsmartparenssetup.el)
;;; evilsmartparenssetup.el ends here
