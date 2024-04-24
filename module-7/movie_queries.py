import mysql.connector

db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="Summertime2025!",
    database="movies"
    )
print(db)
print("--DISPLAYING Studio RECORDS--")
cursor=db.cursor()
cursor.execute("SELECT studio_id, studio_name FROM studio")
studios = cursor.fetchall()
for studio in studios:
    print("Studio ID:{}\n Studio Name:{}\n".format (studio[0], studio[1]))
print("--DISPLAYING Genre RECORDS--")
cursor.execute("SELECT genre_id,genre_name FROM genre")
genres = cursor.fetchall()
for genre in genres:
    print("Genre ID:{}\nGenre Name:{}\n".format(genre[0],genre[1]))
print("--DISPLAYING Short Film Records--")                                              
cursor.execute("SELECT film_name,film_runtime, film_director FROM film")
films=cursor.fetchall()
for film in films:
    print("Film Name: {}\nRuntime:{}\n".format(film[0],film[1])) 
print("--DISPLAYING Director RECORDS in Order--")
for film in films:
    print("Film Name: {}\nDirector:{}\n".format(film[0],film[2]))
