;; copied from that guy who does em in C#

(import (scheme base)
        (scheme write)
        (srfi 1))

(define (! n)
  (let loop ((i 1)
             (accum 1))
    (if (> i n)
        accum
        (loop (+ i 1) (* accum i)))))

(define (combinatorics series n)
  (let loop ((series (reverse series))
             (remaining n)
             (result '())
             (numbers (iota 10)))
    (if (pair? (cdr series))
        (let* ((digit (car series))
               (factorial (! digit))
               (j (/ remaining factorial)))
          (loop (cdr series)
                (modulo remaining factorial)
                (append result (list (list-ref numbers (floor j))))
                (append (take numbers (- j 1)) (drop numbers j))))
        (fold (lambda (a b)
                (string-append b (number->string a)))
              ""
              result))))

(display (combinatorics (iota 10) 1000000))
