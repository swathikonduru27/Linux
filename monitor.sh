#!/bin/bash
old_c=$(head -1 /var/webserver_monitor/counter_file.txt)
echo $old_c
new_c=$(wc -l < /var/webserver_monitor/unauthorized.log)
new_l=`expr $new_c - $old_c`
if ((new_l > 0))
then
        tail -n $new_l  /var/webserver_monitor/unauthorized.log | mail -s "New entries" swathikonduru144@gmail.com
else
        echo "No unauthorized access" | mail -s "New entries" swathikonduru144@gmail.com
fi
echo $new_l > /var/webserver_monitor/counter_file.txt
