;; packages archives
;; set to tsinghua
(require 'package)
(setq package-list '(cnfonts autopair phi-search cmake-mode markdown-mode neotree git helm jedi-direx yasnippet-snippets web-server highlight-parentheses multiple-cursors company-jedi python-mode nyan-mode company))

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))
(package-initialize) ;; You might already have this line

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font t)
 '(package-selected-packages
   (quote
    (autopair cmake-mode markdown-mode neotree git helm jedi-direx yasnippet-snippets web-server highlight-parentheses multiple-cursors company-jedi python-mode nyan-mode company)))
 '(scalable-fonts-allowed t)
 '(tex-dvi-view-command
   (quote
    (cond
     ((eq window-system
          (quote x))
      "xdvi")
     ((eq window-system
          (quote w32))
      "dviout")
     (t "dvi2tty * | cat -s"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

;; company-mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-linum-mode)
(add-to-list 'company-backends 'company-jedi)

 ;; (add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
 ;; (add-hook 'python-mode-hook 'elpy-mode)


;; indent
(setq default-tab-width 4)
(setq c-default-style "linux")
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; jedi
;; (defun my/python-mode-hook ()
;;  (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

;; fonts
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono" ))
(set-face-attribute 'default t :font "DejaVu Sans Mono" )

;; desktop
;; (desktop-save-mode 1)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

(setq inhibit-startup-screen t
      initial-buffer-choice  nil)


;; highlight
(global-highlight-parentheses-mode t)
(autopair-global-mode)
(setq autopair-autowrap t)

(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
					(if autopair-handle-action-fns
						autopair-handle-action-fns
					  '(autopair-default-handle-action))
					'((lambda (action pair pos-before)
						(hl-paren-color-update)))))))

;; scroll
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(global-set-key (kbd "M-n") (quote scroll-up-line))
(global-set-key (kbd "M-p") (quote scroll-down-line))

;; desktop
(desktop-save-mode 1)

;; scratch
(defun create-scratch-buffer nil
       "create a scratch buffer"
       (interactive)
       (switch-to-buffer (get-buffer-create "*scratch*"))
       (lisp-interaction-mode))

(global-set-key (kbd "C-c n") 'create-scratch-buffer)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(require 'cnfonts)
(cnfonts-enable)

;;(eval-after-load "python"
;;  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
;;(add-hook 'jedi-mode-hook 'jedi-direx:setup)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

