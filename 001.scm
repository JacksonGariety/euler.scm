;; Multiples of 3 and 5
;; Problem 1
;;
;; If we list all the natural numbers below 10 that are
;; multiples of 3 or 5, we get 3, 5, 6 and 9. The sum
;; of these multiples is 23. Find the sum of all the
;; multiples of 3 or 5 below 1000.

;; implementation
(define sum-of-multiples-of-three-or-five
  (lambda (n)
    (let loop ((sum 0) (n (- n 1)))
      (if (> n 0)
          (loop (if (or (= (modulo n 3) 0)
                        (= (modulo n 5) 0))
                    (+ sum n)
                    sum)
                (- n 1))
          sum))))

;; execution
(display (sum-of-multiples-of-three-or-five 1000))

;; SOLUTION: 233168

;; Note that I switch from using (positive?) to using
;; (zero?) on line 11. I wanted 'sum to be the last
;; expression in the method to be clear that it's
;; what is being returned.
;;
;; Also note that my prior use of (set!) has been
;; refactored into a named let loop. The let handles
;; the scope of sum and n, so that mutation isn't
;; necessary, just recursion.
