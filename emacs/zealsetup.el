;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package zeal-at-point
:commands (zeal-at-point)
:config (global-set-key "\C-cd" 'zeal-at-point)
)

(provide 'zealsetup.el)
;;; zealsetup.el ends here
