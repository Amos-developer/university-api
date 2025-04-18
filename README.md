🎓 University API

This is a simple PHP REST API that provides information about students and subjects for a university program.

🚀 Features

- **`GET /students`** → Returns a list of 10 students and their enrolled programs.
- **`GET /subjects`** → Returns a list of subjects categorized by academic years (Year 1 - Year 4).



🛠️ Setup Instructions

**🔹 1. Clone the Repository**
To get started, clone this repository using Git:

```sh
git clone https://github.com/Amos-developer/university-api.git
cd university-api

2. Install Apache and PHP
Install Apache and PHP on your server (Ubuntu example):
>> sudo apt update
>> sudo apt install apache2 php libapache2-mod-php


3. Install MySQL
Install MySQL to store the database:
>> sudo apt install mysql-server
>> sudo mysql_secure_installation


4. Set Up the Database
    1. Log in to MySQL:
>> sudo mysql -u root -p
    2. Create a new database and tables (students and subjects) for storing the necessary data.


5. Configure API Files
    1. Place the PHP files in the Apache document root directory (usually /var/www/html):
>> sudo mv university-api/* /var/www/html/
>> sudo chown -R www-data:www-data /var/www/html
    2. Edit db.php to include your database credentials (username, password, database name).

6. Restart Apache
Restart Apache to apply changes:
>> sudo systemctl restart apache2


7. Test the API
You can now access the API in your browser or using Postman:

GET /students: http://localhost/students.php

GET /subjects: http://localhost/subjects.php


🚀 Deploying to AWS
1. Launch an EC2 Instance
Create an EC2 instance (Ubuntu recommended).

Set up security groups to allow HTTP (port 80) and SSH (port 22) traffic.

2. SSH into Your EC2 Instance
>> ssh -i your-key.pem ubuntu@your-ec2-public-ip


3. Set Up the Server
Follow the setup instructions from Step 2 to Step 5 to install Apache, PHP, MySQL, and configure your database and API files on your EC2 instance.

4. Make Sure Apache is Running
Check if Apache is running:
>> sudo systemctl status apache2

If it's not running, start it:
>>sudo systemctl start apache2

5. Access Your API
Once everything is set up, you can access your API using your EC2 instance’s public IP:

GET /students: http://your-ec2-ip/students.php

GET /subjects: http://your-ec2-ip/subjects.php


🛠️ Dependencies
Apache: Web server for hosting the PHP API.

PHP: Server-side scripting language for API logic.

MySQL: Database for storing university data.

### My API Endpoints are:
>> http://16.171.20.107/students.php
>> http://16.171.20.107/subjects.php

## Assignment 2
The following are three common backup schemes, how each is executed, and their pros and cons:

1. Full Backup
🔧 Execution:
-> A full backup copies all files and data from the system to the backup location (external drive, cloud, etc.).
-> It’s typically done on a weekly or monthly basis.

Advantages:
1) Simple to restore — only one backup file is needed.
2) Easy to manage and verify.

Disadvantages:
1) Takes the most time and storage space.
2) Not efficient for frequent backups.


2. Incremental Backup
🔧 Execution:
-> Starts with a full backup.
-> Afterward, only changes since the last backup (full or incremental) are saved.

For example, if files are modified on Monday and Tuesday, Monday’s backup has changes from Sunday, and Tuesday’s has only changes from Monday.

Advantages:
i) Fast and space-efficient after the initial full backup.
ii)Ideal for daily or even hourly backups.

Disadvantages:
i)Restoration is slow — you need the full backup and all subsequent incremental backups.
ii)If one backup in the chain is lost, recovery is incomplete.

3. Differential Backup
🔧 Execution:
-> Starts with a full backup.
-> Each differential backup saves all changes since the last full backup.

For instance, Monday’s backup includes changes from Sunday, and Tuesday’s includes changes from Sunday to Tuesday.

Advantages:
i) Faster to restore than incremental (only need full + latest differential).
ii) More data redundancy than incremental.

Disadvantages:
i)Grows larger over time until the next full backup.
ii)Slower than incremental for backup, but faster for recovery.
