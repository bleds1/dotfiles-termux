;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;;(setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")

;; Delete files to trash
(setq-default
      delete-by-moving-to-trash t)
;;
;; Undo limit 80mb/More granual changes whilst in insert
(setq undo-limit 80000000
      evil-want-fine-undo t
;; Scroll  Margin
      scroll-margin 2)
;;
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
;; (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode 1)
  (display-time-mode -1)
  (setq doom-modeline-enable-word-count t)
;;(setq display-time-format "%H:%M")
  (setq display-time-format "%Y_%m_%d %H:%M")
  (setq doom-modeline-height 15)
  (setq display-time-default-load-average nil)
  (setq doom-modeline-buffer-encoding nil))
;;
;;(global-hide-mode-line-mode)
;; Disable quit confirmation message
(setq confirm-kill-emacs nil)
;;
;; Relative line numbers
(setq display-line-numbers-type nil)
;;
;;Better default buffer names
(setq doom-fallback-buffer-name "*dashboard*")
;
; Dashboard at startup
(require 'dashboard)
(dashboard-setup-startup-hook)
;;
;;Dashboard as initial buffer with emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;;
;; Connect to main workspace on launch
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))
;;
;; Quick access dashboard key
(map! :leader :desc "Dashboard" "d" #'dashboard-open)
;;
;; Set the title
(after! dashboard
(setq dashboard-banner-logo-title "Welcome back Bledley!")
;; Set the banner
;;(setq dashboard-startup-banner "~/.doom.d/splash/doom-ascii.txt")
;;(setq dashboard-startup-banner "~/.doom.d/splash/emacs-e-template.svg") ;; use custom image as banner
;; Value can be
;; - nil to display no banner
;; - 'official which displays the official emacs logo
;; - 'logo which displays an alternative emacs logo
;; - 1, 2 or 3 which displays one of the text banners
;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")
;;
(setq dashboard-items '((recents  . 5)
                        (agenda . 5)
                        ))
(setq dashboard-item-names '(("Recent:" . "Recent (r):")
                             ("Agenda:" . "Agenda (a):")))
