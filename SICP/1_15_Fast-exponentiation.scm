(define (pow a b)
  (define (pow-iter ans sq exp cur-exp step)
    ;(display (* ans sq)) (display "  ") (display (+ exp cur-exp)) (newline)
    (display step) (newline)
    (cond ((= b 0) ans)
          ((= (+ cur-exp exp) b) (* ans sq))
          ((> (+ cur-exp (* exp 2)) b) (pow-iter (* ans sq) a 1 (+ cur-exp exp) (+ 1 step)))
          (else (pow-iter ans (* sq sq) (* exp 2) cur-exp (+ 1 step)))
        )
    )
    (pow-iter 1 a 1 0 1)
  )


(define (fast-expt-iter a b n step)
  (display step) (newline)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter a (* b b) (/ n 2) (+ 1 step)))
        (else
         (fast-expt-iter (* a b) b (- n 1) (+ 1 step) ))))


; from the book
(define (fast-expt b n step)
(display step) (newline)
(cond ((= n 0) 1)
((even? n) (square (fast-expt b (/ n 2) (+ 1 step) )))
(else (* b (fast-expt b (- n 1) (+ 1 step) )))))

(define (even? n)
(= (remainder n 2) 0))