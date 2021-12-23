#!r6rs
(import (rnrs base (6)))

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess old-guess)
    (> 0.001 (abs (/ (- old-guess guess) guess))))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess old-guess)
    (if (good-enough? guess old-guess)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1 x))
