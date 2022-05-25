(print (view [:inc-vargs ...]))
(local fennel (require :fennel))

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
;; ^^^ this "doesnt crash" but we can't pass in unknown symbols to actually
;; use the macro.
;; We can quote the vars passed in, which gets around the sym issue, but
;; the macro returns a quoted form, which we can it actually apply.
; (print (complicate my-var :file-root))
;; ^^ "unknown identifier in strict mode: my-var"
; (print (complicate `my-var :file-root))
;; (list (local my-var-complicated "file-root"))

;; AY macro
; (macro rel-path [module from-macro?]
;   `(.. (or (: (or ... "") :match "(.+%.)[^.]+")
;            (if (= ... ,(if from-macro? "init-macros" "init"))
;                ""
;                (.. ... ".")))
;        ,module))
; (import-macros {: complicate} (rel-path :complicate true))
;; has same issues as ... is ultimately nil in the require-macros context
; (print (view fennel.searchModule))

; (fennel.eval (tostring (complicate `my-var :file-root)))
; (print :complicate-inside-inc-macro-file (view my-var-complicated))

; (print :call-scope (view (get-scope)))
; (import-macros {: complicate} (.. ... :macro))

(import-macros {: complicate} (do
                         (print :do-print ...)
                         (.. (or (string.match ... "(.+%.)inc") "") :complicate)))
(complicate my-var :complicated-in-file)
(print :complicate-inside-inc-macro-file (view my-var-complicated))

(fn inc [y]
  ;(print :complicate-inside-inc-macro (view (complicate :inside-inc-fn)))
  `(+ 1 ,y))

{: inc}
