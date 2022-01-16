(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (and (or (negative? n) (negative? d))
                       (not (and (negative? n) (negative? d))))
                  -
                  +)))
    (cons (sign (abs (/ n g))) (abs (/ d g)))))

