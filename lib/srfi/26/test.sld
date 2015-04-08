(define-library (srfi 26 test)
  (export run-tests)
  (import (chibi) (srfi 26) (chibi test))
  (begin
    (define (run-tests)
      (test-begin "srfi-26: cut")
      (let ((x 'orig))
        (let ((f (cute list x)))
          (set! x 'wrong)
          (test '(orig) (f))))
      (let ((x 'wrong))
        (let ((f (cut list x)))
          (set! x 'right)
          (test '(right) (f))))
      (test-end))))