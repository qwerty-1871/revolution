#!/bin/bash
if [[ $youhunger = 3 ]]; then
	echo You passed away due to starvation last night
	if [[ $haswife = 1 ]]; then
		echo Your family has perished as well
	fi
fi

if [[ $simon = 1 ]]; then
	echo You have passed away from a sudden infection
	echo "You recall being bit by an animal while working on the farm yesterday, but didn't think anything of it"
fi
if [[ $found = 1 ]]; then
	echo You were arrested this morning on suspicion of being a member of an illegal organization
	echo Rather than being given a fair trial, you were hastily sentenced to death without a chance to defend yourself and executed that night
fi
if [[ $jcfail = 1 ]]; then
	echo You have perished, but the Revolution will endure
fi
if [[ $jcexe = 1 ]]; then
	echo You were arrested last night on suspicion of being a counterrevolutionary
	echo Rather than being given a fair trial, you were hastily sentenced to death without a chance to defend yourself and executed that night
fi

echo You made it to Day $day
echo Thank you for playing.
read -p "Press ENTER to continue"
clear 
exit