# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    03.sh                                            .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: epoggio <epoggio@student.le-101.fr>        +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/12/13 17:01:00 by epoggio      #+#   ##    ##    #+#        #
#    Updated: 2019/01/08 22:16:47 by epoggio     ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

print_color() # $1 numQ $2 repo $3 color
{
	case $3 in
		1) printf '\e[1;34m%s\e[m\n' "Question Bleu	$2/$1 (une commande)";; # BLUE
		2) printf '\e[1;31m%s\e[m\n' "Question Rouge	$2/$1 (un résultat de commande)";; # RED
		3) printf '\e[1;32m%s\e[m\n' "Question verte	$2/$1 (une déduction)";; # GREEN
		*) printf "Question $2/$1\n";;
	esac
}

get_color() # $1 numQ $2 repo
{
	case $2 in
		network )
		if [ "$1" = 06 ] || [ "$1" = 08 ] || [ "$1" = 11 ] ||[ "$1" = 14 ] ||[ "$1" = 15 ] # [[ "$1" =~ ^(06|08|11|14|15)$ ]]
		then
				echo 2
			elif [ "$1" = 09 ] || [ "$1" = 13 ] # [[ "$1" =~ ^(09|13)$ ]]
			then
				echo 3
 			else
				echo 1
			fi
			 ;;
		system )
		if [ "$1" = 01 ] || [ "$1" = 03 ] || [ "$1" = 08 ] ||[ "$1" = 16 ] ||[ "$1" = 23 ] #[[ "$1" =~ ^(01|03|08|16|23)$ ]]
		then
				echo 2
			elif [ "$1" = 19 ];
			then
				echo 3
			else
				echo 1
			fi
			 ;;
		*) echo 0 ;;
	esac
}

display_execute() # $1 numQ $2 repo
{
	clear ;
	print_color $1 $2 $(get_color $1 $2);
	echo ''
	cat $2/$1
	echo ''
}

next()
{
	display_execute $1 $2;
	echo "Passer à la question suivante"
	select sr in "Suivante" "Executer" "EXIT";;
	do
    	case $sr in
        	Suivante ) break ;;
			Executer ) source $2/$1 ;;
			EXIT ) exit ;;
    	esac
	done
}

main() # $1 repo
{
	a="Quelle partie souhaitez-vous corriger ?"
	echo $a
	select dir in "network" "system" "scripts" "EXIT"; do
    	case $dir in
			EXIT ) exit ;;
		esac
		for  file in $(ls $dir);
		do
			next $file $dir;
		done
		exit
	done
}

main
