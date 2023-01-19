#lang racket

;; 

(require goblins)
(require "player.rkt")

(module+ main
  (define p1 (make-player "P1"))

  ((player-vat p1) 'call (player-ref p1) 'name))