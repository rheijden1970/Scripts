# tab breedte
clear

#----- Importeer Functies -----#

dir="$(dirname "$0")"

. $dir/functies/controleer
. $dir/functies/opschonen
. $dir/functies/opwaarderen   

#----- Fancy Messages -----#
show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}

# Main
function main {
    eval `resize`
    MAIN=$(whiptail \
        --notags \
        --title "Ubuntu Post-Installatie script" \
        --menu "\nWat wil je gaan doen?" \
        --cancel-button "Verlaten" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        opwaarderen         'Voer een systeem opwaardering uit' \
        opschonen           'Maak het systeem schoon' \
        3>&1 1>&2 2>&3)
     
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        $MAIN
    else
        quit
    fi
}
# Quit
function quit {
    if (whiptail --title "Afsluiten" --yesno "Weet u het zeker dat u wilt afsluiten?" 10 60) then
        echo "Afsluiten..."
        show_info 'Bedankt voor het gebruik!'
        exit 99
    else
        main
    fi
}
#RUN
check_dependencies
while :
do
  main
done
#END OF SCRIP
