(import-macros {: dec} (do
                         (print :do-print ...)
                         (.. (or (string.match ... "(.+%.)seq") "") :dec)))

(fn bkwd [seq]
  (var i (+ (length seq) 1))
  (fn iter []
    (let [next-i (dec i)
          val (. seq next-i)]
      (when val
        (set i next-i)
        (values val i)))))

{: bkwd}