;; Content is not centered by default. To center, set
(setq dashboard-center-content t)
;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)
(setq dashboard-set-init-info t)
(setq dashboard-set-footer nil)
(setq dashboard-set-file-icons t)
(setq dashboard-agenda-sort-strategy '(time-up))
(setq dashboard-agenda-prefix-format "%i %-12:c %s ")
(setq dashboard-agenda-tags-format 'ignore))
;;
;; Scratch buffer intital text
(setq initial-scratch-message ";; Scratch buffer ;;\n")
;;
(setq doom-theme 'doom-wilmersdorf)
  (custom-set-faces
  '(default ((t (:background "#000000" :foreground "#a9b1d6")))))
;; Solaire mode needs to disabled for consistent background color
(after! solaire-mode
  (solaire-global-mode -1))
;;
;; Zen mode zoom
(setq +zen-text-scale 0.3)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/storage/emulated/0/Documents/roam/")

(after! org
(setq org-directory "/storage/emulated/0/Documents/roam/")
(setq org-agenda-files
      (quote ("/storage/emulated/0/Documents/roam/tasks.org"
              "/storage/emulated/0/Documents/roaminbox.org"
              "/storage/emulated/0/Documents/roamrepeat.org"
              "/storage/emulated/0/Documents/roam/events.org"
              "/storage/emulated/0/Documents/roam/shopping.org"
              "/storage/emulated/0/Documents/roam/goals.org")))
      ;(directory-files-recursively "~/Dropbox/roam/" "\\.org$"))
(setq org-startup-folded t)
(setq org-log-done 'time)
(setq org-clock-into-drawer t)
(setq org-deadline-warning-days 0)
(setq org-agenda-span 5
      org-agenda-start-day "-1")
(setq org-refile-targets (quote (("tasks.org" :maxlevel . 4)
                                 ("inbox.org" :level . 4)
                                 ("repeat.org" :level . 4)
                                 ("bookmarks.org" :level . 4)
                                 ("events.org" :level . 4)
                                 ("goals.org" :level . 4)
                                 ("archive.org" :level . 4)
                                 ("reading.org" :level . 4)
                                 ("shopping.org" :level . 4)
                                 ("someday.org" :level . 4))))
(after! org
(setq! org-agenda-use-tag-inheritance t
      org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest '?A
      org-priority-lowest '?D
      org-default-priority '?C
      org-priority-faces '((?A :foreground "#2FF9D1")
                           (?B :foreground "#57D1B9")
                           (?C :foreground "#63C5B2")
                           (?D :foreground "#5B9589"))))
;;
(after! org
(setq!
      org-journal-time-prefix " - "
      org-journal-date-prefix " - "
      org-journal-time-format "%H:%M"
      org-journal-date-format "%Y-%m-%d"
      org-journal-file-format "%Y_%m_%d.md"
      org-journal-dir "/storage/emulated/0/Documents/roam/journals/"
      org-superstar-headline-bullets-list '("◉" "○" "○" "○" "○" "○" "○")
      org-hide-emphasis-markers t
      org-agenda-start-with-log-mode t
      org-log-into-drawer t
      org-agenda-max-todos 30))
;;
;; capture templates will go here
(after! org
(setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "ACTIVE(a)"
         "NEXT(n)"
         "LATER(l)"
         "IDEA(i)"
         "GOAL(g)"
         "PROJECT(p)"
         "EVENT(e)"
         "REPEAT(R)"
         "REVIEW(r)"
         "SOMEDAY(s)"
         "|"
         "DONE(d)"
         "WAITING(w)"
         "CANCELLED(c)" ))))
(setq! org-todo-keyword-faces ;these colours are not working/defined by theme?
      '(("TODO" :foreground "#2FF9D1" :weight bold :underline t)
       ("ACTIVE" :foreground "#66FFD6" :weight bold :underline t)
       ("NEXT" :foreground "#42F0C1" :weight bold :underline t)
       ("LATER" :foreground "#AAAAE1" :weight bold :underline t)
       ("IDEA" :foreground "#C280A0" :weight bold :underline t)
       ("SOMEDAY" :foreground "#AAAAE1" :weight bold :underline t)
       ("WAITING" :foreground "#AAAAE1" :weight bold :underline t)
       ("GOAL" :foreground "#65DDA3" :weight bold :underline t)
       ("PROJECT" :foreground "#768EC3" :weight bold :underline t)
       ("EVENT" :foreground "#5099DA" :weight bold :underline t)
       ("REPEAT" :foreground "#57D1B9" :weight bold :underline t)
       ("REVIEW" :foreground "#8C8DFF" :weight bold :underline t)
       ("DONE" :foreground "#757575" :weight bold :underline t)
       ("CANCELLED" :foreground "#ff6480" :weight bold :underline t))))
;;
;; org-roam stuff goes here
;;
;; Beacon global minor mode
(use-package! beacon)
(after! beacon (beacon-mode 1))
;;
;; Focus
(use-package! focus)
;;
;;
;; Make a new org buffer easier (from tecosaur.github.io)
(evil-define-command +evil-buffer-org-new (count file)
  "Creates a new ORG buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new org*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (org-mode)
        (setq-local doom-real-buffer-p t)))))
(map! :leader
      (:prefix "n"
       :desc "New empty Org buffer" "O" #'+evil-buffer-org-new))
;;
;; Make a new md buffer easy
(evil-define-command +evil-buffer-md-new (count file)
  "Creates a new markdown buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new md*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (markdown-mode)
        (setq-local doom-real-buffer-p t)))))
;;
(map! :leader
      (:prefix "n"
       :desc "New empty md buffer" "M" #'+evil-buffer-md-new))
;;
;; Dired
(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "U") 'dired-unmark-all-marks
  (kbd "y") 'dired-do-copy
  (kbd "c") 'dired-create-empty-file
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "C") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "n") 'evil-search-next
  (kbd "N") 'evil-search-previous
  (kbd "q") 'kill-this-buffer
  )
;;
;;
;; My snippet functions
(defun my-front-matter ()
 (interactive)
 (insert "---\ntitle: ${title}\nid: %<%Y_%m_%d_%H%M>\ndate: %U\ntags: \n---\n")
 )
;; Timestamp
(defun now ()
 (interactive)
 (insert (format-time-string " - %H:%M")
 ))
;;
;; My jekyll front matter
;;
(defun my-website-front-matter ()
 (interactive)
 (insert "---
layout: post
title: ""
date: 2023-00-00 00:00:00
categories:
---")
 )
;;
;; Rainbow Mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)
;;
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
