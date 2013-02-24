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
     1) autobuild/tools/quincyatt.sh; echo "Done.";;
      2) autobuild/tools/quincyatt2.sh; echo "Done.";;     
      3) autobuild/tools/h0tcakez.sh; echo "Done.";;
      4) autobuild/tools/h0tcakezalt.sh; echo "Done.";;
      5) autobuild/tools/h0tcakeztest.sh; echo "Done.";;
      CU) autobuild/tools/cleanup.sh; echo "Done.";;
      x) clear; echo; echo "Goodbye."; echo; exit 1;;
      *) echo "Invalid option"; sleep 1; continue;;
    esac
  fi

  autobuild/tools/press_enter

done

