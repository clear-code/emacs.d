(require 'rst)

(let ((i 1))
  (while (<= i rst-level-face-max)
    (let ((face-name (intern (format "rst-level-%d-face" i))))
      (set-face-background face-name nil)
      (setq i (1+ i)))))
