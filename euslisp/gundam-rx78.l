(require :GGC_TestModel_rx78_20170112 "package://gundameus/robots/gundam-rx78.l")

(setq gundam-rx78-robot GGC_TestModel_rx78_20170112-robot)
(defun gundam-rx78 () (setq *gundam-rx78* (instance gundam-rx78-robot :init)))
