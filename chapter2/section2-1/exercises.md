# 2.1 Introduction to Data Abstraction

## Exercise 1

```scheme
(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (positive? (* n d))
                             +
                             -)))
    (cons (sign (abs (/ n g))) (abs (/ d g)))))
```

## Exercise 2

```scheme
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (let ((p1 (start-segment s)) (p2 (end-segment s)))
    (make-segment (/ (+ (x-point p1) (x-point p2)) 2)
                  (/ (+ (y-point p1) (y-point p2)) 2))))
```

## Exercise 3

```scheme
; Construct rectangle with two points
(define (make-rectangle p1 p2)
  (cons p1 p2))

(define (perimeter r)
  (let ((l (abs (- (x-point (car r)) (x-point (cdr r)))))
        (w (abs (- (y-point (car r)) (y-point (cdr r))))))
    (* 2 (+ l w))))

(define (area r)
  (let ((l (abs (- (x-point (car r)) (x-point (cdr r)))))
        (w (abs (- (y-point (car r)) (y-point (cdr r))))))
    (* l w)))

; Construct rectangle as two lengths
(define (make-rectangle p1 p2)
  (let ((l (abs (- (x-point p1) (x-point p2))))
        (w (abs (- (y-point p1) (y-point p2)))))
    (cons l w)))
```

As far as I can tell, representations of rectangles are different enough where
it is not trivial to use the same methods to compute the same procedures.

