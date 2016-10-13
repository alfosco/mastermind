puts "Welcome to MASTERMIND"
#give option to play the game, read the instructions, or quit the game

play_game = false
while play_game == false
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
user_input = gets.chomp.upcase

  if user_input == "P" || user_input == "PLAY"
    puts "I have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Enter (q)uit at any time to end the game."
    play_game = true
    #starts the game

  elsif user_input == "I" || user_input == "INSTRUCTIONS"
    puts "The game will generate an unknown four character sequence."
    puts "The sequence will consist of a random order of (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Submit your answer(s) until you guess the right sequence."
    puts "You will receive feedback on how many correct elements you have guessed and how many are in the correct position."
    #prints the instructions

  elsif user_input == "Q" || user_input == "QUIT"
    abort("Goodbye.")
    #ends program

  else
    puts "Invalid selection. Please choose either (p)lay, read the (i)nstructions, or (q)uit."

  end
end

#Start of gameplay
correct_answer = false
sequence = ["R", "G", "Y", "B"]
random_sequence = sequence.sample(4).join
#determines the random sequence
final_guess_count = []
#I utilize .length on this array to determine the number of guesses taken
puts "What's your guess?"

start_time = Time.now
#starts timer

until correct_answer == true

user_guess = gets.chomp.upcase
correct_answer = random_sequence

  if user_guess == correct_answer
    correct_answer = true
    #breaks the loop
    
    finish_time = Time.now
    diff = finish_time - start_time
    secs = diff
    mins = secs / 60
    #calculation used to determine the time it took to guess the correct sequence

      if mins >= 1
        puts "Congratulations! You correctly guessed the sequence #{user_guess} in #{(final_guess_count.length) + 1} guess(es) over #{mins.round} minute(s) and #{(secs % 60).round} second(s)!."
      elsif secs >= 0
        puts "Congratulations! You correctly guessed the sequence #{user_guess} in #{(final_guess_count.length) + 1} guess(es) over #{secs.round} second(s)!."
      end
      #user wins game

    play_another_game = false
      while play_another_game == false
        puts "Would you like to (p)lay again or (q)uit?"
        user_selection = gets.chomp.upcase

        if user_selection == "P" || user_selection == "PLAY"
          load 'mastermind.rb'
          #restarts game
        
        elsif user_selection == "Q" || user_selection == "QUIT"
          abort("Goodbye.")
          #ends program

        else
          puts "Invalid selection. Please choose either (p)lay again or (q)uit."
        end
      end

  elsif user_guess.length < 4 && user_guess != "Q" && user_guess != "C"
    puts "Your guess #{user_guess} is too short."
    puts "Guess again."
    #guess is too short

  elsif user_guess.length > 4 && user_guess != "CHEAT"
    puts "Your guess #{user_guess} is too long."
    puts "Guess again."
    #guess is too long

  elsif user_guess == "C" || user_guess == "CHEAT"
    puts "The sequence is #{random_sequence} you cheater."
    #prints the random/cheat sequence

  elsif user_guess == "Q" || user_guess == "QUIT"
    abort("Goodbye.")
    #ends program

  else
    final_guess_count << user_guess
    #counts number of incorrect guesses


    #determines the number of correct positions


    #determines the number of correct elements

    puts "Your guess of #{user_guess} has #{} of the correct elements with #{} in the correct position."
    puts "You have taken #{final_guess_count.length} guess(es)."
    puts "Guess again."
    #guess is incorrect
    
  end
end
