(define n 103)

(define (digits n)
  (if (zero? n)
      '()
      (cons (remainder n 10) (digits (quotient n 10)))))


(define (permuted-multiples cap)
  (let loop ((n 1)
             (m 2)
             (prev '()))
    (let ((sig (sort (digits (* n m)) <)))
      (cond ((and (= m cap) (equal? sig prev))
             n)
            ((and (< m cap) (or (equal? prev '()) (equal? sig prev)))
             (loop n (+ m 1) sig))
            (else (loop (+ n 1) 2 '()))))))

(display (permuted-multiples 6))
