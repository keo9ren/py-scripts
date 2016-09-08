;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(require 'cl)
(use-package yasnippet
  :diminish yas-minor-mode
  :init (yas-global-mode)
  :config (progn
           (yas-global-mode)
           (setq yas-snippet-dirs (append yas-snippet-dirs '("~/.tools/scripts-and-more/emacs/yasnippet/")))
           (yas-reload-all)
           (setq yas-indent-line (quote none))
           )
)
(provide 'yassetup.el)
;;; yassetup.el ends here
