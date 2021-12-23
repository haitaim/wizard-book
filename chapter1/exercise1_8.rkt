#!r6rs
(import (rnrs base (6)))

(define (square x) (* x x))

(define (cbrt x)
  (define (good-enough? guess old-guess)
    (> 0.001 (abs (/ (- old-guess guess) guess))))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess) 3)))
  (define (cbrt-iter guess old-guess)
    (if (good-enough? guess old-guess)
        guess
        (cbrt-iter (improve guess) guess)))
  (cbrt-iter 1 x))

