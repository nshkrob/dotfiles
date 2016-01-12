;; .emacs


;; (setq case-fold-search nil) ; make searches case sensitive
(setq case-fold-search t)   ; make searches case insensitive

(setq debug-on-error t)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;; ============================================================
;; Start of my config
;; ============================================================


(global-set-key "\C-w" 'backward-kill-word)

(global-set-key "\C-x\C-g" 'keyboard-quit)

;; Don't exit so easily.
(global-set-key "\C-x\C-c" nil)
;; Jump to file
(define-key global-map "\C-c>" 'find-file-at-point)

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [(control .)] 'tags-apropos)

;; Hardcore expand.
(global-set-key "\M-?" 'hippie-expand)

;; Cleanup whitespace
(global-set-key "\C-xt" 'delete-trailing-whitespace)

(global-set-key "\C-cm" 'compilation-shell-minor-mode)


;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace 'nil)

; Require final newline
(setq require-final-newline t)

(put 'scroll-left 'disabled nil)

;; Lose the UI!
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Real Python-mode
;; (load-file "~/.emacs.d/python-mode.el")

;; Window position and size for Macbook 13' screen.
;; Only in nextstep = OSX window system.
(if (eq window-system 'ns)
    (progn
      (set-frame-position (selected-frame) 1 25)
      (set-frame-height (selected-frame) 50)
      (set-frame-width (selected-frame) 170)
      (set-cursor-color "Black")
      (set-mouse-color "White")
      ))

;; (setq cursor-type '(hbar . 4))
;; (setq cursor-type 't)
;; (setq blink-cursor-mode 't)
;; (setq blink-cursor-interval 0.5)


(require 'ido)
(ido-mode t)

;; Turn the bell off
(setq ring-bell-function 'ignore)

;; One space after a period marks a sentence.
(setq sentence-end-double-space nil)

(setq load-path (cons "~/.emacs.d/" load-path))


;; Set longlines-mode to load as a hook whenever the text-mode minor mode is activated.
;; (add-hook 'text-mode-hook 'longlines-mode)
;; (add-hook 'text-mode-hook 'visual-line-mode)  ;; better than ll-mode.
;; This seems to fix long lines in the shell buffer.
(setq truncate-partial-width-windows nil)
;; Panda3d's C++ include files.
(setq auto-mode-alist (cons '("\\.I$" . c++-mode) auto-mode-alist))

(setq minor-mode-map-alist (cons '("\\.py$" . highlight-80+-mode) minor-mode-map-alist))

;; (require 'subword-mode)
(add-hook 'python-mode-hook 'subword-mode)

(add-hook 'c-mode-common-hook 'subword-mode)
;; (add-hook 'c-mode-common-hook 'highlight-80+-mode)


(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
		("\\.cc$" . c++-mode)
		("\\.cpp$" . c++-mode)
		("\\.c$"  . c-mode)   ; to edit C code
		("\\.h$"  . c-mode)   ; to edit C code
		("\\.hh$"  . c++-mode)
        ("\\.scs$"  . python-mode)
		) auto-mode-alist))

;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-vim-colors)))


;; (color-theme-calm-forest)
;; (color-theme-shaman)
;; (color-theme-xemacs)
;; (color-theme-standard)
;; (color-theme-vim-colors)

;;(require 'highlight-80+)
;; (highlight-80+-mode t)

;; Insread of the default (minimize), undo on Control-Z
(global-set-key "\C-z" 'undo)
;; Don't minimize, undo
(global-set-key "\C-x\C-z" 'undo)
;; (global-unset-key "\C-x\C-z")


;; Indent on newline
(global-set-key "\C-m" 'newline-and-indent)
;; Ruby mode needs a specific mention.
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))


(global-set-key [f1] 'shell)
(global-set-key [f2] 'rename-buffer)
(global-set-key [f3]
                '(lambda ()
                   (interactive)
                   (ansi-term "/bin/sh")
                   ))
;; Kill, no questions asked.
(global-set-key [f4] '(lambda ()
                        (interactive)
                        (kill-buffer nil)))

;; Phat Phingers
(global-set-key "\C-xi" 'other-window)
(global-set-key "\C-xp" 'other-window)

;; Spaces instead of tabs
(setq indent-tabs-mode nil)
;; Number of spaces
;; A single point of setting tab width
(setq my-tab-width 2)

(setq default-tab-width my-tab-width)
(setq-default c-indent-level my-tab-width)
(setq-default c-basic-offset my-tab-width)

(setq standard-indent my-tab-width)
;; C indentation
(setq c-default-style
      '((other . "bsd")))

;; Show parens
(show-paren-mode t)

;; Don't force me spell 'yes'.
;; (Warning: read all warnings.)
(fset 'yes-or-no-p 'y-or-n-p)

;; stop leaving backup~ files scattered everywhere
(setq backup-directory-alist '(("." . "~/.emacs-backups")))

;; (defun my-java-mode-hook ()
;;   (setq c-basic-offset 2)
;;   (setq subword-mode 1))
;; (add-hook 'java-mode-hook 'my-java-mode-hook)

;; Which function are we in?
(setq which-func-mode 't)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(set-frame-font "Monaco-12")
;; (set-frame-font "-*-monaco-*-*-*-*-*-*-*-*-*-*-*-*")
(set-face-attribute 'default nil :height 125)
;; C-x C-- (-, +, 0) - text-scale-adjust. Zoom text size up and down.

(setq transient-mark-mode nil)


;; Note on comint-scroll-to-bottom-on-output: When it's off (nil), we
;; still scroll to bottom if the cursor is at the bottom of shell
;; output. Otherwise, we don't scroll. So 'toggling' it is as easy as
;; moving cursort up.
(add-hook 'shell-mode-hook
          (function (lambda ()
                      (setq comint-scroll-to-bottom-on-input t)
                      ;; (setq comint-scroll-to-bottom-on-output t)
                      (setq comint-scroll-show-maximum-output t)
                      (compilation-shell-minor-mode 1)
                      (rename-buffer "shell" t)
                      (global-set-key "\C-cd" 'shell-resync-dirs)
                      ;; (global-set-key "\M-\r" 'shell-resync-dirs)
                      ;; C-c C-o is bound to delete input. But we can just jump to prev. prompt:
                      (local-set-key "\C-c\C-o" 'comint-previous-prompt)
                      )))

;; This may help resync dirs every time Enter is pressed.
;; (add-hook 'comint-input-filter-functions
;;           (lambda (input)
;;             (progn
;;               (message "Resyncing")
;;               (shell-resync-dirs)
;;               input)))

;; ansi-term - more like term than shell. M-x ansi-term
;; Upside: behaves more like the terminal (tab completion, Ctrl-R to search history...)
;; Downsides: can't copy stuff from the shell (lines are broken)
;; Also doesn't highlight errors in builds.

;; (defvar term-term-name "ansi"
;;   "Name to use for TERM.
;; Using \"emacs\" loses, because bash disables editing if $TERM == emacs.")
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)
            (rename-buffer "ansi-term" t)
            ;; (setenv "TERM" "ansi")
            ))

;; SHELL is /bin/false by default on Mac.
(setenv "SHELL" "/bin/bash")
(setenv "ESHELL" "/bin/bash")
(shell "/bin/bash")
(setq mac-command-modifier 'meta)


;; (list-colors-display)

(setq ansi-color-names-vector ; Replaces this:
      ["black"                ; black
       "red1"                 ; red
       "dark green"           ; green - username on prompt
       "OrangeRed2"           ; yellow
       "DodgerBlue3"          ; blue - ls files
       "magenta"              ; magenta - time on prompt
       "dark violet"          ; cyan
       "white"])              ; white

;; (defvar ansi-color-names-vector
;;   ["black" "red" "dark green" "dark violet" "blue" "magenta" "cyan" "white"])

;; Colors for ansi-term.
;; Apparently the ansi-color stuff got broken somewhere between 22-23-24.
;; Replace the ugly yellow with red3
(setq ansi-term-color-vector
      [unspecified
       "black"
       "red3"
       "green2"
       "blue3"
       "blue2"
       "magenta3"
       "cyan3"
       "white"])

;; Use the new colors. Used to work on some older emacs :P
;; (setq ansi-color-map (ansi-color-make-color-map))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; Actually display colors when programs output colored text.  Without
;; this command, emacs prints the actual control characters.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq-default term-buffer-maximum-size 0)


;; ORG mode
;; (require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)
;; Longlines mode messes with the timestamps
(add-hook 'org-mode-hook
          (function (lambda ()
                      ;; (longlines-mode -1)
                      (visual-line-mode 't))))
(setq org-todo-keywords
      '((sequence "TODO" "INREVIEW" "|" "DONE" "|" "BLOCKED" "WONTFIX")))

(setq org-agenda-files (list
                        "~/Documents/Current.org"
                        "~/Documents/Work.org"
                        "~/Documents/HR.org"
                        ))

(setq org-todo-keyword-faces
      '(
        ("INREVIEW" . (:foreground "dark violet" :weight bold))
        ("BLOCKED" . (:foreground "red" :weight bold))
        ("WONTFIX" . (:foreground "cyan3" :weight bold))
        ))



;; A convenient search-and-replace function. Modify as needed.
(defun search-and-repl-long () (interactive)
  (search-forward "long" nil t)
  (replace-match "int64" nil t))


;; No prompt when killing shells. Need this since 23.4.
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))


;; (require 'revive)
;; (add-hook 'kill-emacs-hook 'save-current-configuration)

;; Save config after idling for some time (seconds)
(run-with-idle-timer 600.0 t 'save-current-configuration)

;; To undo:
;; (cancel-function-timers 'save-current-configuration)
;; To restore, use M-x resume.

(require 'uniquify)
;;(require 'guess-offset)

;; Enable pasting from System copy buffer (Ctrl-C) in addition to the
;; X buffer (select with mouse)
(setq x-select-enable-clipboard t)


(global-set-key (kbd "M-L")
                (lambda ()
                  (interactive)
                  (insert "alias l='ls -lh --color'; alias lh='ls -lht --color | head'; alias vl='cd var/output/logs'")))

(global-set-key (kbd "M-H")
                (lambda ()
                  (interactive)
                  (insert "alias lh='ls -lht --color | head'")))

;; If more aliases are needed, check out abbrevs.


;; (comint-scroll-to-bottom-on-output
;; (setq comint-scroll-to-bottom-on-output nil)

(defun toggle-scroll-to-bottom () (interactive)
  (if comint-scroll-to-bottom-on-output
      (setq comint-scroll-to-bottom-on-output nil)
    ;; else
    (setq comint-scroll-to-bottom-on-output t)))

(global-set-key (kbd "C-c C-b")
                'toggle-scroll-to-bottom)

;; (global-set-key (kbd "C-l")
;;                 'recenter-top-bottom)

;; (load-file "/usr/local/share/emacs/23.4/lisp/net/tramp.elc")

;; IRC

(defun erc-popup-hook (match-type nick msg)
  "Shows a popup notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (when (eq match-type 'current-nick)
    (unless (posix-string-match "^\\** *Users on #" msg)
      (progn
        (message msg)
        (display-buffer (current-buffer))))))

(add-hook 'erc-text-matched-hook 'erc-popup-hook)

;; Easy moving of buffers.
;; (require 'buffer-move)
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)

(setq-default sh-indentation 2)

;; ==================== git grep ====================
(defcustom git-grep-switches "--extended-regexp -I -n --ignore-case "
  "Switches to pass to `git grep'."
  :type 'string)

(defcustom git-grep-default-work-tree (expand-file-name "~/work/adtrack")
  "Top of your favorite git working tree.  \\[git-grep] will search from here if it cannot figure out where else to look."
  :type 'directory
  )

(when (require 'vc-git nil t)

  ;; Uncomment this to try out the built-in-to-Emacs function.
  ;;(defalias 'git-grep 'vc-git-grep)

  (defun git-grep (command-args)
    (interactive
     (let ((root (vc-git-root default-directory)))
       (when (not root)
         (setq root git-grep-default-work-tree)
         (message "git-grep: %s doesn't look like a git working tree; searching from %s instead" default-directory root))
       (list (read-shell-command "Run git-grep (like this): "
                                 (format (concat
                                          "cd %s && "
                                          "git grep %s -e %s")
                                         root
                                         git-grep-switches
                                         (let ((thing (and

                                        ; don't snarf stuff from the
                                        ; buffer if we're not looking
                                        ; at a file.  Perhaps we
                                        ; should also check to see if
                                        ; the file is part of a git
                                        ; repo.
                                                       buffer-file-name
                                                       (thing-at-point 'symbol))))
                                           (or (and thing (progn
                                                            (set-text-properties 0 (length thing) nil thing)
                                                            (shell-quote-argument (regexp-quote thing))))
                                               "")))
                                 'git-grep-history))))
    (let ((grep-use-null-device nil))
      (grep command-args))))

(global-set-key (kbd "C->") 'git-grep)
;; ==================== /git grep ====================
