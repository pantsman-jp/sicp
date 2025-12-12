(use srfi-11)
(load "./p21.scm")

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

; 現在時刻のマイクロ秒を返す
(define (runtime)
  (let-values (((a b) (sys-gettimeofday))) (+ (* a 1000000) b)))

; [a, b) なる区間の奇数について、素数性を調べる
(define (search-for-primes a b)
      (search-for-primes-iter a b))

(define (search-for-primes-iter a b)
  (if (< a b)
      (and (if (prime? a)
           (timed-prime-test a))
           (search-for-primes-iter (+ a 1) b))))

; n 以上の素数を m 個出力
(define (primes n m)
  (primes-iter n m))

(define (primes-iter n m)
  (if (> m 0)
      (begin
        (when (prime? n)
          (timed-prime-test n)
          (primes-iter (+ n 1) (- m 1)))
        (unless (prime? n)
          (primes-iter (+ n 1) m)))))

; (timed-prime-test 57)

; (search-for-primes 1000 10000)
; (search-for-primes 10000 100000)
; (search-for-primes 100000 1000000)
; (search-for-primes 1000000 10000000)


; (primes 1000 3)
; 1009
;  ***
; 5

; 1013
;  ***
; 9

; 1019
;  ***
; 6


; (primes 10000 3)
; 10007
;  ***
; 30

; 10009
;  ***
; 15

; 10037
;  ***
; 17


; (primes 100000 3)
; 100003
;  ***
; 91

; 100019
;  ***
; 52

; 100043
;  ***
; 80


; (primes 1000000 3)
; 1000003
;  ***
; 195

; 1000033
;  ***
; 359

; 1000037
;  ***
; 243