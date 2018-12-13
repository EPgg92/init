# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    03.sh                                            .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: epoggio <epoggio@student.le-101.fr>        +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/12/13 17:01:00 by epoggio      #+#   ##    ##    #+#        #
#    Updated: 2018/12/13 17:06:04 by epoggio     ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

print_color() # $1 numQ $2 repo $3 color
{
	case $3 in
		1) printf '\e[1;34m%s\e[m\n' "Question Bleu $2/$1";; # BLUE
		2) printf '\e[1;31m%s\e[m\n' "Question Rouge $2/$1";; # RED
		3) printf '\e[1;32m%s\e[m\n' "Question verte $2/$1";; # GREEN
		*) printf "Question $2/$1\n";;
	esac
}

get_color() # $1 numQ $2 repo
{
	if

}

display_execute() # $1 numQ $2 repo
{
	#clear ;
	color=
	print_color $1 $2 color

}

next()
{
	echo "Passer à la question suivante"
	select sr in "Suivante" "Relancer"; do
    	case $sr in
        	Suivante ) echo NON LOL ; break ;;
        	Relancer ) next ;;
    	esac
	done
}



main() # $1 repo
{

	for dir in network system scripts;
	do
		for  file in $(ls $dir);
		do
			echo $dir/$file;
		done
	done
}



#next lol;

#display_execute $1;

#print_color 01 pouit $1
main
