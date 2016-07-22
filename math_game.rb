@turn_count = 0
@MAX_VALUE = 20
@p1_lives = 3
@p2_lives = 3
@p1_score = 0
@p2_score = 0

def get_rand_int(max)
  1 + rand(max)
end

def someone_lost?
  if @p1_lives == 0
  	puts "Player 2 wins with #{@p2_score} points!"
  	return true
  elsif @p2_lives == 0
  	puts "Player 1 wins with #{@p1_score} points!"
  	return true
  end
  return false
end

def main
  while true
    val_1 = get_rand_int(@MAX_VALUE)
    val_2 = get_rand_int(@MAX_VALUE)
    print "Player #{@turn_count % 2 + 1}, what is #{val_1} + #{val_2}? "
    input = gets.chomp
    
    if input.to_i == val_1 + val_2
      puts "Correct! :)"
      @turn_count % 2 + 1 == 1 ? @p1_score += 1 : @p2_score += 1
    else
      puts "Wrong! :O"
      puts "Scores: P1 - #{@p1_score}  P2 - #{@p2_score}"
      puts " Lives: P1 - #{@p1_lives}  P2 - #{@p2_lives}\n\n"

      @turn_count % 2 + 1 == 1 ? @p1_lives -= 1 : @p2_lives -= 1
    end
    break if someone_lost?
    @turn_count += 1
  end
end

main



