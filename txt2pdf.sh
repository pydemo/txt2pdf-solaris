#!/usr/bin/bash
#Usage ./txt2pdf.sh 1DGBL.txt

full_txt_file=$1
txt_file=$(basename "$full_txt_file")
filename="${txt_file%.*}"
echo 11,$filename
#exit
ps_file="${filename}.pdf"
pdf_file="${filename}.pdf"
echo "------------------------------------
Generating PDF for file ${full_txt_file}
------------------------------------"
server=user@server
remote_mpage=/usr/bin/mpage
remote_gs=/usr/bin/gs
remote_location=/tmp
rm ${pdf_file}
cat ${full_txt_file}|ssh ${server}  "cat - >${remote_location}/${txt_file};${remote_mpage} -bA4 -1 -l -L62 -W180  ${remote_location}/${txt_file} >${remote_location}/${ps_file}; cat ${remote_location}/${ps_file}|${remote_gs} -sPAPERSIZE=a4 -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=${remote_location}/${pdf_file} - ;cat ${remote_location}/${pdf_file}">${pdf_file}
ls -al ${pdf_file}
echo "###############################
#####Output saved to ${pdf_file}
###############################"
echo "PDF creation time:" 
perl -e '@d=localtime ((stat(shift))[9]); printf "%02d-%02d-%04d %02d:%02d:%02d\n", $d[3],$d[4]+1,$d[5]+1900,$d[2],$d[1],$d[0]' ${pdf_file}
