#!/bin/bash

echo " _   _          _   _ "
echo "| | | |        | | | |"
echo "| | | |_      _| | | |"
echo "| | | \ \ /\ / / | | |"
echo "| |_| |\ V  V /| |_| |"
echo " \___/  \_/\_/  \___/ "
echo "=================================="
echo "UWUWUWUWUWUWUWUWUWUWU BY IDK"
# chagne static (home and siteurl) static address
# of the option_value table
# Note may require sudo depending on how the webserver's db was configured
# check with
# select * from wp_options where option_name = 'siteurl';
# select * from wp_options where option_name = 'home';

printf "Please enter your name of the wordpress database: "
read -r db_name

printf "Please the mysql user: "
read -r username
printf "Please enter $username password: "
read -s password

printf "Please enter ip-addr in a URL form\nhttp://ip-addr or https://ip-addr: "
read -r url

mysql -u$username -p$password <<EOF
use $db_name;
update wp_options set option_value = "$url" where option_name = "home";
update wp_options set option_value = "$url" where option_name = "siteurl";
EOF
