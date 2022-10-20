**LINUX CLUSTER MONITORING PROJECT**

**SYNOPSIS** 

This project provides help to the Jarvis team in managing their resources better. The project has two focuses:

1.Collect statistical information about the hardware.

2.Act as a monitoring agent for Linux servers thus providing information about the resources these nodes/servers are using._

The data that gets generated are inserted into a database each minute using crontab and bash scripting and it will be used to generate reports for future resource planning. This will ensure decision are data driven and informed.  

**Steps involved: **

Kickstart a PostgresSQL instance after ensuring Docker is installed and running 

Create a database name “host_agent” that will have tables which will store information related to the hardware and resource usage. 

Create two tables “host_info” and “Host_usage” in the data base mentioned above.

Using bash, execute a script that will collect hardware information and insert data into “host_info” table.

Using bash, execute a script inside crontab that can run and collect information (every minute) about hardware usage and insert data into “host_usage” table thus helping in monitoring usage data.

**INTRODUCTION**: 

The Linux cluster monitoring Agent project is executed on Jarvis Virtual Machine hosted by Google cloud platform. The purpose of the project is to achieve optimised utilisation of the company’s resources. The project helps Jarvis admin team managing existing nodes/servers in this Linux cluster. 

The information that is being collected is stored in relational databases that are being updated from time to time thus helping the admin team in key decision-making process around resource usage and its availability. The project has capabilities to generate reports using SQL commands. 

Various technologies were used such as Docker, Intellij IDEA, Crontab, Postgres SQL, GCP, knowledge of Bash, Kanban, agile Methodology and SDLC. Git was highly used in order to manage different stages of development thus keeping team and senior developers well informed about the updates and revisions. 

**ARCHITECTURE AND DESIGN**


![image](https://user-images.githubusercontent.com/114460054/196605465-fdba3650-f7e4-4e87-9f6e-72598b146e5d.png)





**PSQL_Docker.sh:**
To enable developers, deploy, run, update, and manage this project quickly and more efficiently and to ensure that relevant code, tools and installed technologies are easy to share and manage for future use; the Postgres SQL is provisioned BY CREATING AND STARTING UP THE DOCKER. 



**SQL script:** Data base and tables are being created to collect information pertaining to the hardware and its constantly changing usage data. These scripts are a guide in case future developers need to use the code. The script focuses on creating the databases and creating of the relevant tables which are host_info and host_usage.


**- host_info.sh:** The script is dedicatedly collecting general information related to the hardware and cpu. The information is not expected to change frequently therefore it is executed once. It is totally dependent on the organisation to run the script as required. The information getting obtained is as follows:
Host name
CPU number
CPU architecture
CPU model
CPU mhz
L2_Cache
Total memory 


**- host_usage.sh**: The script is dedicatedly collecting information pertaining to the data used by the hardware. As this information is changing every minute, it is imperative that the script needs to run constantly. Therefore, with the help of crontab the script is being run every minute and data is being store real time inside the database host_agent.
The information getting obtained is as follows:
Free memory
CPU idle
CPU kernel
Disk .io
Available disk space

**- crontab:** As described above, Crontab is dedicatedly collecting hardware usage information as requested and getting stored in the Host_usage table inside host_agent database.  This information is being collected every minute and the script collecting this information is host_usage.sh described above.


**DATABASE MODELLING**

_The data base Host_agent has two following tables:_
1.Host_info
2.Host_usage

Host_info relation is designed keeping below specs:
![image](https://user-images.githubusercontent.com/114460054/196605726-33a6c836-15b8-4a4d-81b9-367a1509c36b.png)


Host_usage relation is designed keeping below specs:
![image](https://user-images.githubusercontent.com/114460054/196605845-063a8714-c6a2-4e11-aba8-0e967678913c.png)


**TEST**

The script was ran multiple times and recorded entries were manually checked.

The tables are storing information as per the data types and the information stored is getting updated every minute using crontab for Host_usage and this has been verified and it has passed the test

The tables are storing information as per the data types and the information stored is getting stored as in when script is executed for Host_info and this has been verified and it has passed the test. 

![image](https://user-images.githubusercontent.com/114460054/196605902-edd38673-4fc5-46fd-a972-84906730521e.png)


**DEPLOYMENT**

The project source code has been pushed to GitHub repository for senior developers use and further improvements / additional features if need be. 


**IMPROVEMENTS**

The project does not touch upon complex changes if relevant or considered in the future such as new hardware updates or a tech disruption. 
The project does not provide detailed information about hardware and its usage as this can be become a problem in future as in when organisation grows, and more new machines get added.
The data collected is limited and will not do justice in providing information which can be complex. 






