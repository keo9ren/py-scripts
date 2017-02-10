;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package systemd
  :ensure t
  :init (add-hook 'systemd-mode-hook #'company-mode)
)
(provide 'systemdsetup.el)
;;; systemdsetup.el ends here
