module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Increments score of winning player.
    #
    # player - either 1 or 2 for the player who scored
    def wins_ball(player)
      @player1.record_won_ball! if player == 1
      @player2.record_won_ball! if player == 2
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3 and @opponent.points < 3
      return 'deuce' if @points == 3 and @opponent.points == 3
      return 'advantage' if @points == 4 and @opponent.points == 3
      return 'win' if @points >= 4 and @opponent.points + 1 < @points
    end
  end
end
