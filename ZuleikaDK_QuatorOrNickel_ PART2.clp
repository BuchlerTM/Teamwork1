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


;/////////////////////////////////////////////////////////////////////////////////////////////////
;//NOTES:											//
;//		METHOD 	| CONDITION | AFFORD:	R8.50	R10.00	R12.50	R15.00	  ( <- each)	//
;//		---------------------------------------------------------------			//
;//		A  	|  <  8.50   |	none							//
;//		B	|  >  8.49   |  	cola						//
;//		C	|  >  9.99   |  	cola,	orange					//
;//		D	|  > 12.49   |  	cola,	orange,	sweets  			//	
;//		E	|  > 14.99   |  	cola,	orange,	sweets, choclate  		//
;//												//
;//												//
;/////////////////////////////////////////////////////////////////////////////////////////////////


(defrule check_MethodA
	(money_counter (y ?y1))
	(test (< ?y1 8.50) )
=>
	(printout t "========================start=====================" crlf)
	(printout t "YOU CAN AFFORD: 	<none>" crlf)
)



(defrule check_MethodB
	(money_counter (y ?y1))
	(test (> ?y1 8.49) )
=>
	(printout t "YOU CAN AFFORD:	Cola		R  8.50c each" crlf)
)


(defrule check_MethodC
	(money_counter (y ?y1))
	(test (> ?y1 9.99) )
=>
	(printout t "		    or	Oranges		R 10.00c each" crlf)
)

(defrule check_MethodD
	(money_counter (y ?y1))
	(test (> ?y1 12.49) )
=>
	(printout t "		    or	Sweets		R 12.50c each" crlf)
)

(defrule check_MethodE
	(money_counter (y ?y1))
	(test (> ?y1 14.99) )
=>
	(printout t "		    or	Choclate	R 15.00c each" crlf)

)




;///////////////////////////////////////////
;//	            ASK FOR:		  //
;//					  //
;//	 R5, R2, R1,  c50,  c20,  c10  	  //
;//					  //
;//     	AND ADD TO TOTAL	  //
;///////////////////////////////////////////



(defrule ask-money-rule
	?f1 <- (money_counter (y ?y1))
	(test (< ?y1 15.01))
=>
	(printout t "=========================end======================" crlf)
	(printout t "" crlf)
	(printout t "" crlf)
	(printout t "========================start=====================" crlf)
	(format t "CURRENT BUDGET:......................R %5.2f%s%n" ?y1 " c.")
	(printout t "" crlf)
	(printout t "PLEASE ADD:	 R5, R2, R1, c50, c20 OR c10" crlf)
	(bind ?given (read))
	(if (or   (eq ?given R5)  (or (eq ?given r5) (eq ?given 5)) )
		 then
		(bind ?sum (+ ?y1 5) )
		(modify  ?f1 (y ?sum))
	 else
		(if (or   (eq ?given R2)  (or (eq ?given r2) (eq ?given 2)) ) 
		 	then
			(bind ?sum (+ ?y1 2) )
			(modify ?f1 (y ?sum) ) 
		 )
		else
			(if (or   (eq ?given R1)  (or (eq ?given r1) (eq ?given 1)) )
			then
			(bind ?sum (+ ?y1 1) )
			(modify ?f1 (y ?sum) )
			)
			else
				(if (or   (eq ?given c50)  (or (eq ?given 50c) (eq ?given 50)) )
				then
				(bind ?sum (+ ?y1 0.50) )
				(modify ?f1 (y ?sum) )
				)
				else
					(if (or   (eq ?given c20)  (or (eq ?given 20c) (eq ?given 20)) )
					then
					(bind ?sum (+ ?y1 0.20) )
					(modify ?f1 (y ?sum) )
					)
					else
						(if (or   (eq ?given c10)  (or (eq ?given 10c) (eq ?given 10)) )
						then
						(bind ?sum (+ ?y1 0.10) )
						(modify ?f1 (y ?sum) )
						)
	)

	(printout t "" crlf)
	(printout t "__________________________________________________" crlf)
	(format t "MODIFIED BUDGET:.....................R %5.2f%s%n" ?sum " c.")
	(printout t "__________________________________________________" crlf)
	(printout t "" crlf)
)








