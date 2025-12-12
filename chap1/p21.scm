(load "./p3.scm")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test)
  (cond ((> (square test) n) n)
        ((divides? test n) test)
        (else (find-divisor n (+ test 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; (print (smallest-divisor 199)) ; 199
; (print (smallest-divisor 1999)) ; 1999
; (print (smallest-divisor 19999)) ; 7

; (print (prime? 2))
; (print (prime? 1234567890))
; (print (prime? 2147483647))