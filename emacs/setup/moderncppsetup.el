;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package modern-cpp-font-lock
  :config (add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
       
)

(provide 'moderncppsetup.el)
;;; moderncppsetup.el ends here
