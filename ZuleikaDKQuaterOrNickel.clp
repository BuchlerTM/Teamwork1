;///////////////
;//DEFTEMPLATE//
;///////////////

(deftemplate money_counter "total amount/budget" (slot y))

;//////////////////////////
;//DEFFACTS INITIAL FACTS//
;//////////////////////////

(deffacts  initial-facts "starting amount/budget" 
(money_counter (y 0)) )


;///////////////////////////////////
;//CHECK AMOUNT/FACT/MONEY_COUNTER//
;///////////////////////////////////

(defrule checkA-money_counter 
	(money_counter (y ?y1))
	(test (< ?y1 35 ) )
=>	
	(printout t "BUDGET: " ?y1 "c. You do not have enough money to buy an soft drink which costs 35c." crlf)
	(printout t "" crlf)
)	

(defrule checkB-money_counter 
	(money_counter (y ?y1))
	(test (= ?y1 35 ) )
=>	
	(printout t "BUDGET: " ?y1 "c. You have just enough money to buy an soft drink which costs 35c." crlf)
	(printout t "" crlf)
)	

(defrule checkC-money_counter 
	(money_counter (y ?y1))
	(test (> ?y1 35 ) )
=>	
	(printout t "BUDGET: " ?y1 "c. You have more than enough money to buy an soft drink which costs 35c." crlf)
	(printout t "" crlf)
)


;/////////////////////////////////////////////
;//ASK FOR NICKEL OR QUATER AND ADD TO TOTAL//
;/////////////////////////////////////////////

(defrule ask-money-rule
	?f1 <- (money_counter (y ?y1))
	(test (< ?y1 35))
	=>
	(printout t "Please place a nickel(n) or a quater(q) to add to the total amount of " ?y1 "c -->" crlf)
	(bind ?given (read))
	(if (eq ?given n) 
		 then
		(bind ?sum (+ ?y1 5) )
		(modify  ?f1 (y ?sum))
	 else
		(if (eq ?given q) 
		 	then
			(bind ?sum (+ ?y1 25) )
			(modify  ?f1 (y ?sum)) )
	)
	(printout t "The modified total amount is : " ?sum "c." crlf)
	(printout t "" crlf)
)













