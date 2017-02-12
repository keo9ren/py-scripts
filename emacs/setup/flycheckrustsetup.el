;;; package --- Summary
;;; commentary:
;;; Code:
(require 'package)
(use-package flycheck-rust
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
)
(provide 'flycheckrustsetup.el)
;;; flycheckrustsetup.el ends here
