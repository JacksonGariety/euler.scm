;; Problem 96
;; Su Doku

(import (scheme base)
        (scheme write)
        (scheme file))

(define puzzles
  (call-with-input-file "96.txt"
    (lambda (in)
      (let f ((char (read-char in))
              (puzzles '()))

        (cond ((eof-object? char) (reverse (map (lambda (ln) (reverse ln)) puzzles)))
              ((char=? char #\G) (begin (read-line in)
                                        (f (read-char in) (cons '() puzzles))))
              ((char=? char #\n) (f (read-char in) (cons (cons '() (car puzzles)) (cdr puzzles))))
              ((string->number (string char))
               (f (read-char in) (cons (cons char (car puzzles)) (cdr puzzles))))
              (else (f (read-char in) puzzles)))))))

(define (solve puzzle)
  (let backtrack ((i 0))
    (list-ref puzzle i)))

(display (solve (car puzzles)))
