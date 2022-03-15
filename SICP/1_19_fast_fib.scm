;Tpq(a,b)
;a = bq + aq + ap
;b = bp + aq

;p = 0
;q = 1



;Tp1q1(a,b) = Tpq (Tpq(a,b))
;= Tpq (bq + aq + ap, bp + aq)
;a = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;  = b(pq + q^2 + pq) + a(q^2 + q^2 + pq + pq + p^2)
;  = b(2pq + q^2) + a(2pq + q^2) + a (q^2 + p^2)
;b = (bp + aq)p + (bq + aq + ap)q
;  = b(p^2 + q^2) + a (pq + q^2 + pq)
;  = b(q^2 + p^2) + a (2pq + q^2)
;p1 = q^2 + p^2
;q1 = 2pq + q^2
;Tp1q1(a,b) = Tpq(Tpq(a,b))
;a = bq1 + aq1 + ap1
;b = bp1 + aq1

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))    ;compute p'
                   (+ (* 2 q p) (* q q))  ;compute q'
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))