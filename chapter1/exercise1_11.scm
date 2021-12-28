; Recursive definition
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; To differentiate from the previous definition, the iterative version will be
; named g.
; a = n - 1
; b = n - 2
; c = n - 3
(define (g n)
  (define (g-iter a b c count)
    (if (= count 0)
        a
        (g-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< n 3)
      n
      (g-iter 2 1 0 (- n 2))))

