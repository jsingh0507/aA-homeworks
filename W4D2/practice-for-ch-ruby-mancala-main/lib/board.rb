class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1=name1
    @name2=name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      if idx != 6 && idx != 13 # Skip player's stores
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, cups.length)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
  
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
  
      # Place stones in the correct cups, skipping opponent's store
      if cup_idx == 6
        cups[6] << stones.pop if current_player_name == name1
      elsif cup_idx == 13
        cups[13] << stones.pop if current_player_name == name2
      else
        cups[cup_idx] << stones.pop
      end
    end
  
    render
    next_turn(cup_idx)
  
    if cup_idx == 6 && current_player_name == name1
      return :prompt
    elsif cup_idx == 13 && current_player_name == name2
      return :prompt
    elsif cups[cup_idx].count == 1 && cup_idx != 6 && cup_idx != 13
      return :switch
    end
  
    cup_idx
  end
  

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{cups[13].count} ------------------------ #{cups[6].count}"
    print "      #{cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if cups[0..5].all?{|v| v.empty?} || cups[7..12].all?{|v| v.empty?}
      return true 
    else
      return false
    end
  end

  def winner
    player1, player2 = cups[6].count, cups[13].count
    if player1 == player2
      :draw
    else
      if player1 > player2
        name1
      else
        name2
      end
    end
  end
end