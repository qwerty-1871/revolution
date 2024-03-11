#!/bin/bash
clear
buyingfood=1

echo You have '$'$cash and $fam people in your family
echo Food for the daily needs of one person is currently '$'$foodprice
echo How much would you like to purchase?

while [[ $buyingfood = 1 ]]; do
	read buyfood
	case $buyfood in
		done) 
			buyingfood=0 
		;;
		''|*[!0-9]*) 
			echo Invalid input 
		;;
		*)
			if [[ $buyfood -gt $(($cash/$foodprice)) ]]; then
				echo "You cannot afford that much, you can purchase at most $(($cash/$foodprice))"
			else
				food=$(($food+$buyfood))
				cash=$(($cash-$(($buyfood*$foodprice))))
				echo Your purchase was successful
				echo You now have enough food for the daily needs of $food people
				echo You have '$'$cash remaining
				echo You may purchase more now or input '"'done'"' to head home
			fi
		;;
	esac
done
