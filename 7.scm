;; 10001st prime
;; Problem 7
;;
;; By listing the first six prime numbers:
;; 2, 3, 5, 7, 11, and 13, we can see that
;; the 6th prime is 13.
;;
;; What is the 10,001st prime number?

;; implementation
(define (prime n)
  (define primes (list 2))
  (let outer ((i 3) (count 1) (last-pair primes))
    (if (< count n)
        (let inner ((remaining primes))
          (define try (car remaining))
          (if (<= (* try try) i)
              (if (positive? (modulo i try))
                  (inner (cdr remaining))
                  (outer (+ i 2) count last-pair))
              (begin (set-cdr! last-pair (list i))
                     (outer (+ i 2) (+ count 1) (cdr last-pair)))))
        (car last-pair))))

;; execution
(display (prime 10001))

;; SOLUTION: 104743

;; Wow, this one was quite difficult. I
;; spared myself the agony of writing a
;; painfully-slow implementation by
;; googling about prime numbers for a bit.
;;
;; What I learned what that this problem
;; is as old as mathematics, and the solutions
;;  we use today aren't so different from the
;; ancient ones.
;;
;; The method above is an implementation of
;; the "Sieve of Eratosthenes." The bulk
;; of the logic is on lines 16 and 17, which
;; prevent us from testing a great deal of
;; numbers.
;;
;; Another speed boost comes from knowing that
;; all primes are odd aside from 2. I'm starting
;; at 3 and incrementing by two each time. A
;; strange loop indeed!
;;
;; I could improve upon this implementation
;; only by making my seive smarter, and
;; not testing primes that match some quadratic
;; formulae, proven to not be prime.
;;
;; I really hate that this solution takes 6
;; seconds to complete. Also that it has two
;; calls to (outer), I feel like there ought
;; to be just one.
;;
;; UPDATE #1:
;;
;; New solution takes < 1 second!
;; With help from @sjamaan, the primes list
;; is now being mutated instead of
;; iterated/shifted each time. *much* faster.
