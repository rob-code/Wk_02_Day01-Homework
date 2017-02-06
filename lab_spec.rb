require('minitest/autorun')
require('minitest/rg')
require_relative('./lab')

class TestLabExercises < Minitest::Test

###Part A

# For this part we want you to make a class that represents a CodeClan student. 

# * Create a Class called Student that takes in a name (String) and a cohort (integer) when an new instance is created.
# * Create a couple of Getter methods, one that returns the name property and one that returns the cohort property of the student.
# * Add in Setter methods to update the students name and what cohort they are in.
# * Create a method that gets the student to talk (eg. Returns "I can talk!).
# * Create a method that takes in a students favourite programming language and returns it as part of a string (eg. student1.say_favourite_language("Ruby") -> "I love Ruby").

def test_class_Students
  student = Student.new("name", 10)
end

def test_getter_method
  student = Student.new("Robert", 10)
  assert_equal("Robert", student.name)
  assert_equal(10, student.cohort)
end

def test_setter_method
  student = Student.new("Robert", 10)
  student.name = "Peter"
  student.cohort = 100
  assert_equal("Peter", student.name)
  assert_equal(100, student.cohort)
end

def test_talks
  student = Student.new("Robert", 10)
  assert_equal("I can talk!", student.talks)
end

def test_favourite_language
  student = Student.new("Robert", 10)
  reply = student.say_favourite_language("Ruby")
  assert_equal("I love Ruby", reply)
end

###Part B

# Now we would like you to make a class that represents a sports team.

# * Make a class to represent a Team that has the properties Team name (String), Players (Array of strings) and a Coach (String).
# * For each property in the class make a Getter method than can return them.
# * Create a setter method to allow the coach's name to be updated.
# * Refactor the class to use attr_reader or attr_accessor instead of your own getter and setter methods. 
# * Create a method that adds a new player to the player's array.
# * Add a method that takes in a string of a player's name and checks to see if they are in the players array.
# * Add a points property into your class that starts at 0.
# * Create a method that takes in whether the team has won or lost and updates the points property for a win.

def test_class_test
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
end

def test_getter_method
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")

  assert_equal("Scotland", team.team_name)
  assert_equal(["player1", "player2", "player3"], team.players)
  assert_equal("Alex Ferguson", team.coach)
end

def test_add_new_player
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
  team.add_new_player("player4")
  assert_equal(["player1", "player2", "player3", "player4"], team.players)
end

def test_is_player_in_team__true
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
  check_player = team.is_player_in_team("player3")
  assert_equal(true, check_player)
end 

def test_is_player_in_team__false
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
  check_player = team.is_player_in_team("player1000")
  assert_equal(false, check_player)
end 

def test_game_won_or_lost__won
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
  points = team.game_won_or_lost("won")
  assert_equal(1, points)
end

def test_game_won_or_lost__lost
  players = ["player1", "player2", "player3"]
  team = Team.new("Scotland", players, "Alex Ferguson")
  points = team.game_won_or_lost("lost")
  assert_equal(0, points)
end


###Extension:

# Model a Library as a class.

# * Create a class for a Library that has an array of books. Each book should be a hash with a title, which is a string, and rental details, which is another hash with a student name and due date.  

# This should look something like:

# ```ruby
#   { 
#     title: "lord_of_the_rings",
#     rental_details: { 
#      student_name: "Jeff", 
#      date: "01/12/16"
#     }
#   }

# ```


# * Create a method that list all the books and their corresponding details. 
# * Create a method that takes in a book title and returns all of the information about that book.
# * Create a method that takes in a book title and returns only the rental details for that book. 
# * Create a method that takes in a book title and adds it to our book list (Add a new hash for the book with the student name and date being left as empty strings)
# * Create a method that changes the rental details of a book by taking in the title of the book, the student renting it and the date it's due to be returned. 


def test_create_library
  library = Library.new
end

def test_full_book_hash_listing
  library = Library.new
  expected_listing = "[{:title=>\"lord_of_the_rings\", :rental_details=>{:student_name=>\"Jeff\", :date=>\"01/12/16\"}}, {:title=>\"war_and_peace\", :rental_details=>{:student_name=>\"Sheila\", :date=>\"01/11/17\"}}]"
  actual_listing = "#{library.books}"
  # puts expected_listing
  # puts actual_listing
  assert_equal(expected_listing, actual_listing)
end

def test_list_books_and_details
  library = Library.new
  library.get_listing
end

def test_get_full_information_listing_for_book
  library = Library.new
  actual_result = library.get_full_information_listing_for_book("lord_of_the_rings")
  #puts actual_result
  expected_result = {:title=>"lord_of_the_rings", :rental_details=>{:student_name=>"Jeff", :date=>"01/12/16"}}
  assert_equal(expected_result, actual_result)
end

def test_get_rental_details_for_book
  library = Library.new
  actual_result = library.get_rental_details_for_book("lord_of_the_rings")
  expected_result = {:student_name=>"Jeff", :date=>"01/12/16"}
  assert_equal(expected_result, actual_result)
end

def test_add_new_book_title
  library = Library.new
  library.add_new_book_title("das_boot")
  actual_result = library.get_full_information_listing_for_book("das_boot")
  expected_result = {:title=>"das_boot", :rental_details=>{:student_name=>"", :date=>""}}
  assert_equal(expected_result, actual_result)

end



def test_change_rental_details
  library = Library.new
  library.add_new_book_title("das_boot")
  library.change_rental_details("das_boot", "Hermann", "9/9/1999")
  expected_result = {:title=>"das_boot", :rental_details=>{:student_name=>"Hermann", :date=>"9/9/1999"}}
  actual_result =  library.get_full_information_listing_for_book("das_boot")
  #puts actual_result

  assert_equal(expected_result, actual_result)

end








end


