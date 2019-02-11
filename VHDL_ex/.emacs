;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Set up cua mode

(package-initialize)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Optional config
;;Vline mode
(load "~/share/Init/vline")
(require 'vline)

;;Auto-complete-mode
(load "~/share/Init/auto-complete")
(require 'auto-complete)
(setq global-auto-complete-mode 1)
(global-auto-complete-mode t)

;;Verilog auto-complete-mode
(load "~/share/Init/auto-verilog")
(require 'auto-complete-verilog)
(setq auto-complete-verilog 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Load theme
(load "~/share/Init/emacs_theme/dash")
(require 'dash)

(load "~/share/Init/emacs_theme/solarized")
(require 'solarized)

;;Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'after-init-hook (lambda () (load-theme 'manoj-dark)))
(load-theme 'manoj-dark t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Emacs config

;; Jump a pointer to another workspace
;; If u use emacs terminal, they are useful
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "S-<home>") 'beginning-of-buffer)

;;Resize windowns (move cursor)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<up>") 'enlarge-window)

;;Optional key
(global-set-key (kbd "C-d") 'highlight-regexp)
(global-auto-revert-mode 1)				;; auto save file
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)						;; enable ido mode by default
(global-set-key (kbd "C-x g") 'goto-line)		;; goto-line 
(setq make-backup-files nil)				;; Do not creat copye file~
(setq show-paren-style 'parenthesis)			;; highlight parenthesis 
(show-paren-mode 1)
(global-set-key (kbd "C-c q") 'comment-region)		;; comment code
(global-set-key (kbd "C-c a") 'uncomment-region)	;; uncomment code
(define-key input-decode-map "\e[1;2H" [S-home])
(define-key input-decode-map "\e[1;2F" [S-end]) 
(setq column-number-mode 1)
(global-set-key (kbd "C-c C-m") 'shell-script-mode)

;; Need to install package before
(global-set-key (kbd "C-y") 'auto-complete-mode)	;; enable auto-complete-mode 
(global-set-key (kbd "C-l") 'hl-line-mode)		;; highlight current line
(global-set-key (kbd "C-n") 'vline-mode)		;; enable vline-mode



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;File identified
(setq auto-mode-alist (cons  '("\\.svh\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.svn-base\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.svhp\\'" . verilog-mode) auto-mode-alist))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
