#!/usr/bin/env bash


getFileName() {
  name=$1
  len=${#name}
  endLen=`expr $len - 3`
  sub=${name:endLen}
#  echo $name
#  echo $len
#  echo $endLen
#  echo '不带后缀文件名：'$sub''
   echo $sub
}
x=`getFileName 'app.jar'`
echo $x
#echo `getFileName 'app.jar'`

#echo

