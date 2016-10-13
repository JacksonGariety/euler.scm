;; Problem 23

;; TOO SLOW
;; USELESS

(import (scheme base)
        (scheme write))

(define (divisor-sum n)
  (let loop ((i (- n 1)))
    (cond
     ((<= i 1) 1)
     ((= (remainder n i) 0)
      (+ i (loop (- i 1))))
     (else (loop (- i 1))))))

(define (abundant? n)
  (> (divisor-sum n) n))

(define (non-abundant-sums c)
  (let loop ((abundants '())
             (i 1))
    ;; Loop through positive numbers
    (if (= i 28123)
        (let loop* ((i 12)
                    (sum 0))
          (if (= i 28123)
              sum
              (let loop** ((abundants abundants)
                           (inner-sum 0))
                (if (pair? abundants)
                    (loop** (cdr abundants)
                            (if (and (>= (car abundants i))
                                     (abundant? i))
                                (+ inner-sum i)
                                inner-sum))
                    (loop* i
                           (+ sum inner-sum))))))
        (loop (if (abundant? i)
                  (append abundants i)
                  abundants)
              (+ i 1)))))

(display (non-abundant-sums 2))
