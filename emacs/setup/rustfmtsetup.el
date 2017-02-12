;;; package --- Summary
;;; commentary:
;;; Code:
(require 'package)
(use-package rustfmt
  :init (add-hook 'rust-mode-hook (lambda () (local-set-key (kbd "C-c <tab>" )#'
                                                            rust-format-buffer)))
)
(provide 'rustfmtsetup.el)
;;; rustfmtsetup.el ends here
