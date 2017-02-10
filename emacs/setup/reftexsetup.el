;;; package --- Summary
;;; commentary:
;;; Code:

(require 'use-package)
(use-package reftex
  :config (progn
            (add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
            (add-hook 'latex-mode-hook 'turn-on-reftex) 
            (setq reftex-plug-into-AUCTeX t)
            (setq reftex-external-file-finders
                  '(("tex" . "kpsewhich -format=.tex %f")
                    ("bib" . "kpsewhich -format=.bib %f")))
            (custom-set-faces)
            ))

(provide 'reftexsetup.el)
;;; reftexsetup.el ends here
