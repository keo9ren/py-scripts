;;; package --- Summary
;;; commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    ((engine-omega "dvi2tty")
     ((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-html "xdg-open")
     (engine-omega "dvi2tty")
     (output-pdf "Okular"))))
 '(custom-safe-themes
   (quote
    ("8e7ca85479dab486e15e0119f2948ba7ffcaa0ef161b3facb8103fb06f93b428" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "878e22a7fe00ca4faba87b4f16bc269b8d2be5409d1c513bb7eda025da7c1cf4" default)))
 '(doc-view-continuous t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (octave)))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-flags-c "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c++ "-I/usr/include/c++/5" "-I/usr/include/x86_64-linux-gnu/c++/5" "-I/usr/include/c++/5/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/t/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c "-I/usr/lib/gcc/arm-none-eabi/4.9.3/include" "-I/usr/lib/gcc/arm-none-eabi/4.9.3/include-fixed" "-I/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/include")
     (cmake-ide-flags-c++ "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6/arm-linux-gnueabihf/." "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6/backward" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include")
     (cmake-ide-build-dir . "build")
     (cmake-ide-flags-c++ "-I/usr/include/c++/6" "-I/usr/include/x86_64-linux-gnu/c++/6" "-I/usr/include/c++/6/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include")
     (cmake-ide-dir . "build")
     (cmake-ide-flags-c++ quote
                          ("-I/usr/include/c++/6" "-I/usr/include/x86_64-linux-gnu/c++/6" "-I/usr/include/c++/6/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include"))
     (cmake-ide-flags-c quote
                        ("-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include"))))))

(provide 'customvarsetup.el)
;;;customvarsetup.el ends here
