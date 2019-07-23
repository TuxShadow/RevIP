#/bin/sh

DS='\033[0m'


banner(){
	echo -e " \e[32;1m
   ____    U _____ u__     __            ____    
U |  _ \ u \| ___ |/\ \   / /u  ___    U|  _ \ u 
 \| |_) |/  |  _|    \ \ / //  |_ _|   \| |_) |/ 
  |  _ <    | |___   /\ V /_,-. | |     |  __/   
  |_| \_\   |_____| U  \_/-(_/U/| |\u   |_|      
  //   \\_  <<   >>   //   .-,_|___|_,-.||>>_    
 (__)  (__)(__) (__) (__)   \_)-' '-(_/(__)__)    


  $DS"
}

cek_curl(){


	  which curl > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e "\e[31;1m curl -----------------------  \e[32;1m [OK] \e[0m"
       else
       	
       	echo ""
       	echo "DO U WANT INSTALL curl ? (YES|NO) "
       	read jawaban
       	if [[ $jawaban="YES" || $jawaban="yes" || $jawaban="y" || $jawaban="" ]]; then
       		apt-get update
       		apt-get install curl
       	else	
       		exit
       	fi
       	fi
       	sleep 1
}

domain() {

	read -p " [+] Reverse Target : " target

url= curl -s 'https://api.hackertarget.com/reverseiplookup/?q='$target --compressed > target.tmp


}

cek() {
	input="target.tmp"
	while IFS= read -r line 
	do
		
	curl -o /dev/null --max-time 10 --silent --head --write-out "%{http_code}  $line\n" "$line" 
    
    
  done < "$input"
  rm target.tmp
	}
    
    

    banner
    sleep 5
    cek_curl

	domain
	cek
	
