(deftemplate items (slot item))


;;;facts
(deffacts initial-facts-item (items(item Cola)))
(deffacts initial-facts-item (items(item Orange)))
(deffacts initial-facts-item (items(item Sweets)))
(deffacts initial-facts-item (items(item Chocolate)))



;;;Ask question
(defrule display_items_let_user_choose (items(item ?item))
=>
(println " There is different items to choose from please choose one and make payment ")
(println " Item 1: Cola R8.50 ")
(println " Item 2: Orange R10.00 ")
(println " Item 3: Sweets R12.50 ")
(println " Item 4: Chocolate R15.00 ")

(bind ?item (read))
(assert(item ?item)))

;;;;determine Cola
(defrule determine_Cola (items(item ?item))
(test(eq ?item Cola))
=>
(assert(item Cola))
(printout t "You chose Item 1: Cola R8.50"))

;;;;determine Orange
(defrule determine_Orange (items(item ?item))
(test(eq ?item Orange))
=>
(assert(item Orange))
(printout t "You chose Item 2: Orange R10.00"))

;;;;determine Sweets
(defrule determine_Sweets (items(item ?item))
(test(eq ?item Sweets))
=>
(assert(item Sweets))
(printout t "You chose Item 3: Sweets R12.50"))

;;;;determine Chocolate
(defrule determine_Chocolate (items(item ?item))
(test(eq ?item Chocolate))
=>
(assert(item Chocolate))
(printout t "You chose Item 4: Chocolate R15.00"))
