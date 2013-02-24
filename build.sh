#!/bin/sh

version=1.0

chmod -R +x tools
PATH=tools:$PATH

while :
do

  clear
  echo 
  echo "================================================="
  echo "*    FJ CM-10.1 Kang AutoBuild for quincyatt    *"
  echo "================================================="  
  echo "  1 - Build CM-10.1 Kang using ccache"
  echo "  2 - Build CM-10.1 Kang not using ccache"
  echo ""
  echo "  3 - Compile h0tcakez kernel"
  echo "  4 - Compile h0tcakez ALT kernel"
  echo "  5 - Compile h0tcakez latest Test kernel"
  echo ""
  echo "  CU - Clean up Build Directory"
  echo ""
  echo "  x - Exit"
  echo 
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
     1) sh tools/quincyatt.sh; echo "Done.";;
      2) sh tools/quincyatt2.sh; echo "Done.";;     
      3) sh tools/h0tcakez.sh; echo "Done.";;
      4) sh tools/h0tcakezalt.sh; echo "Done.";;
      5) sh tools/h0tcakeztest.sh; echo "Done.";;
      CU) sh tools/cleanup.sh; echo "Done.";;
      x) clear; echo; echo "Goodbye."; echo; exit 1;;
      *) echo "Invalid option"; sleep 1; continue;;
    esac
  fi

  tools/press_enter

done

