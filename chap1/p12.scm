; 上から n 段目、左から m 番目の値を求める
(define (pascal-triangle n m)
  (if (or (= m 1) (= m n))
      1
      (+ (pascal-triangle (- n 1) (- m 1)) (pascal-triangle (- n 1) m))))

; (print (pascal-triangle 4 1))
; (print (pascal-triangle 4 2))
; (print (pascal-triangle 4 3))
; (print (pascal-triangle 4 4))