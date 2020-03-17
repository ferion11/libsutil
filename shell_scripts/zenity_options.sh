title="Select example"
prompt="Pick an option:"
options=("A" "B" "C")

while opt=$(zenity --title="$title" --text="$prompt" --list \
			--column="Options" "${options[@]}"); do

	case "$opt" in
		"${options[0]}" ) zenity --info --text="You picked $opt, option 1";;
		"${options[1]}" ) zenity --info --text="You picked $opt, option 2";;
		"${options[2]}" ) zenity --info --text="You picked $opt, option 3";;
		*) zenity --error --text="Invalid option. Try another one.";;
	esac

done
