;;; package --- Summary
;;; commentary:
;;; Code:
(require 'package)
(use-package rust-mode
  :init(progn
        (setq rust-rustfmt-bin "rustfmt")
        (setq rust-format-on-save t)
        )
)
(provide 'rustmodesetup.el)
;;; rustmodesetup.el ends here
