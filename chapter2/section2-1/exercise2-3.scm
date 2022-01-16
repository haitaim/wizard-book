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

