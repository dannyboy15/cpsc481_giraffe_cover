(defun get_moves (x y)
  "Get a list of possible move for a given coordinate"
  (setq max 6)
  (setq min 0)
  (setq moves ())

  ; Rook moves
  ; left one
  (let ((_x (- x 1)))
    (if (>= _x min)
      (setq moves (cons (list _x y) moves))))
  ; right one
  (let ((_x (+ x 1)))
    (if (<= _x max)
      (setq moves (cons (list _x y) moves))))
  ; up one
  (let ((_y (- y 1)))
    (if (>= _y min)
      (setq moves (cons (list x _y) moves))))
  ; down one
  (let ((_y (+ y 1)))
    (if (<= _y max)
      (setq moves (cons (list x _y) moves))))

  ; Knight moves
  ; left
  (let ((_x (- x 2)) (d_y (+ y 1)) (u_y (- y 1)))
    (when (>= _x min)
      (if (>= u_y min)
        (setq moves (cons (list _x u_y) moves)))
      (if (<= d_y max)
        (setq moves (cons (list _x d_y) moves)))))
  ; right
  (let ((_x (+ x 2)) (d_y (+ y 1)) (u_y (- y 1)))
    (when (<= _x max)
      (if (>= u_y min)
        (setq moves (cons (list _x u_y) moves)))
      (if (<= d_y max)
        (setq moves (cons (list _x d_y) moves)))))
  ; down
  (let ((_y (+ y 2)) (r_x (+ x 1)) (l_x (- x 1)))
    (when (<= _y max)
      (if (>= l_x min)
        (setq moves (cons (list l_x _y) moves)))
      (if (<= r_x max)
        (setq moves (cons (list r_x _y) moves)))))
  ; up
  (let ((_y (- y 2)) (r_x (+ x 1)) (l_x (- x 1)))
    (when (>= _y min)
      (if (>= l_x min)
        (setq moves (cons (list l_x _y) moves)))
      (if (<= r_x max)
        (setq moves (cons (list r_x _y) moves))))))

(defun list_filter (list1 list2)
  "Remove items from list2 that are in list1"
  (setq listt list2)
  (loop for x in list1
    do (setq listt (remove x listt :test 'equal)))
  listt)


; Test
; (get_moves 3 3)
(print "original list")
(setq moves (get_moves 3 3))
(print moves)
(print "remove ((2 1) (4 5) (2 5))")
(print (list_filter '((2 1) (4 5) (2 5)) moves))
