;;; package --- Summary
;;; commentary:
;;; Code:
(require 'magit)
(require 'evil-magit)
(global-unset-key (kbd "C-c m d"))
(global-set-key (kbd "C-c m d") 'magit-diff-popup)
(global-unset-key (kbd "C-c m s"))
(global-set-key (kbd "C-c m s") 'magit-status)
(global-unset-key (kbd "C-c m f"))
(global-set-key (kbd "C-c m f") 'magit-stage-file)
(global-unset-key (kbd "C-c m p"))
(global-set-key (kbd "C-c m p") 'magit-push)
(add-hook 'after-save-hook 'magit-after-save-refresh-status)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
(provide 'magitsetup.el)
;;; magitsetup.el ends here

