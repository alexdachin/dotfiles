;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alex Dachin"
      user-mail-address "alexdachin20@gmail.com")

(setq doom-theme 'doom-nord)
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; Absolute line numbers
(setq display-line-numbers-mode t
      display-line-numbers-type t)

;; No autosave pls
(setq auto-save-default nil)

;; Org
(setq org-directory "~/org/")

(after! org (setq org-log-into-drawer t     ; log into the drawer
                  org-clock-into-drawer t   ; clock into the drawer
                  org-log-done 'time
                  org-log-repeat 'time
                  org-log-redeadline 'note
                  org-log-reschedule 'note))

(after! org (setq org-todo-keywords
                  '((sequence "TODO(t)" "BLOCKED(b)" "|" "DONE(d)" "CANCELED(c)")
                    (sequence "[ ](T)" "[?](B)" "|" "[X](D)"))
                  org-todo-keyword-faces
                  '(("[?]"     . +org-todo-onhold)
                    ("BLOCKED" . +org-todo-onhold))))

;; Calendar
(after! calfw (defvar ad/cfw-custom-map
                 (cfw:define-keymap
                  '(
                    ("q" . cfw:org-clean-exit)
                    ))
                 "Custom calendar keymap."))

(setq calendar-week-start-day 1)         ; start calendar on Monday
(setq cfw:display-calendar-holidays nil) ; do not show build-in holidays

(defun ad/open-calendar ()
  "Open my calendar."
  (interactive)
  (cfw:open-calendar-buffer
   :custom-map ad/cfw-custom-map
   :contents-sources
   (list
    (cfw:org-create-source
     (face-foreground 'term-color-green))
    (cfw:ical-create-source
     "Holidays in Sweden 🇸🇪"
     "https://calendar.google.com/calendar/ical/en.swedish%23holiday%40group.v.calendar.google.com/public/basic.ics"
     (face-foreground 'term-color-cyan))
    )))

(map! :leader
      :desc "My calendar"
      "o c" #'ad/open-calendar)

;; Add stuff to modeline
(defun ad/update-live-variables ()
  (setq ad/current-spotify-track (string-trim (shell-command-to-string "~/dotfiles/current-spotify-track.scpt"))
        ad/current-time (format-time-string "%H:%M")))

(if (not (boundp 'ad/timer-update-live-variables))
  (setq ad/timer-update-live-variables (run-with-timer 0 10 'ad/update-live-variables)))

(add-to-list 'global-mode-string '(:eval (propertize ad/current-time 'face 'warning)))
(add-to-list 'global-mode-string '(:eval (propertize (concat ad/current-spotify-track "  ") 'face 'doom-modeline-info)))
