; The mathematical definition is from the Wikipedia article
(define (pascal n k)
  (cond ((= n k) 1)
        ((= k 0) 1)
        (else (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))

