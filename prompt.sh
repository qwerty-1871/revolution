#start
echo It is Day $day
echo You have '$'$cash
echo You have enough food for the daily needs of $food people
echo You have $actions actions left today
source ./condit.sh
echo
#options
echo "You may do the following actions:" 
if [[ $jacobin = 8 ]] && [[ $actions > 0 ]]; then
	echo "l - Write a letter to your lord (1)"
fi
if [[ $jacobin = 1 ]] && [[ $actions > 2 ]]; then
	echo "j - Go to the location given in the letter (3)"
fi
if [[ $actions > 2 ]]; then
	echo "b - Go into the city to buy food (3)"
fi
if [[ $grow = 0 ]] && [[ $actions > 1 ]]; then
	echo "p - Plant crops (2)"
elif [[ $grow = 4 ]]; then
	echo "You already have crops growing. They will be ready tomorrow!"
elif [[ $grow > 1 ]]; then
	echo "You already have crops growing. They will be ready in" $growleft "days"
fi
if [[ $hascrops = 1 ]] && [[ $actions > 0 ]]; then
	echo "g - Sell your crops to your lord (1)"
fi
echo "f - Check on the status of your family"
echo "s - Sleep (0)"
echo "Enter your choice below. The cost of each action is given in parentheses."