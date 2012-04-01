;;show file in title
(setq frame-title-format '("%f"))

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;;highlight current line
(require 'hl-line)
(global-hl-line-mode t)

;;screen set
(setq default-frame-alist '((top . 1) (left . 1) (height . 29) (width . 117)))

;;ido
(require 'ido)
(setq ido-confirm-unique-completion t)
(setq ido-default-buffer-method 'samewindow)
(setq ido-use-filename-at-point t)
(setq ido-enable-flex-matching t)
(ido-mode t)
(ido-everywhere t)
(set-face-background 'ido-first-match "green")
(set-face-foreground 'ido-subdir "blue3")
(setq ido-enable-flex-matching t)
;;cursor
(setq-default cursor-type 'bar) 

;;copy to other place
(setq x-select-enable-clipboard t)

;;no backup file
(setq make-backup-files nil)

;;twilight theme
(setq load-path (cons "~/.emacs.d/themes" load-path))
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-twilight.el")
(color-theme-twilight)
;;(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
;;(color-theme-railscasts)


;;ecb
(load-file "~/.emacs.d/cedet/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(setq load-path (cons "~/.emacs.d/ecb" load-path))
(require 'ecb)
(setq ecb-auto-activate t)
(add-hook 'ecb-activate-hook 
          '(lambda() 
             (setq ecb-auto-activate t
		   ecb-tip-of-the-day nil
		   )))

;;better copy
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))


;;add one line 
(global-set-key (kbd "s-l")
		'(lambda ()(interactive)(end-of-line 1)(newline-and-indent)))

;;ruby on rails
(setq load-path (cons "~/.emacs.d/ruby" load-path))
(setq load-path (cons "~/.emacs.d/rails" load-path))
(require 'rails)

;;flymake
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;;smart-compile
(require 'smart-compile)

;;run
(setq smart-compile-alist
      '( ("\\.rb$" . "spec %f")))
(global-set-key [(f5)] 'smart-compile)


(add-to-list 'load-path "~/.emacs.d/rhtml-mode")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  '(lambda ()
	     (auto-fill-mode -1)))

;;yaml
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;kill-this-buffer
(global-set-key [(f12)] 'kill-this-buffer)

;; Rinari
(setq load-path (cons "~/.emacs.d/rinari" load-path))
(require 'rinari)
(global-set-key (kbd "s-c") 'rinari-find-controller)
(global-set-key (kbd "s-m") 'rinari-find-model)
(global-set-key (kbd "s-v") 'rinari-find-view)
(global-set-key (kbd "s-h") 'rinari-find-helper)
(global-set-key (kbd "s-s") 'rinari-find-rspec)
(global-set-key (kbd "s-f") 'rinari-find-file-in-project)

;; kill all rinari buffers
(defun kill-buffers-in-subdir (subdir buffer)
  "Kills the given buffer if it is linked to a file in the current rinari project."
  (if (buffer-in-subdir-p subdir buffer)
      (kill-buffer buffer)))
(defun buffer-in-subdir-p (subdir buffer)
  "Returns true if buffer belongs to the current rinari project"
  (and (buffer-file-name buffer)
       (string-match subdir (buffer-file-name buffer))))

(defun kill-all-rinari-buffers ()
  "Kills all buffers linked to the current rinari project"
  (interactive)
  (let ((path (rinari-root)))
    (if path
	(dolist (buffer (buffer-list))
	  (kill-buffers-in-subdir path buffer)))))
(global-set-key [(C-f12)] 'kill-all-rinari-buffers)

;;goto line
(global-set-key (kbd "s-g") 'goto-line)

;;commit
(global-set-key (kbd "s-o") 'comment-region)
(global-set-key (kbd "s-u") 'uncomment-region)

;;code toggle
(global-set-key (kbd "s-h") 'hs-hide-all) 
(global-set-key (kbd "s-s") 'hs-show-all)
(global-set-key (kbd "s-t") 'hs-toggle-hiding)
(global-set-key [(f8)] 'ecb-toggle-ecb-windows)

;; Rspec
(load-file "~/.emacs.d/rspec/rspec-mode.el")
(require 'rspec-mode)
(local-set-key (kbd "s-z") 'rspec-toggle-spec-and-target)

;;most popular
(global-set-key (kbd "C-c C-c C-s") 'tags-search)
(global-set-key (kbd "C-c C-c C-n") 'tags-loop-continue)
(global-set-key (kbd "C-c C-c C-c") 'rinari-find-controller)
(global-set-key (kbd "C-c C-c C-m") 'rinari-find-model)
(global-set-key (kbd "C-c C-c C-v") 'rinari-find-view)
(global-set-key (kbd "C-c C-c C-r") 'rinari-find-rspec)
(global-set-key (kbd "C-c C-c C-f") 'rinari-find-file-in-project)
(global-set-key (kbd "C-c C-c C-h") 'hs-hide-all) 
(global-set-key (kbd "C-c C-c C-t") 'hs-toggle-hiding)
(global-set-key (kbd "C-c C-c C-o") 'comment-region)
(global-set-key (kbd "C-c C-c C-u") 'uncomment-region)
(global-set-key (kbd "C-c C-c C-g") 'goto-line)


(load-file "~/.emacs.d/others/browse-kill-ring.el")
(require 'browse-kill-ring)
(global-set-key (kbd "s-p") 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(load-file "~/.emacs.d/others/browse-kill-ring.el")
(require 'browse-kill-ring)
(global-set-key (kbd "C-c C-c C-p") 'browse-kill-ring)
(browse-kill-ring-default-keybindings)




;; (add-to-list 'load-path "~/.emacs.d/ruby-complexity/")
;; (require 'linum)
;; (require 'ruby-complexity)
;; (add-hook 'ruby-mode-hook
;; 	  (function (lambda ()
;; 		      (flymake-mode)
;; 		      (linum-mode)
;; 		      (ruby-complexity-mode))))




(global-set-key [f11] 'my-fullscreen)

;全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)