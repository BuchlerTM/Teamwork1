(deftemplate money_counter (slot mc))

(deffacts start_money
(money_counter (mc 5)))
	
(defrule check_balance
?f1 <-(money_counter(mc ?amount))
(test(= ?amount 5))
=>
(printout t "Not enough funds. Please add a quarter(5)/nickel(25)" crlf)
(bind ?second_coin (read))
(if (= ?second_coin 25) then 
(modify ?f1(mc 30))
(printout t "New amount is 30 " crlf))
(if (= ?second_coin 5) then 
(modify ?f1(mc 10))
(printout t "New amount is 10 " crlf)))