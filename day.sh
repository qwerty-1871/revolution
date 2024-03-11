#setup
source ./startvars.sh

#text
while [[ $run = 1 ]]; do
	while [[ $prompt = 1 ]]; do
		clear
		source ./prompt.sh
		source ./choice.sh
	done
	source ./dayvars.sh
	read -p "Press ENTER to begin Day $day"
done
clear
if [[ $you = 0 ]]; then
	source ./died.sh
fi
