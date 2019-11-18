##| 好和弦的第 10 集
##| 超級簡單的流行抒情歌伴奏

use_random_seed 11

##| map a note to same name around "near"
def map_to(note, near)
  return near+(-(near-note)) % 12
end

##| divide a chord into
##| one low key around :C2 for left hand
##| and a chord around :A3 for right hand

def one_three(base_chord)
  left_key=map_to(base_chord.sort[0], :C2)
  right_chord=[]
  base_chord.reverse.each do |note|
    note=map_to(note, :A3)
    right_chord.push(note)
  end
  return left_key, right_chord.sort.ring
end


s=scale(:C4, :major, num_octaves: 2)
C=(ring s[0],s[2],s[4])
Dm=(ring s[1],s[3],s[5])
Em=(ring s[2],s[4],s[6])
F=(ring s[3],s[5],s[7])
G=(ring s[4],s[6],s[8])
G7=(ring s[4],s[6],s[8],s[10])
Am=(ring s[5],s[7],s[9])
Bdim=(ring s[6],s[8],s[10])

##| let's try chord_list in lecture 005
##| 和弦還有什麼功能？（續集）
chord_list=(ring C,Am,Em,
            Dm,F,
            G7,
            C)


chord_list.each do |base_chord|
  l, r= one_three(base_chord)
  play l, sustain: 4
  4.times do
    play_chord r
    sleep 1
  end
end




