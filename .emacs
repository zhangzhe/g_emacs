(custom-set-variables
 '(case-fold-search nil)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(ecb-layout-name "smart")
 '(ecb-layout-window-sizes (quote (("smart" (0.32 . 2.4029629629629627)))))
 '(ecb-options-version "2.40")
 '(global-font-lock-mode t nil (font-lock))
 '(initial-buffer-choice "~/idapted")
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 40) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-show-unknown-files t)
 '(speedbar-track-mouse-flag t)
 '(speedbar-use-tool-tips-flag nil)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(load "~/.emacs.d/my-custom.el")

;;Monaco
(set-default-font "Monaco:pixelsize=18")
(set-fontset-font (frame-parameter nil 'font) 'han
                  (font-spec :family "WenQuanYi Zen Hei" :size 18))
