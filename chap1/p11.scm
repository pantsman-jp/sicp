(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

; (print (f-rec 1))
; (print (f-rec 2))
; (print (f-rec 3))
; (print (f-rec 4))
; (print (f-rec 5))

; ------------------------- ;

(define (f-loop n)
  (f-loop-aux 2 1 0 n))

(define (f-loop-aux x y z n)
  (cond ((= n 0) z)
        ((= n 1) y)
        ((= n 2) x)
        (else (f-loop-aux (+ x (* y 2) (* z 3)) x y (- n 1)))))

; (print (f-loop 1))
; (print (f-loop 2))
; (print (f-loop 3))
; (print (f-loop 4))
; (print (f-loop 5))