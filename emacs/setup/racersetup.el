;;; package --- Summary
;;; commentary:
;;; Code:
(require 'package)
(use-package racer
  :init (progn (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
               ;(setq racer-rust-src-path "~/.rustSource/rust/src") ;; Rust source code PATH
               (add-hook 'rust-mode-hook #'racer-mode)
               (add-hook 'racer-mode-hook #'eldoc-mode)
               (add-hook 'racer-mode-hook #'company-mode))
)
(provide 'racersetup.el)
;;; racersetup.el ends here
