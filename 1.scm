;; Problem 1
;;
;; If we list all the natural numbers below 10 that are
;; multiples of 3 or 5, we get 3, 5, 6 and 9. The sum
;; of these multiples is 23. Find the sum of all the
;; multiples of 3 or 5 below 1000.

;; implementation
(define (sum-of-multiples-of-three-or-five n)
  (let loop ((sum 0) (n (- n 1)))
    (if (positive? n)
        (loop (if (or (zero? (modulo n 3))
                      (zero? (modulo n 5)))
                  (+ sum n)
                  sum)
              (- n 1))
        sum)))

;; execute
(display (sum-of-multiples-of-three-or-five 1000))
(exit)

;; Note that I switch from using (positive?) to using
;; (zero?) on line 11. I wanted 'sum to be the last
;; expression in the method to be clear that it's
;; what is being returned.
;;
;; Also note that my prior use of (set!) has been
;; refactored into a named let loop. The let handles
;; the scope of sum and n, so that mutation isn't
;; necessary, just recursion.
;;
;; SOLUTION: 233168
