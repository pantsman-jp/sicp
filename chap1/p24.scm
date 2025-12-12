(use srfi-27)

(define (timed-prime-test n)
  (newline)
  (print n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (print " *** ")
  (print elapsed-time))

(define (random n)
  (random-source-randomize! default-random-source)
  (random-integer n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (runtime)
    (use srfi-11)
    (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

; (timed-prime-test 1009)
; 9166

; (timed-prime-test 1013)
; 232

; (timed-prime-test 1019)
; 182

; (timed-prime-test 10007)
; 1004

; (timed-prime-test 10009)
; 455

; (timed-prime-test 10037)
; 694

; (timed-prime-test 100003)
; 135

; (timed-prime-test 100019)
; 111

; (timed-prime-test 100043)
; 103

; (timed-prime-test 1000003)
; 110

; (timed-prime-test 1000033)
; 112

; (timed-prime-test 1000037)
; 100

; 1,000,000 近くの素数と 1,000 近くの素数をテストする時間を比べると、
; log(1000000/1000) = 3 log2(10) ~ 10 倍速く走ると予想。
; 実際は 80 倍速い。
; fermat-test で選ばれた a が小さかったか