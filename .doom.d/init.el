;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(doom! :input

       :completion
       company             ; code completion backend
       (ivy +fuzzy)        ; search engine

       :ui
       doom                ; doom ui
       doom-dashboard      ; doom splash screen
       doom-quit           ; doom quit message prompt
       (emoji +unicode)    ; 🙂
       modeline            ; status line
       ophints             ; highlight the region an operation acts on
       treemacs            ; file tree drawer
       vc-gutter           ; vcs diff in the fringe

       :editor
       (evil +everywhere)  ; sailing on the dark side

       :emacs
       dired               ; making dired pretty
       undo                ; persistent undo
       vc                  ; version control

       :term
       eshell

       :checkers

       :tools
       (eval +overlay)     ; eval code and repls
       lookup              ; code navigation and documentation
       lsp                 ; language server protocol
       magit               ; git ui
       taskrunner          ; parse tasks from make, yaml, etc
       terraform           ; infrastructure as code

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS

       :lang
       common-lisp         ; if you've seen one lisp, you've seen them all
       data                ; config/data formats (csv, plist, etc)
       emacs-lisp          ; drown in parentheses
       (json +lsp)         ; at least it ain't xml 😬
       (javascript +lsp)   ; all(hope(abandon(ye(who(enter(here))))))
       markdown            ; writing docs for people to ignore
       org                 ; life organizer in plain text
       (python +lsp)       ; beautiful is better than ugly
       rest                ; rest client
       (ruby +rails +lsp)  ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust                ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +lsp)           ; she sells {ba,z,fi}sh shells on the c xor
       (web +lsp)          ; the tubes
       (yaml +lsp)         ; json, but readable

       :email
       (mu4e +gmail)       ; for reading me mail

       :app
       calendar            ; calendar buffer

       :config
       (default +bindings +smartparens))
