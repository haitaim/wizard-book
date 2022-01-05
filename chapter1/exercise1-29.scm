; The procedure assumes that sum is defined elsewhere
; You can use the one provided by the text or the one from exercise1-30.scm

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (coefficient k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (term k)
    (* (coefficient k)
       (f (+ a (* k h)))))
  (define (inc n) (+ n 1))
  (* (/ h 3) (sum term 0 inc n)))

