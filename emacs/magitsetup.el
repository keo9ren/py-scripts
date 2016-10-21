;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package magit
             :commands magit
             :bind (("C-c m d" . magit-diff-popup)
                    ("C-c m s" . magit-status)
                    ("C-c m f" . magit-stage-file)
                    ("C-c m p" . magit-push)
                    )
             :config (
             add-hook 'after-save-hook 'magit-after-save-refresh-status
             ))
(use-package evil-magit)

(provide 'magitsetup.el)
;;; magitsetup.el ends here

