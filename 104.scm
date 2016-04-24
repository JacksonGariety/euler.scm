;; 1000-digit Fibonacci number
;; Problem 25
;;
;; Fibonacci!
;; The 12th term, F12, is the first term
;; to contain three digits.
;;
;; What is the index of the first term in
;; the Fibonacci sequence to contain 1000
;; digits?

;; (define (pandigital-fib)
;;   (define 1to9 '(1 2 3 4 5 6 7 8 9))
;;   (let fibonacci ((a 62345986)
;;                   (b 1023341551)
;;                   (i 1))
;;     (define ls (sort (map (lambda (c) (string->number (string c))) (string->list (number->string b))) <))
;;     (define open (take ls 9))
;;     (define close (take (reverse ls) 9))
;;     (display i)
;;     (newline)
;;     (if (and (equal? a 1to9) (equal? b 1to9))
;;         i
;;         (fibonacci b (+ a b) (+ i 1))))) ;; 39th & 40th fib

(define intersect
  (lambda (set1 set2)
    (cond
     ((null? set1)(quote ()))
     ((member? (car set1) set2)
      (cons (car set1)
            (intersect (cdr set1) set2)))
     (else (intersect (cdr set1) set2)))))


(define (digits n)
  (if (zero? n)
      '()
      (cons (remainder n 10) (digits (quotient n 10)))))

(define (top-nine n)
  (define t (- (* n 0.20898764024997873) 0.3494850021680094))
  (digits (floor->exact (expt 10 (+ (- t (floor->exact t)) 8)))))

(define (bottom-nine n)
  (let bottom-nine* ((n n) (acc '()) (i 0))
    (if (= i 9) acc (bottom-nine* (quotient n 10)
                                (cons (remainder n 10) acc)
                                (+ i 1)))))

(define (pandigital-fib)
  (define 1to9 '(1 2 3 4 5 6 7 8 9))
  (let fibonacci ((a 62345986)
                  (b 1023341551)
                  (i 40))
    (define top (sort (top-nine b) <))
    (define top (sort (bottom-nine b) <))
    (display i)
    (if (and (equal? top 1to9) (equal? bottom 1to9))
        i
        (fibonacci b (+ a b) (+ i 1))))) ;; 39th & 40th fib

;; still working on this one
