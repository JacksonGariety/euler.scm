;; Summation of primes
;; Problem 10
;;
;; The sum of the primes below 10 is
;; 2 + 3 + 5 + 7 = 17.
;; Find the sum of all the primes below two million.

;; dependencies
(use srfi-1)

;; implementation
(define (primes-below max)
  (define primes (list 2))
  (let outer ((i 3) (count 1) (last-pair primes))
    (if (< i max)
        (let inner ((remaining primes))
          (define try (car remaining))
          (if (<= (* try try) i)
              (if (positive? (modulo i try))
                  (inner (cdr remaining))
                  (outer (+ i 2) count last-pair))
              (begin (set-cdr! last-pair (list i))
                     (outer (+ i 2) (+ count 1) (cdr last-pair)))))
        primes)))

;; execution
(display (reduce + 0 (primes-below 2000000)))

;; SOLTUION: 142913828922

;; For this problem I'm choosing to let my function
;; return a list rather than the sum. I made this
;; choice because finding the primes below a number
;; is somewhat common in computer science and I'd
;; like to reuse this method in future project euler
;; problems or other personal work.
;;
;; The primes-below method is largely a re-implementation
;; of my solution to problem #7. I've tweaked it slightly
;; so that instead of return the nth-prime, it returns a
;; list of primes-below.
;;
;; The only other thing unique to this implementation is
;; the call to reduce and user of srfi-1.
;;
;; For some reason, this implementation takes a very long
;; time to find a solution. Approximately 16 seconds.
;;
;; This makes me unhappy, but I'm not sure how to speed
;; it up. The only thing I can think of is a better seive.
;;
;; I'm going to look at a few more implementations and come
;; back to this.
;;
;; UPDATE #1: I've looked through a variety of solutions, and
;; mine is significantly faster. More take around 30 seconds,
;; or longer if they don't implement a seive.
;;
;; I guess I'm out of luck?
