#! /bin/sh

        psql_host=$1
	psql_port=$2
	db_name=$3
	psql_user=$4
	psql_password=$5


	if [ $# -ne  5 ]; then
  echo 'Need 5 arguments (host, port, db name, psql user, psql pw)'
  exit 1
fi





hostname=$(hostname -f)

host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";


memory_info=$(cat /proc/meminfo)
cpu_details=$(vmstat --unit M)
       
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

memory_free=$(echo "$memory_info"  | egrep "^MemFree:" | awk '{print $2}' | xargs)
	
cpu_idle=$(echo "$cpu_details"  | egrep "^ 0 " | awk '{print $15}' | xargs)


cpu_kernel=$(echo "$cpu_details"  | egrep "^ 0 " | awk '{print $14}' | xargs)



disk_io=$(echo "$(vmstat -d)" | tail -1 | awk '{print $10}')


disk_available=$(echo "$(df -BM /)" | tail -1 | awk '{printf "%d\n", $4}')

	
insert_stmt="INSERT INTO host_usage(timestamp, host_id, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available)
        VALUES ('$timestamp',$host_id, '$memory_free', '$cpu_idle',
            '$cpu_kernel', '$disk_io', '$disk_available');"


export PGPASSWORD=$psql_password

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"


exit $?
	
