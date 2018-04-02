#!/bin/bash

function Age_stat
{

      age=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)
      sum=0
      a=0
      b=0
      c=0

   for n in $age
   do
        if [ "$n" != 'Age' ] ; then
            let sum+=1  #index of age
         
            if [ "$n" -lt 20 ] ; then
                  let a+=1  # <20
            fi
            
            if [ "$n" -ge 20 ] && [ "$n" -le 30 ] ; then
                  let b+=1  #[20-30]
            fi

            if [ "$n" -gt 30 ] ; then
                  let c+=1  # >30
            fi

         fi
     

    done

    #Task2_1
    proprotion1=$(awk 'BEGIN{printf "%.3f",'"$a"*100/"$sum"'}')
    proprotion2=$(awk 'BEGIN{printf "%.3f",'"$b"*100/"$sum"'}')
    proprotion3=$(awk 'BEGIN{printf "%.3f",'"$c"*100/"$sum"'}')

    #display the result

    echo "---------------------// Age //----------------------"
    echo "----------------------------------------------------"
    echo "|    Age    |     <20    |   20~30   |      >30    |"
    echo "----------------------------------------------------"
    echo "|Total Number|    "$a"    |   "$b"   |      "$c"    |"
    echo "----------------------------------------------------"
    echo "|Proprotion| "$proprotion1" "%" | "$proprotion2" "%" | "$proprotion3" "%" |" 
    echo "----------------------------------------------------"
 

    
    temp=$(sort -k6 worldcupplayerinfo.tsv| awk -F'\t' '{print $6 "\t" $9}'|head > target0.txt)
    min_names=$(more target0.txt | awk -F'\t' 'BEGIN{min=100;i=1}{if(min>=$1){min=$1;name[i++]=$2}}END{for(n in name)print name[n]}')
    min=$(more target0.txt | awk -F'\t' 'BEGIN{min=100;i=1}{if(min>=$1){min=$1}}END{print min}')
    echo "------ the youngest player ("$min") ------"
    echo "$min_names"

    temp=$(sort -k6 -nr worldcupplayerinfo.tsv| awk -F'\t' '{print $6 "\t" $9}'|head > target1.txt)
    max_names=$(more target1.txt | awk -F'\t' 'BEGIN{max=0;i=1}{if(max<=$1){max=$1;name[i++]=$2}}END{for(n in name)print name[n]}')
    max=$(more target1.txt | awk -F'\t' 'BEGIN{max=0;i=1}{if(max<=$1){max=$1}}END{print max}')
    echo "------ the oldest player ("$max") ------"
    echo "$max_names"

}

function Position_stat
{

   num=$(sed -n '2, $ p' worldcupplayerinfo.tsv|awk -F '\t' '{print $5}'|sort -r |uniq -c|awk '{print $1}')
   position=$(sed -n '2, $ p' worldcupplayerinfo.tsv|awk -F '\t' '{print $5}'|sort -r |uniq -c|awk '{print $2}')
   n=($num)
   p=($position)

   sum=0

   for i in $num
   do
        let sum+=$i
   done

   i=0

   for n in ${num[@]}
   do
        b["$i"]=$(echo "scale=3; 100*$n / $sum "|bc)

        i=$((i+1))
   done

   echo "------------ Position --------------"
   echo "------------------------------------"

   i=0
   p=($position)
   n=($num)


   for k in $(seq 0 $(echo "${#n[@]}-1"|bc))
   do
          echo "Position :${p[$i]}"
          echo "Number : ${n[$i]}"
          echo "Proprotion: ${b[$i]}%"
          let i+=1
   done


}

function Name_stat
{
    longest=$(awk -F'\t' 'BEGIN{max=0}{if(length($9)>max){max=length($9);}}END{print max}' worldcupplayerinfo.tsv)
    long_names=$(awk -F'\t' 'BEGIN{longest='$longest';i=1}{if(length($9)==longest){name[i++]=$9}}END{for(n in name) print name[n]}' worldcupplayerinfo.tsv)
  
    shortest=$(awk -F'\t' 'BEGIN{min=100}{if(length($9)<min){min=length($9);}}END{print min}' worldcupplayerinfo.tsv)
    short_names=$(awk -F'\t' 'BEGIN{shortest='$shortest';i=1}{if(length($9)==shortest){name[i++]=$9}}END{for(n in name) print name[n]}' worldcupplayerinfo.tsv)

    
    echo "------ the  player whose name is the longest ($longest) ------"
    echo "${long_names}"

  
    echo "------ the  player whose name is the shortest ($shortest) ------"
    echo "${short_names}"

}

function main
{
Age_stat
echo -e
Position_stat
echo -e
Name_stat
}

main
