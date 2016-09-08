;;; package --- Summary
;;; commentary:
;;; Code:
(require 'powerline)
(load-file "/home/oliver/.tools/scripts-and-more/emacs/airline-themes/airline-themes.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/airline-themes/airline-sol-theme.el")
(require 'airline-themes)
(setq airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)
(require 'moe-theme)
(moe-theme-set-color 'cyan)
(moe-dark)
(color-theme-approximate-on)
(load-theme 'airline-sol)
(setq airline-shortened-directory-length 5)
(setq airline-display-directory nil)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq inhibit-startup-message t)
(setq-default tab-width 4 indent-tabs-mode nil)
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(scroll-bar-mode -1)
;;;vim like indent
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
(provide 'style.el)
;;; style.el ends here
