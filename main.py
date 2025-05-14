import mysql.connector


def get_connection():
    connection = mysql.connector.connect(user='sihengz',
                                         password='232975045',
                                         host='10.8.37.226',
                                         database='sihengz_db')
    return connection


def execute_query(query):
    connect = get_connection()
    cursor = connect.cursor()
    courses = []
    rooms = []
    periods = []
    teachers = []
    cursor.execute(query)
    for row in cursor:
        courses.append(row[2])
        rooms.append(row[3])
        periods.append(row[4])
        teachers.append(row[5])
    connect.close()
    cursor.close()
    master_list = [courses, rooms, periods, teachers]
    return master_list


student_id = input("Enter student id: ")
table = execute_query(f"CALL GetCourses({student_id})")
for i in range(1, len(table[0])):
    print(f"Period: {table[2][i]}")
    print(f"Course: {table[0][i]}")
    print(f"Room: {table[1][i]}")
    print(f"Teacher: {table[3][i]}")
    print()

