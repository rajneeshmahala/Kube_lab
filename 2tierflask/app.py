from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/db')
def db_test():
    try:
        connection = mysql.connector.connect(
            host="mysql-service",
            user="demouser",
            password="demopassword",
            database="demodb"
        )
        cursor = connection.cursor()
        cursor.execute("SELECT DATABASE();")
        record = cursor.fetchone()
        return f"Connected to database: {record}"
    except mysql.connector.Error as err:
        return f"Error: {err}"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
