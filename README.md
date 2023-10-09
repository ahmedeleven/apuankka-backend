# Apu Ankka Backend

**Apu Ankka** is a web application with a Django backend and a React frontend. It enables users to request and provide simple services, with an option to offer a small fee for the services rendered.

## Dependencies

Before you begin, make sure you have the following dependencies installed:

- Python 3.7 or higher
- Django 3.2.18 or higher
- MySQL 5.7 or higher
- mysqlclient

You can install other dependencies using pip. Run the following command in your terminal:

```bash
pip install -r requirements.txt

```


## Creating the Database and Connecting

To set up the database, follow these steps:

1. Create a new database by running the following command:

```bash
mysql -u <username> -p -e "CREATE DATABASE <database_name>"

```


Replace `<username>` with your MySQL username and `<database_name>` with your preferred database name.

2. Rename the file `.env.example` to `.env` and replace `<your_mysql_password>` with your actual database password.

## Loading Data

### Loading Initial Data

To populate the database with initial data, follow these steps:

1. **Locate the `initial_data.sql` File:**
- You'll find the `initial_data.sql` file in your Django app's directory structure under `api/fixtures/initial_data.sql`. It's within your project's folder structure.

2. **Access Your MySQL Database:**
- Open your MySQL client and connect to the relevant MySQL database.

3. **Choose the Database:**
- Ensure that you're connected to the correct database where you want to load the initial data.

4. **Load the SQL File:**
- Use the SQL command-line client or a GUI tool like MySQL Workbench or phpMyAdmin.
- Execute the SQL commands within the `initial_data.sql` file within your chosen database.

**Example Using the MySQL Command-Line Client:**
```bash
mysql -u your_username -p your_database_name < /path/to/your/django/app/api/fixtures/initial_data.sql
```


Replace `your_username`, `your_database_name`, and `/path/to/your/django/app/api/fixtures/initial_data.sql` with your specific values.

5. **Review and Verify:**
After executing the SQL commands, check your MySQL database to ensure that the initial data has been successfully loaded. Your database should now be populated with the initial data required for the Apu Ankka backend. Please note that the exact steps may vary depending on your MySQL client, so refer to the documentation or help resources of your specific MySQL client for more detailed instructions if needed.

## Running the Project

To run the project, follow these steps:

1. Open your terminal and navigate to the project directory.
2. Activate your virtual environment if you are using one.
3. Start the development server by running the following command:

```bash
python manage.py runserver
```


That's it! You should now be able to access and interact with the Apu Ankka backend project.

