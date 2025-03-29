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
