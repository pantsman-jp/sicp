(load "./p3.scm")
(use srfi-11)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (print n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (print " *** ")
  (print elapsed-time))

(define (runtime)
  (let-values (((a b) (sys-gettimeofday))) (+ (* a 1000000) b)))


; (timed-prime-test 1009)
; 5 -> 8

; (timed-prime-test 1013)
; 9 -> 22

; (timed-prime-test 1019)
; 6 -> 4

; (timed-prime-test 10007)
; 30 -> 9

; (timed-prime-test 10009)
; 15 -> 9

; (timed-prime-test 10037)
; 17 -> 12

; (timed-prime-test 100003)
; 91 -> 34

; (timed-prime-test 100019)
; 52 -> 32

; (timed-prime-test 100043)
; 80 -> 35

; (timed-prime-test 1000003)
; 195 -> 101

; (timed-prime-test 1000033)
; 359 -> 100

; (timed-prime-test 1000037)
; 243 -> 101

; 大きな数では高速化の傾向が見られるが、小さい数はむしろそうではない。
; おそらく、小さい数では割り算回数よりも手続き呼び出し回数のほうがボトルネックになってる