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

