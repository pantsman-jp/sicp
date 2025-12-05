(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; a + abs(b) そのもの

; (print (a-plus-abs-b 1 2))
; (print (a-plus-abs-b 1 -2))