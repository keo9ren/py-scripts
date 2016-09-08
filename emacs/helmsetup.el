;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package helm
  :init (progn
    (require 'helm-config)
    (use-package helm-fuzzier
     :init (helm-fuzzier-mode 1)
     )
    (use-package helm-flx
     :init (helm-flx-mode 1)
    )
    (use-package helm-descbinds
      :init (helm-descbinds-mode)
    )
    (use-package helm-misc)
    (use-package helm-projectile)
    (use-package helm-locate)
    (setq helm-candidate-number-limit 100)
    (setq helm-input-idle-delay 0.01
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t
          helm-bookmark-show-location t
          helm-buffers-fuzzy-matching t
          helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t
          helm-ff-search-library-in-sexp t
          helm-scroll-amount 8
          helm-ff-file-name-history-use-recentf t
          helm-M-x-fuzzy-match t
          helm-semantic-fuzzy-match t
          helm-apropos-fuzzy-match t
          helm-lisp-fuzzy-completion t
          )
    (helm-mode)
    (define-key evil-normal-state-map (kbd "SPC") 'helm-do-ag-this-file)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action)
   )
  :bind (
         ("C-c h" . helm-command-prefix)
         ("C-c b" . helm-mini)
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("C-h SPC" . helm-all-mark-rings)
         ("C-c h x" . helm-register)
         ("C-c h @" . helm-package)
         )
  :config (when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))
)

(provide 'helmsetup.el)
;;; helmsetup.el ends here
