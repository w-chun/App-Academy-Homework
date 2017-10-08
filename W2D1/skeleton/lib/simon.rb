class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length=1,game_over=false,seq=[])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq = seq
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
    end
  end

  def require_sequence
    puts "Repeat the sequence shown at first: "
    input = gets.chomp
    @seq.each do |color|
      if input != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    puts "Round successful. Next round: "
  end

  def game_over_message
    puts "Game over! You lose after #{@sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
