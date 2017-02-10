;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package org
  :bind ("\C-cl" . org-store-link)
        ("\C-ca" . org-agenda)
  :config (setq org-log-done t)
)

(provide 'orgsetup.el)
;;; orgsetup.el ends here
