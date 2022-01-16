(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (positive? (* n d))
                             +
                             -)))
    (cons (sign (abs (/ n g))) (abs (/ d g)))))

