#Margaret Shimerdla
#Module 8.2 Assignment
#Database Development & Use

#import mysql database 
import mysql.connector

db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="Summertime2025!",
    database="movies"
    )
print(db)

#print films currently in table

print("--DISPLAYING FILMS--")

#Create a cursor object
cursor=db.cursor()

#inner join tables
cursor.execute("SELECT film_name,film_director,genre_name,studio_name \
                FROM film INNER JOIN genre ON film.genre_id=genre.genre_id \
                INNER JOIN studio ON film.studio_id=studio.studio_id")
#get results from the cursor object
films=cursor.fetchall()

#iterate over film data and display results
for film in films:
    print("Film Name:{}\nDirector:{}\nGenre:{}\nStudio:{}\n".format \
            (film[0],film[1],film[2],film[3]))
#print films after inserting new film                
print("--DISPLAYING FILMS AFTER INSERT--")

#where new film is being inserted and values
sql="INSERT INTO film (film_name, film_ReleaseDate,film_runtime, film_director, studio_id, genre_id) \
        VALUES(%s, %s, %s,%s,%s,%s)"
#information of values
values=("Wizard of OZ", 1939, 101, "Victor Fleming", 1,3)

#enter new info for tables
cursor.execute(sql, values)
#commit
db.commit()

#cursor object
cursor=db.cursor()
#cursor print new films after insertion
cursor.execute("SELECT film_name,film_director,genre_name,studio_name \
                FROM film INNER JOIN genre ON film.genre_id=genre.genre_id \
                INNER JOIN studio ON film.studio_id=studio.studio_id")
films=cursor.fetchall()
for film in films:
    print("Film Name:{}\nDirector:{}\nGenre:{}\nStudio:{}\n".format \
          (film[0],film[1],film[2],film[3]))
    

#print films after update
print("--DISPLAYING FILMS AFTER UPDATE- Changed Alien to Horror--")

#updated values
sql="UPDATE film SET genre_id = %s WHERE film_name =%s"
val=("1","Alien")
#cursor update new values
cursor.execute(sql, val)
#commit to database
db.commit()

#cursor object
cursor=db.cursor()
#cursor print new films after update
cursor.execute("SELECT film_name,film_director,genre_name,studio_name \
                FROM film INNER JOIN genre ON film.genre_id=genre.genre_id \
                INNER JOIN studio ON film.studio_id=studio.studio_id")
films=cursor.fetchall()
for film in films:
    print("Film Name:{}\nDirector:{}\nGenre:{}\nStudio:{}\n".format \
          (film[0],film[1],film[2],film[3]))

#print films after deletion
print("--DISPLAYING FILMS AFTER DELETE--")

sql="DELETE FROM film WHERE film_id='32'"
#cursor execute deletion
cursor.execute(sql)
#commit to database
db.commit()
#cursor object
cursor=db.cursor()
#cursor print new films after deletion
cursor.execute("SELECT film_name,film_director,genre_name,studio_name \
                FROM film INNER JOIN genre ON film.genre_id=genre.genre_id \
                INNER JOIN studio ON film.studio_id=studio.studio_id")

films=cursor.fetchall()
for film in films:
    print("Film Name:{}\nDirector:{}\nGenre:{}\nStudio:{}\n".format \
          (film[0],film[1],film[2],film[3]))
