#! /bin/bash
 
RESULT=$(whiptail --title "Menu" --menu "choose an option" 12 40 4 "1" "" "2" "" "3" "" 3>&1 1>&2 2>&3)

if [ $RESULT -eq 1 ] || [ $RESULT -eq 2 ]
then
  echo $RESULT
else
  echo NONE
fi

case $RESULT in
  1)
    echo "good case!!"
    ;;
  2)
    echo "error case!!"
    ;;
  *)
    echo "WtF...!?"
esac