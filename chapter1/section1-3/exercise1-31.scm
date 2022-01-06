(define (inc n) (+ n 1))
(define (identity n) n)

(define (factorial n) (product identity 1 inc n))

(define (wallis n)
  (define (f x) (/ (* 4 x x)
                   (- (* 4 x x) 1)))
  (* 2 (product f 1 inc n)))

