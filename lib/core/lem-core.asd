(defsystem "lem-core"
  :depends-on ("alexandria"
               "trivial-gray-streams"
               "cl-ppcre"
               "inquisitor"
               "babel"
               "bordeaux-threads"
               "yason"
               "log4cl"
               "lem-base"
               "lem-common")
  :serial t
  :components ((:file "package")
               (:file "quicklisp-utils")
               (:file "config")
               (:file "errors")
               (:file "signal-handler")
               (:file "key")
               (:file "macros")
               (:file "color")
               (:file "attribute")
               (:file "clipboard")
               (:file "killring")
               (:file "kill")
               (:file "file-ext")
               (:file "screen")
               (:file "frame")
               (:file "echo")
               (:file "prompt")
               (:file "window-tree")
               (:file "window")
               (:file "modeline")
               (:file "command-table")
               (:file "command")
               (:file "defcommand")
               (:file "mode")
               (:file "keymap")
               (:file "timer")
               (:file "event-queue")
               (:file "interp")
               (:file "input")
               (:file "overlay")
               (:file "streams")
               (:file "fundamental-mode")
               (:file "comp")
               (:file "typeout")
               (:file "lem")

               (:file "cursors")

               (:file "primitive-command")
               (:file "self-insert-command")
               (:file "file-command")
               (:file "window-command")
               (:file "help-command")
               (:file "word-command")
               (:file "sexp-command")

               (:file "interface")
               (:file "display")

               (:file "color-theme")
               (:file "site-init")

               (:module "ext"
                :serial t
                :components ((:file "popup-window")
                             (:file "completion-mode")
                             (:file "history")
                             (:file "prompt-window")
                             (:file "tmlanguage")
                             (:file "button")
                             (:file "loading-spinner")
                             (:file "listener-mode")
                             (:file "universal-argument")
                             (:file "kbdmacro")
                             (:file "isearch")
                             (:file "showparen")
                             (:file "menu-mode")
                             (:file "list-buffers")
                             (:file "line-numbers")
                             (:file "sourcelist")
                             (:file "grep")
                             (:file "go-back")
                             (:file "language-mode")
                             (:file "language-mode-tools")
                             (:file "gtags")
                             (:file "directory-mode")
                             (:file "abbrev")
                             (:file "rectangle")
                             (:file "auto-save")
                             (:file "tabbar")
                             (:file "frame-multiplexer")))))
