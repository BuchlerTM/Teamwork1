(deftemplate money_count(slot count))
(deffacts initail_count(money_count(count 0)))

(defrule addMoney
   ?f <- (money_count (count ?count))
   (test (< ?count 35))
  =>
   (printout t "Add quater 'q' or nickle 'n' to total amount : " ?count crlf)
   (bind ?answer (read))
   (if (eq ?answer q) then
     (bind ?s (+ ?count 25))
	 (modify ?f(count ?s))
	 else (if (eq ?answer n) then 
	  (bind ?s (+ ?count 5)))
	  (modify ?f(count ?s))))
	  
(defrule have_enought
     ?f <- (money_count (count ?count))
	(test(= ?count 35))
	=>
	(printout t "You have enought for a soft drink!" crlf))
	
(defrule have_More
     ?f <- (money_count (count ?count))
	(test(> ?count 35))
	=>
	(printout t "You have to much for a soft drink!" crlf))