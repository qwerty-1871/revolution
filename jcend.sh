#!/bin/bash
clear
echo "You find yourself face to face with the man that has exploited you since the day you were born"
echo "You had never really considered the gravity of the situation you were in - it was the same for most people born into your class - but now that you've been offered a glimpse of what life could be you are filled with anger"
echo "You hold on tightly to the dagger in your coat pocket, and prepare to strike..."
read -p "Press ENTER to continue"
jcfail=$((1 + SRANDOM % 5))
if [[ $jcfail = 1 ]]; then
	echo "As you begin to lift the dagger, his eyes dart to your pocket and he lunges at you"
	echo "He turns the dagger against you and presses it into your chest, swiftly draining the life from your body"
	echo "Your last thought is of your family and of hope for a better future for them"
	read -p "Press ENTER to continue"
	clear
	source ./died.sh
else
	jcfail=2
	echo "In one swift motion, you bring the dagger out of your pocket, jump across the table, and thrust it into his neck"
	echo "His shock offers him no chance to resist and it is not long before he stops moving completely"
	echo "You feel a sense of hope and freedom you have never known before but it is dogged by apprehension"
	echo "Not long after you finish cleaning up, a man you recognize as one of the Jacobins you met with arrives at your farm"
	echo "He assures you that all is going well and assures you that no harm will come to you for what you have done"
	echo "After he leaves, you spend the rest of the day with your family, enjoying your first day off in a long time"
	echo "The future seems bright for you"
	read -p "Press ENTER to continue"
	clear
	echo "The storming of the Bastile would only be the beginning of the French Revolution"
	echo "Immediately afterwards, the newly-formed National Assembly - which unlike the Estates General provided equal and fair representation to the French people - passed a series of laws abolishing feudalism(which was the class-based system that forced your character in this game to work against his will for his lord), severing the state's relationship with the Catholic Church, and enacting a declaration of human rights"
	echo "Soon after this, the monarchy would be abolished entirely and replaced with a republic. France would soon find itself involved in a series of wars against reactionary powers in Europe wishing to crush the Revolution, causing a spirit of paranoia that led to the Republic crumbling into a tyrannical dictatorship under Robespierre. The following Reign of Terror would see thousands executed for fear of anti-Revolutionary views or actions before Robespierre himself was executed for his tyranny"
	echo "The Republic would never be able to stablize itself and it was eventually overthrown by Napoleon Bonaparte, who proceeded to declare himself Emperor of the French. Ultimately this Empire would fall as well due to the aforementioned wars and the old monarchy would return to power"
    echo "The spirit of Revolution never died in France however, as after a series of wars, coups, and revolts France would once more become a Republic, as it is today"
    echo
    echo "Thank you for playing!"
    read -p "Press ENTER to continue"
    clear
    exit
fi
