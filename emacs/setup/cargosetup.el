;;; package --- Summary
;;; commentary:
;;; Code:
(require 'package)
(use-package cargo
  :init (add-hook 'rust-mode-hook #'cargo-minor-mode)
)
(provide 'cargosetup.el)
;;; cargosetup.el ends here
