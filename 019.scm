(import (scheme base)
        (scheme write))

(define (count-sundays end-year)
  (define count 1)
  (define sundays 0)
  (define end-month 12)
  (define end-day 31)
  
  (let loop ((year 1901)
             (month 1)
             (day 1))

    ;; Increment count
    (set! count (+ 1 count))

    ;; Increment sundays
    (if (= day 1)
        (begin
          ;; update end-day
          (if (and (= month 2)
                   (if (= 0 (remainder year 100))
                       (= 0 (remainder year 400))
                       (= 0 (remainder year 4))))
              (set! end-day 29)
              (set! end-day (list-ref '(31 28 31 30 31 30 31 31 30 31 30 31)
                                      (- month 1))))
          (if (= (remainder count 7) 0)
              (set! sundays (+ sundays 1)))))

    ;; Increment year/month/day
    (if (= day end-day)
        (if (= month end-month)
            (if (= year end-year)
                sundays
                (loop (+ 1 year) 1 1))
            (loop year (+ 1 month) 1))
        (loop year month (+ 1 day)))))

(display (count-sundays 2000)) ;; 171
