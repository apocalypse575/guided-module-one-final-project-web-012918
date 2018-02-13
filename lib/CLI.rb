class CommandLineInterface

  def greet
    puts "Welcome to BeerApp, the command line solution for your beer finding needs!"
  end

  def gets_user_input
    puts "Which brewery is your favorite?"
    puts "Enter it here to get started!"
    gets.chomp
  end

  def run
    greet
    input = gets_user_input
    find_beer(input)
  end

end
