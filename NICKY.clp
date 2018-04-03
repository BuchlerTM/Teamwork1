(deftemplate money_counter (slot amount))

(deffacts  initial-facts (money_counter (amount 15)))


(defrule check_balance (money_counter (amount ?amount))
?f1 <-(money_counter (amount ?amount))
(test (= ?amount 15 ) )
=>	
(printout t "NOT ENOUGH FUNDS ADD QUATER OR NICKEL" crlf)
(bind ?added (read))
(if(eq ?added quater)
then 
(bind ?total(+ ?amount 25))
(modify ?f1( amount ?total))
(printout t "TOTAL AMOUNT: " ?total " c , sucessfull.")

else
(if (eq ?added nickel)
then 
(bind ?total(+ ?amount 5))
(modify ?f1( amount ?total))
(printout t "TOTAL AMOUNT: " ?total " c , not enough. ")
)
)
)
;(printout t "TOTAL AMOUNT: " ?total " c "))
