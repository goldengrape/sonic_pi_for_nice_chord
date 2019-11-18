##| 好和弦的第 4 集
##| 和弦有什麼功能

##| define scale
s=scale(:C3, :major, num_octaves: 2)

##| define kinds of chords
tonic_chord=(ring s[0],s[2],s[4])
sub_dominant_chord=(ring s[3],s[5],s[7])
dominant_chord=(ring s[4],s[6],s[8])
dominant_unstable_chord=(ring s[4],s[6],s[8],s[10])


chord_list=[tonic_chord,\
            sub_dominant_chord,\
            dominant_chord,\
            dominant_unstable_chord]

##| ##| demo chords
##| chord_list.each do |c|
##|   play_chord c
##|   sleep 1
##| end


##| transition_matrix:
##| from home->home [0,0] chance=0.1,
##| from home->bridge [0,1] chance=0.5
##| from outside->home [2,0] chance=0.5
##| from outside->bridge [2,1] chance=0

transition_matrix=\
  [[0.1, 0.5, 0.3, 0.1],
   [0.2, 0, 0.5,0.3],
   [0.5, 0, 0.3,0.2],
   [0.5, 0, 0.3,0.2]]
  
# random choose by chance
def picker(options, chances)
  current, max = 0, chances.inject(:+)
  random_value = rrand(0,max)
  (0..options.length).each do |i|
    current += chances[i]
    return options[i] if random_value <=current
  end
end

current_id=0
live_loop :chord_trans do
  ##| choose next chord based on transition_matrix
  next_id=picker([0,1,2,3],transition_matrix[current_id])
  play_chord chord_list[next_id]
  play_pattern_timed chord_list[next_id].take(3),\
    [0.25,0.25,0.5]
  sleep 1
  current_id=next_id
end

live_loop :melody do
  play_pattern_timed scale(:C4,:major).shuffle.take(4), 0.5
end


