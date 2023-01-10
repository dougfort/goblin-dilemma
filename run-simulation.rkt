#lang racket

;; 

(require goblins)
(require "prisoner.rkt")

(define p1 (make-prisoner "P1"))

((prisoner-vat p1) 'call (prisoner-ref p1) 'name)