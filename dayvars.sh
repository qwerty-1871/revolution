#!/bin/bash
actions=3
prompt=1
day=$(($day+1))
if [[ $grow > 0 ]]; then
	grow=$(($grow+1))
fi
growleft=$((5 - $grow))
if [[ $grow = 5 ]]; then
	cropsgrew=1
	grow=0
	hascrops=1
fi
if [[ $(($food+1)) -gt $fam ]]; then
	food=$(($food-$fam))
	
    if [[ $youhunger -gt 0 ]]; then
		youhunger=$(($youhunger-1))
	fi
	if [[ $wifehunger -gt 0 ]] && [[ $wife = 1 ]]; then
		wifehunger=$(($wifehunger-1))
	fi
	if [[ $child1hunger -gt 0 ]] && [[ $child1 = 1 ]]; then
		child1hunger=$(($child1hunger-1))
	fi
	if [[ $child2hunger -gt 0 ]] && [[ $child2 = 1 ]]; then
		child2hunger=$(($child2hunger-1))
	fi
	if [[ $child3hunger -gt 0 ]] && [[ $child3 = 1 ]]; then
		child3hunger=$(($child3hunger-1))
	fi
    
else
	child3hunger=$(($child3hunger+1))
    if [[ $food -lt 4 ]]; then
        child2hunger=$(($child2hunger+1))
        if [[ $food -lt 3 ]]; then
            child1hunger=$(($child1hunger+1))
            if [[ $food -lt 2 ]]; then
                wifehunger=$(($wifehunger+1))
                if [[ $food = 0 ]]; then
                    youhunger=$((youhunger+1))
                fi
            fi
        fi
    fi
fi
if [[ $youhunger = 3 ]]; then
	you=0
fi
if [[ $wifehunger = 3 ]]; then
	wife=0
fi
if [[ $child1hunger = 3 ]]; then
	child1=0
fi
if [[ $child2hunger = 3 ]]; then
	child2=0
fi
if [[ $child3hunger = 3 ]]; then
	child3=0
fi
fam=$(($you + $wife + $child1 + $child2 + $child3))
if [[ $day = 6 ]] || [[ $mafu = 1 ]]; then 
	if [[ $grow > 0 ]] || [[ $cropsgrew = 1 ]]; then #pests
		mafu=0
		pests=1
		actions=0
	else
		mafu=1
	fi
fi
simon=$((0 + SRANDOM % 200))
if [[ $jacobin = 1 ]]; then
	jacobin=2
fi
if [[ $jacobin = 4 ]]; then
	jacobin=5
fi
if [[ $jacobin = 9 ]]; then
	jacobin=10
fi
if [[ $jacobin = 6 ]]; then
	found=$((0 + $RANDOM % 20))
fi
if [[ $found = 1 ]]; then
	you=0
fi
if [[ $you = 0 ]]; then
	run=0
fi
if [[ $day = 23 ]] && [[ $jacobin = 7 ]]; then
	run=0
	you=0
	jcexe=1
fi