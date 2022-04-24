#!/usr/bin/env bash
password=`tr '\n' ' ' < password.list`
echo "Hello, World" > base.txt
for passwd in $password
do
  zip -e --password=$passwd greet.txt.zip base.txt
  john-the-ripper.zip2john greet.txt.zip | cut -d ":" -f 2 > greet.txt.zip.hash
  start_time=`date +%s`
  hashcat -m 17210 -a 3 -w 4  greet.txt.zip.hash -1 '?l?u?d' --increment --increment-min 1 --increment-max 16 '?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1'
  end_time=`date +%s`
  run_time=$((end_time - start_time))
  echo $passwd,$run_time >> output.txt
done
rm base.txt greet*
