;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Trash & Undo
(setq-default delete-by-moving-to-trash t)
(setq undo-limit 80000000
      evil-want-fine-undo t
      scroll-margin 2)
;; Modeline
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode -1)
  (display-time-mode -1)
  (setq doom-modeline-enable-word-count t)
  (setq display-time-format "%Y-%m-%d %H:%M")
  (setq doom-modeline-height 13)
  (setq display-time-default-load-average nil)
  (setq doom-modeline-buffer-encoding nil))
;;
(setq confirm-kill-emacs nil)
(setq display-line-numbers-type nil)
;;
;;Dashboard as initial buffer with emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
;; Scratch buffer intital text
(setq initial-scratch-message nil)
(setq initial-major-mode 'markdown-mode)
(global-set-key (kbd "C-c s") (lambda () (interactive) (switch-to-buffer "*scratch*")))
;;
;; Connect to main workspace on launch
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))
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
;; Cursor
(setq evil-normal-state-cursor '(box "#819cd6")
      evil-insert-state-cursor '(bar "#47FFE0")
      evil-visual-state-cursor '(hollow "#c280A0"))
;; hl-todo mode
(setq hl-todo-mode t)
(setq global-hl-todo-mode t)
(after! hl-todo
(setq hl-todo-keyword-faces
      '(("TODO"   . "#c280A0")
        ("NOTE"  . "#c280A0")
        ("IDEA"  . "#c280A0")
        ("QUESTION"  . "#c280A0")
        ("REVIEW"  . "#c280A0")
        ("RESEARCH"   . "#c280A0"))))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/storage/emulated/0/Documents/org/")
;
;; map leader a (previously act on?) to my agenda view
(map! :leader
      :desc "My agenda custom"
      "a" #'my-agenda-custom)
;;
(after! org
(setq org-agenda-files
'("~/storage/emulated/0/Documents/org/todo.org"
  "~/storage/emulated/0/Documents/org/events.org"
  "~/storage/emulated/0/Documents/org/goals.org")))
;; My agenda custom commands
(defun my/org-agenda-overview ()
  (interactive)
  (org-agenda nil "o"))
;;
;; My agenda custom commands
(defun my/org-agenda-day-view ()
  (interactive)
  (org-agenda nil "d"))
;; Org agenda custom view
(setq org-agenda-custom-commands
   '(("o" "Overview"
      ((agenda ""
        ((org-agenda-span 'day)
         (org-agenda-overriding-header "Day Overview:")))
       (tags "p1"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "#p1:")))
       (tags "p2"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "#p2:")))
       (tags "p3"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "#p3:")))
 ;      (todo "ACTIVE"
 ;            ((org-agenda-overriding-header "Active:")))
 ;     (todo "WAITING"
 ;           ((org-agenda-overriding-header "Waiting:")))
        (tags "p4"
             ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
              (org-agenda-overriding-header "#p4"))))
      )
   ("d" "Day View"
         ((agenda ""
                  ((org-agenda-span '1)))
))))
;;
(setq org-attach-id-dir "/storage/emulated/0/Documents/org/assets/")
(setq org-highlight-sparse-tree-matches nil)
(setq org-startup-folded t)
(setq org-log-done 'time)
(setq org-clock-into-drawer t)
(setq org-deadline-warning-days 0)
(setq org-agenda-span 5
      org-agenda-start-day "today")
(setq org-refile-targets (quote (("/storage/emulated/0/Documents/org/todo.org" :level . 4)
                                 ("/storage/emulated/0/Documents/org/archive.org" :level . 4)
                                 ("/storage/emulated/0/Documents/org/goals.org" :level . 4)
                                 ("/storage/emulated/0/Documents/org/reading.org" :level . 4)
                                 ("/storage/emulated/0/Documents/org/events.org" :level . 4)
                                 ("/storage/emulated/0/Documents/org/someday.org" :level . 4))))
                                 
(after! org
  (setq org-tag-alist-for-agenda
        '(
             ("@NA")
             ("@on")
             ("@off")
             ("@email")
             ("@sba")
             ("@art")
             ("@email")
             ("@errands")
             ("@health")
             ("@reading")
             ("@research")
             ("@sys")
             ("@watch")
             ("@writing")
             ("p1")
             ("p2")
             ("p3")
             ("p4")
               ))
  (setq org-tag-alist
        '(
             ("Budding")
             ("Evergreen")
             ("Literature")
             ("Fleeting")
             ("Seedling")
             ("NA")
             ("sba")
             ("art")
             ("blog")
             ("draft")
             ("emacs")
             ("email")
             ("expenses")
             ("film")
             ("football")
             ("health")
             ("reading")
             ("refile")
             ("research")
             ("sys")
             ("log")
             ("question")
             ("watch")
             ("writing")
             ("p1")
             ("p2")
             ("p3")
             ("p4")
               ))
        (setq! org-agenda-use-tag-inheritance t
               org-ellipsis " ▾ "
               org-hide-leading-stars t
               org-priority-highest '?A
               org-priority-lowest '?D
               org-default-priority '?C
               org-priority-faces '((?A :foreground "#989DAF")
                                    (?B :foreground "#8C92A6")
                                    (?C :foreground "#80869c")
                                    (?D :foreground "#757C94"))))
