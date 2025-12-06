(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; 0回目 : (fib-iter a b p q count)
; 1回目 : (fib-iter bq+aq+ap bp+aq p q count-1)
; 2回目 : (fib-iter (bp+aq)q+(bq+aq+ap)q+(bq+aq+ap)p ...)
; ここで引数 a の部分に注目してみれば
; (bp+aq)q+(bq+aq+ap)q+(bq+aq+ap)p = b(q^2+2pq)+a(q^2+2pq)+a(p^2+q^2)
; bq'+aq'+ap' と比較すれば p', q' を求められた。

; (print (fib 1))
; (print (fib 3))
; (print (fib 10))
; (print (fib 50))