(print (view [:inc-vargs ...]))

;; internally this macro-file wants to complicate a value

;; This works, but we need to prepend the *user* location, which isnt portable
;; (import-macros {: complicate} :lib.complicate)

; (import-macros {: complicate} (.. ;; strip current module file to get "root"
;                                   (string.gsub ... "%.inc" ".")
;                                   ;; append desired path
;                                   :complicate))
;; ^^^^^^^^^^^^^ returns a lua error
;; [string "return (string.gsub(..., "%.inc", "") .. ".co..."]:1:
;;   bad argument #1 to 'gsub' (string expected, got nil)

; (import-macros {: complicate} (.. ;; strip current module file to get "root"
;                                   (or "" (string.gsub ... "%.inc" "."))
;                                   ;; append desired path
;                                   :complicate))
;; ^^^^^^^^^ this ends up as "import-macros {} :complicate" which is incorrect

; (local {: complicate} (require (.. ;; strip current module file to get "root"
;                                    (string.gsub ... "%.inc" ".")
;                                    ;; append desired path
;                                    :complicate)))
;; ^^^ this "doesnt crash" but complicate returns quoted forms, so it's not
;; actually usable as a macro that produces a result.
;; once you try to use (complicate), the symbol give doesn't exist
;; (complicate my-var :file-root)
;; ^^ "unknown identifier in strict mode: my-var"

;; AY macro
; (macro rel-path [module from-macro?]
;   `(.. (or (: (or ... "") :match "(.+%.)[^.]+")
;            (if (= ... ,(if from-macro? "init-macros" "init"))
;                ""
;                (.. ... ".")))
;        ,module))
; (import-macros {: complicate} (rel-path :complicate true))
;; has same issues as ... is ultimately nil in the require-macros context

(complicate my-var :file-root)
(print :complicate-inside-inc-macro-file (view my-var-complicated))

(fn inc [y]
  (print :complicate-inside-inc-macro (view (complicate :inside-inc-fn)))
  `(+ 1 ,y))

{: inc}
