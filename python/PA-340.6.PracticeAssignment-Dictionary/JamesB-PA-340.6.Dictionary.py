import json

# initialize empty dictionary for storing movie data
movie_database = {
    "The Dark Knight": {
        "year": 2008,
        "genre": "Action",
        "director": "Christopher Nolan",
        "actors": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"]
    },
    "Inception": {
        "year": 2010,
        "genre": "Sci-Fi",
        "director": "Christopher Nolan",
        "actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Ellen Page"]
    },
    "Pulp Fiction": {
        "year": 1994,
        "genre": "Crime",
        "director": "Quentin Tarantino",
        "actors": ["John Travolta", "Samuel L. Jackson", "Uma Thurman"]
    }
}

# Add hyphens to release date
def add_hyphen(num):
    index1 = 4
    index2 = 6

    return f"{num[:index1]}-{num[index1:index2]}-{num[index2:]}"

# Add movie to database
def add_movie():
    while True:
        title = input("\nEnter the movie title: ").title()
        if title == "":
            print("Please enter a title or press ctrl-c to exit: ")
        else:
            break
    while True:
        genre = input("\nEnter the movie genre: ").title()
        if genre == "":
            print("Please enter a genre or press ctrl-c to exit: ")
        else:
            break
    while True:
        director = input("\nEnter the name of the director: ").title()
        if director == "":
            print("Please enter a director or press ctrl-c to exit: ")
        else:
            break

    while True:
        release_date = input("\nEnter the release date of the movie (YYYY-MM-DD): ")
        if not release_date.isnumeric():
            print("Please enter numeric characters: ")
            if release_date == "":
                print("Please enter a release date or press ctrl-c to exit: ")
        else:
            release_date = add_hyphen(release_date)
            break

    while True:
        actors = input("\nEnter the names of the actors (separated by commas): ").title()
        if actors == "":
            print("Please enter actor(s)/actress(es) (separated by commas) or press ctrl-c to exit: ")
        else:
            actors_list = actors.split(", ")
            break
    
    movie_database[title] = {
        "genre": genre,
        "director": director,
        "release_date": release_date,
        "actors": actors_list
    }
    
    print(f"\nYou just added {title.title()} to the database.")

# Edit existing movie in database
def edit_movie():
    title = input("\nWhat movie title would you like to edit: ").title()
    if title in movie_database:
        print(f"\nCurrent information for {title}:\n")
        print(json.dumps(movie_database[title], indent=4))
        
        # Prompt user for updated information
        genre = input("Enter the movie genre (or press Enter to keep current value): ").title()
        director = input("Enter the name of the director (or press Enter to keep current value): ").title()
        release_date = input("Enter the release date of the movie (YYYY-MM-DD) (or press Enter to keep current value): ")
        actors = input("Enter the names of the actors (separated by commas) (or press Enter to keep current value): ").title()
        actors_list = actors.split(", ")
        
        # Update the dictionary with the new information
        if genre:
            movie_database[title]["genre"] = genre
        if director:
            movie_database[title]["director"] = director
        if release_date:
            movie_database[title]["release_date"] = release_date
        if actors:
            movie_database[title]["actors"] = actors_list
        
        print(f"\n{title} has been updated.")
    else:
        print(f"\n{title} is not in the database.")

# Delete movie from database
def delete_movie():
    title = input("\nEnter the movie title to delete: ").title()
    if title in movie_database:
        del movie_database[title]
        print(f"\n{title} has been removed from the database.")
    else:
        print(f"\n{title} is not in the database.")

# View all movies in database
def view_all_movies():
    print("\nAll movies in the database:\n")
    for movie, info in movie_database.items():
        print(f"{movie}: {json.dumps(info, indent=4)}")

# Search for a movie based on user-specified criteria
def search_movies():
    print("\nSearch movies in the database:")
    criteria = input("\nEnter the search criteria: ").title()
    matches = []
    for movie, info in movie_database.items():
        if criteria in movie or criteria in info["genre"] or criteria in info["director"] or criteria in info["actors"]:
            matches.append(movie)
    if matches:
        print("\nMatches found:")
        for match in matches:
            print(f"{match}: {json.dumps(movie_database[match], indent=4)}")
    else:
        print("\nNo matches found.")

# Save movie data to a file
def save_data():
    filename = input("\nEnter the filename to save to: ")
    with open(filename, "w") as file:
        json.dump(movie_database, file, indent=4)
    print("\nData saved successfully.")

# Load movie data from a file
def load_data():
    filename = input("\nEnter the filename to load from: ")
    with open(filename, "r") as file:
        data = json.load(file)
    global movie_database
    movie_database = data
    print("\nData loaded successfully.")

# Main program loop
while True:
    print("\n==== Movie Database Management System ====\n")
    print("1. Add a new movie")
    print("2. Edit an existing movie")
    print("3. Delete a movie")
    print("4. View all movies")
    print("5. Search movies")
    print("6. Save data to file")
    print("7. Load data from file")
    print("8. Exit\n")
    choice = input("Enter your choice: ")

    if choice == "1":
        add_movie()
    elif choice == "2":
        edit_movie()
    elif choice == "3":
        delete_movie()
    elif choice == "4":
        view_all_movies()
    elif choice == "5":
        search_movies()
    elif choice == "6":
        save_data()
    elif choice == "7":
        load_data()
    elif choice == "8":
        exit()
    else:
        print("Invalid choice. Please try again.")
