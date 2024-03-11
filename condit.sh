#!/bin/bash

if [[ $jacobin = 10 ]]; then
	run=0
	prompt=0
	source ./jcend.sh
fi
#deaths
if [[ $wifehunger = 3 ]] && [[ $haswife = 1 ]]; then
	haswife=0
	echo Your wife passed away due to starvation last night
fi
if [[ $child1hunger = 3 ]] && [[ $haschild1 = 1 ]]; then
	haschild1=0
	echo Your firstborn child passed away due to starvation last night
fi
if [[ $child2hunger = 3 ]] && [[ $haschild2 = 1 ]]; then
	haschild2=0
	echo Your second child passed away due to starvation last night
fi
if [[ $child3hunger = 3 ]] && [[ $haschild3 = 1 ]]; then
	haschild3=0
	echo Your youngest child passed away due to starvation last night
fi

#daily flavor
if [[ $day = 1 ]]; then 
	echo "You and your children have spent most of the day doing labor on the farm"
    echo Just like every other day
fi
if [[ $day = 4 ]] && [[ $child3hunger = 0 ]]; then
	echo "Life is hard, but you are just grateful that you and your family have food on the table"
	echo "Most nights, at least."
fi
if [[ $day = 5 ]] && [[ $child3hunger = 0 ]]; then
	echo "Your family is happy"
	echo "Things seem to be looking up for you"
fi
if [[ $day = 11 ]]; then
	echo "You wonder if things will ever really change"
fi
if [[ $day = 13 ]]; then
	foodprice=25
fi 
if [[ $day = 16 ]] && [[ $jacobin = 0 ]]; then
	jacobin=1
	echo You have recieved a letter requesting your presence at an address in Paris you do not recognize
	echo It would almost certainly take up the rest of your day, but they have promised you a way out of your current destitution
fi
if [[ $day = 17 ]] && [[ $jacobin = 6 ]]; then
	echo You feel an uneasy sense of confidence about the future
fi
if [[ $day = 19 ]] && [[ $jacobin = 6 ]]; then
	jacobin=8
	echo You have recieved a letter briefly describing the beginnings of a revolt planned by the Jacobin Club
	echo They are going to storm a prison called the bastile in Paris to seize weapons to use against the government
	echo They ask that you request a meeting with your lord for tomorrow, and that you assassinate him
	echo They promise that they will protect you and that this will be the dawn of a new era for France
fi
if [[ $day = 20 ]]; then
	if [[ $jacobin = 2 ]] || [[ $jacobin = 7 ]]; then
		echo You have heard news of chaos in Paris
		echo "News does not spread well to your region, but you've heard reports that a fortress has been stormed by revolutionaries seeking to bring democracy to France"
		echo You just hope that this will improve your situation
		foodprice=15
		yield=350
	fi
fi
if [[ $day = 23 ]] && [[ $jacobin = 2 ]]; then
	clear
	echo You recieved news this morning that the National Assembly in Paris	- an instituion you were not even aware existed - has abolished feudalism
	echo Your lord was arrested last night and you now own the land that you and your family live off of
	echo "With this, you are hopeful that your times of hardship have come to an end..."
	echo
	echo Thank you for playing
	read -p "Press ENTER to continue"
	clear
	exit
fi
if [[ $pests = 1 ]]; then 
	echo Pests ate your crops while they were growing last night!
	echo You had to spend the day tracking them down and exterminating them
	hascrops=0
	cropsgrew=0
	grow=0
	pests=0
	tp=$(($day+2))
fi
if [[ $day = $tp ]]; then
	echo "It appears that you are not the only one to have pests attack your farm!"
	echo "Food prices have increased and you have heard rumours of protests in the capital..."
	foodprice=20
	yield=250
	hastp=1
fi
if [[ $hastp = 2 ]]; then
	hastp=0
	echo "You're not sure now much more of this you can take"
fi
#crops/food
if [[ $cropsgrew = 1 ]]; then
	cropsgrew=0
	echo Your crops have finished growing!
	if [[ $day = 2 ]]; then
		echo You are required by your feudal contract to sell them to your lord
		echo You may choose not to, but if you are caught you will face severe punishment
	fi
fi
if [[ $food -lt $fam ]]; then
	echo You do not have enough food to feed your family today
	if [[ $hasalf = 0 ]]; then
		hasalf=1
		echo If you do not buy food, they will grow hungry
		echo They may perish if this goes on for long enough
	fi
fi
