class Game
  attr_accessor :player1, :player2, :currentPlayer

  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
  end


  def start_game
    while @player1.player_alive && player2.player_alive

      puts " NEW ROUND "
      ask_question
    end

    puts " GAME OVER "
    puts (@player1.wins > player2.wins ? "#{@player1} wins with a score of #{@player1.wins} and #{@player1.numOfLives} lives remaining" : "#{@player2} wins with a score of #{@player2.wins} and #{@player2.numOfLives} lives remaining")
    puts "Good bye!"

  end
  

  def ask_question

    question = Question.new
    answer = question.answer
    game_prompt = "#{@current_player.name}, #{question.output}"
    

    puts game_prompt
    

    player_answer = gets.chomp.to_i
    

    if check_answer(player_answer, answer) # if true
      puts "YES! You are correct."

      @current_player.increase_wins
      
      puts "SCOREBOARD"
      puts "Player 1: #{@player1.wins} points vs Player 2: #{@player2.wins} points"

      switch_players

    else 
      puts "Seriously? No."
      
      @current_player.lose_life

      puts "LIVES"
      puts "Player 1: #{@player1.numOfLives}/3 vs Player 2: #{@player2.numOfLives}/3"

      switch_players
    end
  end
    

  def check_answer(player_answer, answer)
    player_answer == answer ? true : false
  end
  
  def switch_players
    @current_player == @player1 ? (@current_player = @player2) : (@current_player = @player1)

    puts "NEW PLAYER: #{@current_player.name}"
  end

end
