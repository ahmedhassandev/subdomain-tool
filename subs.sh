#!/bin/bash
echo -e "\033[0;33m
               _____                                                                                                                          
              / __  \                                                                      
             / /  \  \                                                                      
            / /____\  \                                                                      
           /  ______   \                                                                      
          / /        \  \                                                                      
         / /          \  \                                                                      
        /_/            \__\  \033[0;31m #FOR SUB DOMAIN CHECK !\033[0;0
"
for sub in $(cat $1 | uniq)
do 
if [[ $(ping -c 1 $sub 2> /dev/null) ]]
then
	echo -e "$sub \033[0;32m 	+++++++++++ ((WORKING)) \033[0;0m"
	echo $sub >> WORKING.txt
        echo -e "\033[0;33m==================================================================\033[0;0m"	

else 
	echo -e "$sub \033[0;31m 	------------- ((OFFLINE))\033[0;0m"
	echo $sub >> OFFLINE.txt
        echo -e "\033[0;33m==================================================================\033[0;0m"	
fi
done
for ip in $(cat WORKING.txt) 
do 
ping -c 1 $ip  | cut -d "(" -f 2 | cut -d ")" -f 1 | head -n 1 >> ips.txt
done 
echo " ****************************  GREAT ***********************************
