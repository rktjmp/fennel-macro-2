(print (view [:inc-vargs ...]))
(local fennel (require :fennel))

(import-macros {: complicate} (do
                               (print :do-print ...)
                               (.. (or (string.match ... "(.+%.)inc") "") :complicate)))

(complicate my-var :complicated-in-file)
(print :complicate-inside-inc-macro-file (view my-var-complicated))

(fn inc [y]
  `(+ 1 ,y))

{: inc}
