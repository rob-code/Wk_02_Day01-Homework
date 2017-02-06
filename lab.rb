class Student

  attr_reader :name, :cohort
  attr_writer :name, :cohort
  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def talks
    return "I can talk!"
  end

  def say_favourite_language(language_name)
    return reply_string = "I love #{language_name}"
  end

end


class Team

  attr_accessor :team_name, :players, :coach, :points

  def initialize(team_name, players, coach)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = 0
  end

  def add_new_player(new_player)
    @players.push(new_player)
  end

  def is_player_in_team(player_name)
    if @players.include?(player_name)
      return true
    else
      return false
    end
  end

  def game_won_or_lost(result)
    if result == "won"
      @points += 1 
    else
      @points
    end
  end

end


class Library

attr_accessor :books

def initialize
@books = [
     {title: "lord_of_the_rings",
     rental_details: { 
      student_name: "Jeff", 
      date: "01/12/16"}
   },
     {title: "war_and_peace",
     rental_details: { 
      student_name: "Sheila", 
      date: "01/11/17"}
   }
 ]

end

def get_listing
  # puts "*********************************"
  # puts "Full listing of books in library"
  # puts "*********************************"
  # for book in @books
  #   puts "title: #{book[:title]}"
  #   puts "student name : #{book[:rental_details][:student_name]}"
  #   puts "date: #{book[:rental_details][:date]}"
  #   puts ""
  # end
end

def get_full_information_listing_for_book(book_name)
  for book in @books
    if book[:title] == book_name
      return book
    end
  end
end


def get_rental_details_for_book(book_name)
  for book in @books
    if book[:title] == book_name
      #puts book[:rental_details]
      return book[:rental_details]
    end
  end
end


def add_new_book_title(new_title)
@books.push({title: new_title,
     rental_details: { 
      student_name: "", 
      date: ""}
   })
end


def change_rental_details(book_name, student, date)

puts @books

for book in @books
  if book[:title] == book_name
    book[:rental_details][:student_name] = student
    book[:rental_details][:date] = date
  end
end

puts @books

end



end

