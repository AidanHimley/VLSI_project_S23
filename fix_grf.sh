sim_directory=$(readlink -f ~/simulation)
escaped_directory=$(echo ${sim_directory} | sed 's/\//\\\//g')
sed -i "s/\/net\/hawksbill.ece.Virginia.EDU\/hawkdata4\/scratch\/ah8uqq\/simulation/${escaped_directory}/g" internal_signals.grf

