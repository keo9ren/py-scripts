;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package file-column-indicator
  :init (progn 
          (setq fci-rule-width 1) 
          (add-hook 'prog-mode-hook 'fci-mode)))
(provide 'fcimodesetup.el)
;;; fcimodesetup.el ends here