;;
(add-hook! 'org-mode-hook 'org-fancy-priorities-mode)
(add-hook! 'org-agenda-mode-hook 'org-fancy-priorities-mode)
;;
(after! org-fancy-priorities
  (setq!
   org-fancy-priorities-list
   '("[A]" "[B]" "[C]" "[D]")
   ))
;; Place tags close to the right-hand side of the window - is this working?
  (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
  (defun place-agenda-tags ()
    "Put the agenda tags by the right border of the agenda window."
    (setq org-agenda-tags-column (- 4 (window-width)))
    (org-agenda-align-tags))
;
(after! org
(setq!
      org-journal-time-prefix "** "
      org-journal-date-prefix "* "
      org-journal-time-format "%H:%M"
      org-journal-date-format "%Y%m%d"
      org-journal-file-format "%Y%m%d.org"
      org-journal-dir "/storage/emulated/0/Documents/org/journals/"
      org-superstar-headline-bullets-list '("◉" "○" "○" "○" "○" "○" "○")
      org-hide-emphasis-markers t
      org-agenda-start-with-log-mode t
      org-log-into-drawer t
      org-agenda-max-todos 10))
;      
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
    (goto-char (point-max)))
;;
;; Capture templates
(after! org
  (setq! org-capture-templates
         '(("i" "Todo" entry (file+olp "~/storage/emulated/0/Documents/org/todo.org" "INBOX")
            "** TODO %?")
            ;; ("j" "Journal entry" plain (function org-journal-find-location)
            ;;  "%(format-time-string org-journal-time-format) %?" :empty-lines 1 :jump-to-captured t)
            ;; ("n" "Note (with Denote)" plain
            ;;      (file denote-last-path)
            ;;      #'denote-org-capture
            ;;      :no-save t
            ;;      :immediate-finish nil
            ;;      :kill-buffer t
            ;;      :jump-to-captured t)
           ;; ("j" "Log" entry (file+datetree "~/storage/emulated/0/Documents/vault/log.org")
           ;;  "* %(format-time-string org-journal-time-format) %?")
           ;; ("j" "Log" plain (file "~/storage/emulated/0/Documents/vault/0-Fleeting-Notes/log.md")
           ;;  "%?")
           ("x" "Socials" entry (file+olp "~/storage/emulated/0/Documents/org/socials.org" "Drafts")
            "** %?")
           ("y" "Someday" entry (file+olp "~/storage/emulated/0/Documents/org/todo.org" "SOMEDAY/MAYBE")
            "** SOMEDAY %?")
           ;; ("t" "Text at point" entry (file+datetree "~/storage/emulated/0/Documents/vault/Journals/log.org")
           ;;  "* %(format-time-string org-journal-time-format) %? %a")
           ("m" "Mail ")
           ("mf" "Follow Up" entry (file+olp "~/storage/emulated/0/Documents/org/todo.org" "INBOX")
          "** TODO Follow up with %:fromname on %a\nSCHEDULED:%t\n\n%i")
           ("mr" "Read Later" entry (file+olp "~/storage/emulated/0/Documents/org/todo.org" "INBOX")
          "** TODO %:subject\nSCHEDULED:%t\n%a\n\n%i")
           ("e" "Event" entry (file+olp "~/storage/emulated/0/Documents/org/events.org" "2023")
            "*** EVENT %?%^{SCHEDULED}p" :empty-lines 1)
           ("r" "Reading List" plain (file+olp "~/storage/emulated/0/Documents/org/reading.org" "INBOX")
            "** TODO %?\nCREATED:%U" :empty-lines 1)
           ("w" "Weekly Review" plain (file buffer-name)
            (file "~/storage/emulated/0/Documents/4-Resources/Templates/tpl-weekly-review.txt") :empty-lines 1))))
;; Org keywords
(after! org
(setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "ACTIVE(a)"
         "NEXT(n)"
         "GOAL(g)"
         "PROJECT(p)"
         "EVENT(e)"
         "SOMEDAY(s)"
         "WAITING(w)"
         "|"
         "DONE(d)"
         "CANCELLED(c)" ))))
