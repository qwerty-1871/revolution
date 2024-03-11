#!/bin/bash
ch=1
while [[ $ch = 1 ]]; do
	read choice
	case $choice in 
		b) # buy crops
			if [[ $actions > 2 ]]; then
				ch=0
				actions=$(($actions-3))
				source buyfood.sh
			else
				echo "That requires three actions, but you only have $actions left!"
			fi
		;;
		s) # sleep
			clear
			echo Good night. 
			ch=0
			prompt=0
		;;
		g) # sell legally
			if [[ $actions > 0 ]] && [[ $hascrops = 1 ]]; then
				clear
				ch=0
				actions=$(($actions-1))
				hascrops=0
				lsales=$(($lsales+1))
				cash=$(($cash+$yield))
				echo You have sold your crop yield to your lord and earned '$'$yield
				echo You would have made much more if you were not subject to the exorbitant taxes levied by both the French state and your lord himself
				if [[ $lsales = 1 ]]; then
					echo Sometimes you feel that they are exploiting you
					echo The King of France claims divine right to rule, so you suppose you shouldn"'"t question it
				fi
				if [[ $hastp = 1 ]]; then
					hastp=2
					echo "Taxes have gone up further"
					echo "Despite the people starving the King still seeks to exploit them"
				fi	
				read -p "Press ENTER to continue"
			elif [[ $actions = 0 ]]; then
				echo "That requires one action, but you do not have any left!"
			else
				echo "You do not have any crops harvested!"
			fi
		;;
		p) #plant
			if [[ $actions > 1 ]] && [[ $grow = 0 ]]; then
				ch=0
				grow=1
				actions=$(($actions-2))
				clear
				echo You have planted crops on your farm
				echo They will be ready in four days
				read -p "Press ENTER to continue"
			elif [[ $grow > 0 ]]; then
				echo "You already have crops growing!"
			else
				echo "That requires two actions, but you only have $actions!"
			fi
		;;	
		f) #family
			ch=0
			clear
			echo You have a hunger level of $youhunger
			if [[ $wife = 1 ]]; then
				echo Your wife has a hunger level of $wifehunger
			else
				echo Your wife has passed away
			fi
			if [[ $child1 = 1 ]]; then
				echo Your first child has a hunger level of $child1hunger
			else
				echo Your first child has passed away
			fi
			if [[ $child2 = 1 ]]; then
				echo Your second child has a hunger level of $child2hunger
			else
				echo Your second child has passed away
			fi
			if [[ $child3 = 1 ]]; then
				echo Your third child has a hunger level of $child3hunger
			else
				echo Your third child has passed away
			fi
			echo Hunger increases by 1 at the end of every day
			echo Reaching a hunger level of 3 will cause a person to pass away.
			echo
			read -p "Press ENTER to continue"
		;;
		j) 
			if [[ $actions > 2 ]] && [[ $jacobin = 1 ]]; then
				ch=0
				clear
				jloop=1
				actions=$(($actions-3))
				echo "You arrived at the address at 2100 and were greeted by what appeared to be a simple working-class coffeehouse long past its hour of closing."
				echo "A man - wearing on his hat a cockade of blue, white, and red - greeted you and quickly ushered you in."
				echo "Inside, you were sat at one of the circular tables with the man - who introduced himself as Maximilien Robespierre - and two others, all three appearing rather neat despite wearing cheap clothing."
				echo "They introduced themselves as members of the Jacobin Club, and outlined their desire for a France free from the tyranny of the monarchy, clergy, and nobility, where all people would be equal."
				echo "The man promised that you would have ownership over your farm and be allowed to sell your crops yourself, free from the burden of excessive taxes or noble fees if you joined them"	
				echo "He has his hand stretched out to you"
				echo "What will you do?"
				echo "y - Shake his hand, accepting his invitation"
				echo "n - Politely decline, and head home"
				while [[ $jloop = 1 ]]; do
					read j
					case $j in  
						y)
							clear
							jacobin=6
							echo "The man smiled as he shook your hand and welcomed you to the group."
							echo "He said he would write you soon and that great things will come in your future"
							jloop=0
						;;
						n)
							jacobin=7
							clear
							echo "The three stared at you in silence as you left."
							jloop=0
						;;
						*)
							echo Invalid input
						;;
					esac
			done
			read -p "Press ENTER to continue."
			clear
			elif [[ $jacobin != 1 ]]; then
				echo "What do you think you're doing?"
			else	
				echo "You're out of time."
			fi
		;;
		l)
			if [[ $actions > 0 ]] && [[ $jacobin = 8 ]]; then
				ch=0
				clear
				jacobin=10
				echo "You wrote your lord a letter asking him to meet you tomorrow morning to discuss an improved farming method you claimed to have found"
				echo "He is sure to arrive considering his unending lust for money"
				echo "There's no turning back now."
				read -p "Press ENTER to continue"
				clear
			elif [[ $jacobin != 0 ]]; then
				echo You have nothing to say to him.
			else
				echo That was a poor use of your time.
			fi
		;;
		quit)
			exit
		;;
		nostarvingplease)
			ch=0
			food=9999
			echo Cheater. 
		;;
		*)
			echo Invalid input
		;;
	esac
done

	
