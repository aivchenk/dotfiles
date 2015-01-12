;; .emacs configuration file

;; aivchenk version


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading libs that I use. Keep in mind that you need to download them separately ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; Auto-complete
;; (add-to-list 'load-path "~/emacs/auto-complete-1.3.1/")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/emacs/auto-complete-1.3.1/dict")
;; (ac-config-default)

;; ;; Git stuff (mo-git)
;; (add-to-list 'load-path "~/emacs/mo-git-blame.el")
;; (autoload 'mo-git-blame-file "~/emacs/mo-git-blame.el" nil t)
;; (autoload 'mo-git-blame-current "~/emacs/mo-git-blame.el" nil t)


;; ;; dwarf mode
;; (autoload 'dwarf-mode "~/emacs/dwarf-mode.el" nil t)

;; Add marmalade-repo to list of archives
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; open shell
(require 'shell-pop)

;; key quiz
(require 'keywiz)

;;;;;;;;;;;;;
;; Hotkeys ;;
;;;;;;;;;;;;;

(global-set-key [f1] 'revert-buffer)
(global-set-key [f2] 'cs-get-symbol-global-def)

(global-set-key [f5] 'goto-line)
(global-set-key [f6] 'whitespace-mode)
(global-set-key [f8] 'toggle-truncate-lines)


(global-set-key [f9] 'replace-regexp)
(global-set-key [f10] 'search-word-under-cursor-forward)
(global-set-key [f11] 'shell-pop)
(global-set-key [f12] 'search-word-under-cursor-backward)

(global-set-key "\C-s" 'isearch-forward-regexp )
(global-set-key "\C-r" 'isearch-backward-regexp)
;; Why is it here? (global-set-key "\C-f" 'fill-region)

;; cscope
(define-key global-map [(ctrl f3)] 'cscope-set-initial-directory)
(define-key global-map [(ctrl f4)] 'cscope-unset-initial-directory)
(define-key global-map [(ctrl f5)] 'cscope-find-this-symbol)
(define-key global-map [(ctrl f6)] 'cscope-find-global-definition)
(define-key global-map [(ctrl f7)] 'cscope-find-global-definition-no-prompting)
(define-key global-map [(ctrl f8)] 'cscope-pop-mark)
(define-key global-map [(ctrl f9)] 'cscope-next-symbol)
(define-key global-map [(ctrl f10)] 'cscope-next-file)
(define-key global-map [(ctrl f11)] 'cscope-prev-symbol)
(define-key global-map [(ctrl f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)] 'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)

;;;;;;;;;;;;
;; cscope ;;
;;;;;;;;;;;;


(require 'xcscope)
(setq cscope-do-not-update-database t)

;;;;;;;;;;;;;;;;;;;
;; Some settings ;;
;;;;;;;;;;;;;;;;;;;
;; Type 'y' instead of 'yes'
(fset  'yes-or-no-p 'y-or-n-p)
;; Display line and column
(setq-default line-number-mode t)
(setq-default column-number-mode t)
;; Delete is 'delete' and Backspace is 'backspace' ffs
(normal-erase-is-backspace-mode 0)
;; Define meta-key the right way
(setq keyboard-type 'xterm)
;; Make pretty indendation when commening intended code.
(setq comment-style 'indent)
;; Disable welcome msg
(setq inhibit-startup-message t)

;;;; My Info
(setq user-full-name "Alexander Ivchenko")

;;;; Some C stuff
(setq c-indent-level               4)
(setq c-continued-statement-offset 4)
(setq c-argdecl-indent             0)
(setq c-brace-offset              -4)
(setq c-continued-brace-offset    -4)
(setq c-brace-imaginary-offset     0)
(setq c-label-offset              -4)
(setq c-auto-newline             nil)
(setq comment-multi-line           t)

;;;; Open .md files in lisp mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . lisp-mode))

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote (RCS  SCCS Bzr Git Hg Mtn Arch)))


;;;; Shell settings
;; This way, bash doesn’t get ^M from Emacs, but Emacs removes ^M it
;; gets from bash. (no annoying ^M)
(add-to-list 'process-coding-system-alist
	     '("bash" . (undecided-dos . undecided-unix)))

(add-hook 'comint-output-filter-functions
	  'comint-strip-ctrl-m)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "744a6f01cd749bbbbe284898415899621792a217f63577bc41e5b15ba8fcee27" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "e83c94a6bfab82536cef63610ec58d08dfddd27752d860763055daf58d028aad" default)))
 '(shell-pop-default-directory default-directory)
 '(shell-pop-shell-type (quote ("shell" "*shell*" (lambda nil (shell shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-window-height 30)
 '(shell-pop-window-position "bottom"))


;;;; Saving backups
;; It is annoying that they go in the same directory as the file
;; you're editing, but that is easy to change. You can make all
;; backup files go into a directory by putting something like the
;; following in your
(setq backup-directory-alist `(("." . "~/emacs.bckp/")))

;; There are a number of arcane details associated with how Emacs
;; might create your backup files. Should it rename the original and
;; write out the edited buffer? What if the original is linked? In
;; general, the safest but slowest bet is to always make backups by
;; copying.
(setq backup-by-copying t)


;;;;;;;;;;;;;;;
;; Functions ;;
;;;;;;;;;;;;;;;

;; diff on files. Usage: emacs -diff file1 file2.
;; I added alias in .bashrc for that (ediff file1 file2).
(defun command-line-diff (switch)
      (let ((file1 (pop command-line-args-left))
	    (file2 (pop command-line-args-left)))
	(ediff file1 file2)))
(add-to-list 'command-switch-alist '("diff" . command-line-diff))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

;; diff on files. Usage: emacs -diff file1 file2.
;; I added alias in .bashrc for that (ediff file1 file2).
(defun command-line-gud (switch)
  ;; (let ((file1 (pop command-line-args-left))
  ;; 	(file2 (pop command-line-args-left)))
  ;; (gud-gdb "gdb --fullname gold.out")))
  (let ((file1 (pop command-line-args-left)))
    (gud-gdb file1)))
(add-to-list 'command-switch-alist '("gud-gdb" . command-line-gud))
(add-to-list 'command-switch-alist '("-gud-gdb" . command-line-gud))

;; This is changing buffers stuff. I didn't dig into it
;; so there is a potential for improvement.
(defun crs-delete-these (delete-these from-this-list)
  "Delete DELETE-THESE FROM-THIS-LIST."
  (cond
   ((car delete-these)
    (if (member (car delete-these) from-this-list)
	(crs-delete-these (cdr delete-these) (delete (car delete-these)
						     from-this-list))
      (crs-delete-these (cdr delete-these) from-this-list)))
   (t from-this-list)))
; this is the list of buffers I never want to see
(defvar crs-hated-buffers
  '("KILL" "*Compile-Log*"))
; might as well use this for both
(setq iswitchb-buffer-ignore (append '("^ " "*Buffer") crs-hated-buffers))
(defun crs-hated-buffers ()
  "List of buffers I never want to see, converted from names to buffers."
  (delete nil
	  (append
	   (mapcar 'get-buffer crs-hated-buffers)
	   (mapcar (lambda (this-buffer)
		     (if (string-match "^ " (buffer-name this-buffer))
			 this-buffer))
		   (buffer-list)))))
; I'm sick of switching buffers only to find KILL right in front of me
(defun crs-bury-buffer (&optional n)
  (interactive)
  (unless n
    (setq n 1))
  (let ((my-buffer-list (crs-delete-these (crs-hated-buffers)
					  (buffer-list (selected-frame)))))
    (switch-to-buffer
     (if (< n 0)
	 (nth (+ (length my-buffer-list) n)
	      my-buffer-list)
       (bury-buffer)
       (nth n my-buffer-list)))))

(global-set-key [(control q)] 'crs-bury-buffer)
(global-set-key [(control meta tab)] (lambda ()
				       (interactive)
				       (crs-bury-buffer -1)))
(global-set-key [(meta q)] (switch-to-buffer (other-buffer (current-buffer) t)))

;;;; Buffers I don't want to see
(add-to-list 'crs-hated-buffers "*Messages*")
(add-to-list 'crs-hated-buffers "TAGS")
(add-to-list 'crs-hated-buffers "*scratch*")
(add-to-list 'crs-hated-buffers "*Completions*")
(add-to-list 'crs-hated-buffers "*Bookmark List*")
(add-to-list 'crs-hated-buffers "*ansi-term-1*")


;;;; Open files and go places like we see from error messages, i e:
;; path:line:col (to-do "make `find-file-line-number' work for
;; emacsclient as well") (to-do "make `find-file-line-number' check if
;; the file exists")
(defadvice find-file (around find-file-line-number
			     (path &optional wildcards)
			     activate)
  "Turn files like file.js:14:10 into file.js and going to line 14, col 10."
  (save-match-data
    (let* ((match (string-match "^\\(.*?\\):\\([0-9]+\\):?\\([0-9]*\\)$" path))
	   (line-no (and match
			 (match-string 2 path)
			 (string-to-number (match-string 2 path))))
	   (col-no (and match
			(match-string 3 path)
			(string-to-number (match-string 3 path))))
	   (path (if match (match-string 1 path) path)))
      ad-do-it
      (when line-no
	;; goto-line is for interactive use
	(goto-char (point-min))
	(forward-line (1- line-no))
	(when (> col-no 0)
	  (forward-char (1- col-no)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This stuff I don't know. It's about visual shit ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'wombat t)

(if (fboundp 'scroll-bar-mode      ) (scroll-bar-mode      -1))
(if (fboundp 'tool-bar-mode        ) (tool-bar-mode        -1))
(if (fboundp 'menu-bar-mode        ) (menu-bar-mode        -1))
(if (fboundp 'global-font-lock-mode) (global-font-lock-mode 1))

(setq scroll-preserve-screen-position 1 )
(setq scroll-step                     1 )
(setq scroll-conservatively           20)