(setq! org-todo-keyword-faces
      '(("TODO" :foreground "#C280a0" :weight bold)
       ("ACTIVE" :foreground "#66FFD6" :weight bold)
       ("NEXT" :foreground "#FFFBB8" :weight bold)
       ("SOMEDAY" :foreground "#AAAAE1" :weight bold)
       ("WAITING" :foreground "#AAAAE1" :weight bold)
       ("GOAL" :foreground "#65DDA3" :weight bold)
       ("PROJECT" :foreground "#8C8DFF" :weight bold)
       ("EVENT" :foreground "#5099DA" :weight bold)
       ("DONE" :foreground "#2FF9D1" :weight bold)
       ("CANCELLED" :foreground "#80869c" :weight bold)))
(after! org
(setq! org-tag-faces
   '(("p1" :foreground "#E16161")
     ("p2" :foreground "#E59B5D")
     ("p3" :foreground "#FFFBB8")
     ("p4" :foreground "#5099DA"))))
;
;; Beacon global minor mode
(use-package! beacon)
(after! beacon (beacon-mode 1))
;; Focus
(use-package! focus)
;;
;; Keyboard shortcuts for regularly used files
(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
(zz/add-file-keybinding "C-c t" "/storage/emulated/0/Documents/org/todo.org" "todo.org")
(zz/add-file-keybinding "C-c e" "/storage/emulated/0/Documents/org/events.org" "events.org")
(zz/add-file-keybinding "C-c g" "/storage/emulated/0/Documents/org/goals.org" "goals.org")
(zz/add-file-keybinding "C-c r" "/storage/emulated/0/Documents/org/reading.org" "reading.org")
(zz/add-file-keybinding "C-c x" "/storage/emulated/0/Documents/org/socials.org" "socials.org")
;; (zz/add-file-keybinding "C-c c" "/storage/emulated/0/Documents/dotfiles-termux/.doom.d/config.el" "config.el")
;;
(global-set-key (kbd "C-c w") 'count-words)
(global-set-key (kbd "C-c n") 'denote)
(define-key global-map (kbd "C-c l") #'elfeed)
(define-key global-map (kbd "C-c c") #'org-capture)
(define-key global-map (kbd "C-c f") #'flyspell-mode)
(define-key global-map (kbd "C-c i") #'now)
;; avy search char in the open windows is kinda like qutebrowsers follow mode
(setq avy-all-windows t)
(map! :leader
      :prefix "j"
      :desc "avy-goto-char-timer" "j" #'avy-goto-char-timer)
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
;; Remap space, space to switch to buffer instead of local files
(map! :leader
      :desc "Switch to buffer"
      "SPC" 'switch-to-buffer)
;;
;; Easier key for terminal popup
(map! :leader
      :desc "Vterm toggle"
      "v" '+vterm/toggle)
;; Easier key for terminal full window
(map! :leader
      :desc "Vterm here"
      "V" '+vterm/here)
;; Writeroom increase text width
(map! :leader
      :desc "Writeroom increase width"
      "=" 'writeroom-increase-width)
;; Writeroom decrease text width
(map! :leader
      :desc "Writeroom increase width"
      "-" 'writeroom-decrease-width)
;; Consult find file
(map! :leader
      :desc "consult-find file"
      "/" 'consult-find)
;; Writeroom mde
(map! :leader
      :desc "writeroom-mode"
      "z" 'writeroom-mode)
;; Writeroom mde
(map! :leader
      :desc "rgrep"
      "r" 'rgrep)
;; Dired alternaive
(map! :leader
      :desc "Dired"
      "d" 'dired)
;; Quick org-tags-sparse-tags
(map! :leader
      (:prefix ("o" . "org-tags-sparse-tree")
                :desc "org-tags-sparse-tree" "s" #'org-tags-sparse-tree))
;; Comment lines
(map! :leader
      :desc "Comment or uncomment lines" "#" #'comment-line)
;; Evil write all buffers
(map! :leader
      (:prefix ("w" . "Write all buffers")
               :desc "Write all buffers" "a" 'evil-write-all))

;; Dired
(after! dired
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
  (kbd "Y") 'dired-copy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "C") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "n") 'evil-search-next
  (kbd "N") 'evil-search-previous
  (kbd "q") 'kill-this-buffer
  ))
;; Dired less details for mobile
(defun my-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
;;
;; Elfeed
(require 'elfeed-org)
(after! elfeed
(elfeed-org)
(setq elfeed-search-filter "@1-day-ago +unread"
      elfeed-search-title-min-width 80
      elfeed-show-entry-switch #'pop-to-buffer
      shr-max-image-proportion 0.6)
(add-hook! 'elfeed-show-mode-hook (hide-mode-line-mode 1))
(add-hook! 'elfeed-search-update-hook #'hide-mode-line-mode)
(defadvice! +rss-elfeed-wrap-h-nicer ()
    "Enhances an elfeed entry's readability by wrapping it to a width of
`fill-column' and centering it with `visual-fill-column-mode'."
    :override #'+rss-elfeed-wrap-h
    (setq-local truncate-lines nil
                shr-width 120
;                visual-fill-column-center-text t
                default-text-properties '(line-height 1.1))
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t))
      (visual-fill-column-mode)
      (set-buffer-modified-p nil)))     )
;;
;; browse article in gui browser instead of eww
;;(defun elfeed-show-visit-gui ()
;;  "Wrapper for elfeed-show-visit to use gui browser instead of eww"
;;  (interactive)
;;  (let ((browse-url-generic-program "xdg-open"))
;;    (elfeed-show-visit t)))
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list "/storage/emulated/0/Documents/org/elfeed.org"))
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
(after! elfeed-search
  (set-evil-initial-state! 'elfeed-search-mode 'normal))
(after! elfeed-show-mode
  (set-evil-initial-state! 'elfeed-show-mode   'normal))
;;
(after! evil-snipe
  (push 'elfeed-show-mode   evil-snipe-disabled-modes)
  (push 'elfeed-search-mode evil-snipe-disabled-modes))
;; Tecosaur keybinds modified
(map! :map elfeed-search-mode-map
      :after elfeed-search
      [remap kill-this-buffer] "q"
      [remap kill-buffer] "q"
      :n doom-leader-key nil
      :n "c" #'+rss/quit
      :n "e" #'elfeed-update
      :n "z" #'elfeed-search-untag-all-unread
      :n "u" #'elfeed-search-tag-all-unread
      :n "s" #'elfeed-search-live-filter
      :n "x" #'elfeed-search-show-entry
      :n "p" #'elfeed-show-pdf
      :n "+" #'elfeed-search-tag-all
      :n "-" #'elfeed-search-untag-all
      :n "S" #'elfeed-search-set-filter
      :n "b" #'elfeed-search-browse-url
      :n "y" #'elfeed-search-yank)
(map! :map elfeed-show-mode-map
      :after elfeed-show
      [remap kill-this-buffer] "q"
      [remap kill-buffer] "q"
      :n doom-leader-key nil
      :nm "c" #'+rss/delete-pane
      :nm "o" #'ace-link-elfeed
      :nm "RET" #'org-ref-elfeed-add
      :nm "n" #'elfeed-show-next
      :nm "N" #'elfeed-show-prev
      :nm "p" #'elfeed-show-pdf
      :nm "+" #'elfeed-show-tag
      :nm "-" #'elfeed-show-untag
      :nm "s" #'elfeed-show-new-live-search
      :nm "y" #'elfeed-show-yank)
;;
(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
;;Highlight indent guides mode
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq projectile-project-search-path '("/tmp/noproject"))
;; My snippet functions
(defun my-md-front-matter ()
 (interactive)
 (insert "---\ntitle: ${title}\nid: %<%Y_%m_%d_%H%M>\ndate: %U\ntags: \n---\n")
 )
;
(defun my-md-front-matter ()
 (interactive)
 (insert "ID: %<%Y%m%d%H%M>\n")
 )

(defun my-org-front-matter ()
 (interactive)
 (insert "#+TITLE:\n#+ID: \n#+FILETAGS: \n#+OPTIONS: num:nil toc:nil author:nil\n#+STARTUP: showall")
 )

(defun my-website-front-matter ()
 (interactive)
 (insert "---
layout: post
title: ""
date: 2023-00-00 00:00:00
categories:
---")
 )
;; Timestamp
(defun now ()
 (interactive)
 (insert (format-time-string "**** %H:%M" )
 ))
;;

(defun td ()
  (interactive)
  (insert "** TODO "
  ))
;; Make Elisp files in that directory available to the user.
(add-to-list 'load-path "~/.emacs.d/manual-packages/denote")

;; Configuration
(require 'denote)

;; Remember to check the doc strings of those variables.
(setq denote-directory (expand-file-name "~/Dropbox/vault/"))
(setq denote-known-keywords '(""))
(setq denote-infer-keywords nil)
(setq denote-sort-keywords t)
(setq denote-file-type "markdown-yaml") ; Org is the default, set others here
(setq denote-prompts '(nil))
(setq denote-excluded-directories-regexp nil)
(setq denote-excluded-keywords-regexp nil)

;; Pick dates, where relevant, with Org's advanced interface:
(setq denote-date-prompt-use-org-read-date t)


;; Read this manual for how to specify `denote-templates'.  We do not
;; include an example here to avoid potential confusion.
(setq denote-id-format "%Y%m%d%H%M")
(setq denote-date-format "%Y%m%d%H%M") ; read doc string
;test
(setq denote-yaml-front-matter
  "ID: %2$s
#Fleeting\n")
;
(setq denote-org-front-matter
"#+TITLE: %s
#+ID: %s
#+FILETAGS: %s
\n")
;; If you use Markdown or plain text files (Org renders links as buttons
;; right away)
(add-hook 'find-file-hook #'denote-link-buttonize-buffer)

;; We use different ways to specify a path for demo purposes.
(setq denote-dired-directories
      (list denote-directory
            (thread-last denote-directory (expand-file-name "attachments"))
            (expand-file-name "~/Documents/books")))

;; Generic (great if you rename files Denote-style in lots of places):
;; (add-hook 'dired-mode-hook #'denote-dired-mode)
;;
;; OR if only want it in `denote-dired-directories':
(add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
;;
;; Rainbow Mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)
;;
;; browser setting
 (setq browse-url-browser-function 'browse-url-xdg-open)
;; nov mode
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (map! :map nov-mode-map
        :n "RET" #'nov-scroll-up)

  (defun doom-modeline-segment--nov-info ()
    (concat
     " "
     (propertize
      (cdr (assoc 'creator nov-metadata))
      'face 'doom-modeline-project-parent-dir)
     " "
     (cdr (assoc 'title nov-metadata))
     " "
     (propertize
      (format "%d/%d"
              (1+ nov-documents-index)
              (length nov-documents))
      'face 'doom-modeline-info)))

  (advice-add 'nov-render-title :override #'ignore)

  (defun +nov-mode-setup ()
    "Tweak nov-mode to our liking."
    (face-remap-add-relative 'variable-pitch
                             :family "JetBrains Mono"
                             :height 1.1
                             :width 'semi-expanded)
    (face-remap-add-relative 'default :height 1.1)
    (setq-local line-spacing 0.2
                next-screen-context-lines 4
                shr-use-colors nil)
     (require 'visual-fill-column nil t)
     (setq-local visual-fill-column-center-text t)
    ;;             visual-fill-column-width 120
    ;;             nov-text-width 120)
    ;; (visual-fill-column-mode 1)
    ;; Re-render with new display settings
    (nov-render-document)
    ;; Look up words with the dictionary.
    (add-to-list '+lookup-definition-functions #'+lookup/dictionary-definition)
    ;; Customise the mode-line to make it more minimal and relevant.
    (setq-local
     mode-line-format
     `((:eval
        (doom-modeline-segment--workspace-name))
       (:eval
        (doom-modeline-segment--window-number))
       (:eval
        (doom-modeline-segment--nov-info))
       ,(propertize
         " %P "
         'face 'doom-modeline-buffer-minor-mode)
       ,(propertize
         " "
         'face (if (doom-modeline--active) 'mode-line 'mode-line-inactive)
         'display `((space
                     :align-to
                     (- (+ right right-fringe right-margin)
                        ,(* (let ((width (doom-modeline--font-width)))
                              (or (and (= width 1) 1)
                                  (/ width (frame-char-width) 1.0)))
                            (string-width
                             (format-mode-line (cons "" '(:eval (doom-modeline-segment--major-mode))))))))))
       (:eval (doom-modeline-segment--major-mode)))))

  (add-hook 'nov-mode-hook #'+nov-mode-setup))
;
(after! org
  (setq time-stamp-active t
    time-stamp-start "#\\+LAST_MOD:[ \t]*"
    time-stamp-end "$"
    time-stamp-format "\[%Y-%m-%d %02H:%02M\]")
(add-hook 'before-save-hook 'time-stamp))
;;
(add-hook 'markdown-mode-hook 'writeroom-mode)
;; (add-hook 'markdown-mode-hook (lambda ()
;;                             (setq buffer-face-mode-face '(:family "Alegreya :size 18"))
;;                             (buffer-face-mode)))

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
;; (load-theme 'catppuccin t t)
;; (setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;; (catppuccin-reload)
;; (after! treemacs
;;   (setq treemacs-follow-mode t)
;;   (setq treemacs-indent-guide-mode t))
;; minimap map
;; (after! minimap
;;   (minimap-mode))
;; vterm confirm quit
(after! vterm
  (setq vterm-kill-buffer-on-exit t))

