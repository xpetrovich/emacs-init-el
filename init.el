(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; (when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize) ;; You might already have this line

(setq required-pkgs '(auto-complete yasnippet multiple-cursors web-mode phi-search phi-search-mc expand-region))
  (require 'cl)  
  (setq pkgs-to-install       (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
 (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))  (when (> (length pkgs-to-install) 0)   (package-refresh-contents)   (dolist (pkg pkgs-to-install)     (package-install pkg))) 

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))


(require 'linum)

(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк


(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)


(phi-search-mc/setup-keys)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(setq search-highlight        t)
(setq query-replace-highlight t)

(electric-pair-mode 1)
(electric-indent-mode -1)

(tool-bar-mode -1)
(scroll-bar-mode -1)


;disable backup
(setq make-backup-files nil)
;disable auto save
(setq auto-save-default nil)
;;disable lock files
(setq create-lockfiles nil)

(remove-hook 'find-file-hooks 'vc-find-file-hook)

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) 

(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b


;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)


;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode            1)


;; YASnippets
(require 'yasnippet)
(yas-global-mode 1)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'". org-mode))
(global-font-lock-mode 1)

;; My remaps

;; (add-hook 'emmet-mode-hook
;;           (lambda ()
;;             ;; clearing old C-j and C-return key mapping.
;;             (define-key emmet-mode-keymap (kbd "C-j")        nil)
;;             (define-key emmet-mode-keymap (kbd "<C-return>") nil)
;;             ;; define new M-j key mapping instead.
;;             (define-key emmet-mode-keymap (kbd "M-j")        'emmet-expand-line)))


(global-unset-key (kbd "M-i")) ; indent-for-tab-command; this is tab key
(global-unset-key (kbd "M-j")) ; newline-and-indent
(global-unset-key (kbd "M-k")) ; kill-line
(global-unset-key (kbd "M-l")) ; recenter

(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)




;; (defun my-mode-hook ()
;;    (local-set-key (kbd "C-j") 'backward-char))
;; (add-hook 'lisp-interaction-mode-hook 'my-mode-hook)
