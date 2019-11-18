##| 好和弦的第 5 集
##| 和弦還有什麼功能？（續集）

##| define scale
s=scale(:C3, :major, num_octaves: 2)

C=(ring s[0],s[2],s[4])
Dm=(ring s[1],s[3],s[5])
Em=(ring s[2],s[4],s[6])
F=(ring s[3],s[5],s[7])
G=(ring s[4],s[6],s[8])
G7=(ring s[4],s[6],s[8],s[10])
Am=(ring s[5],s[7],s[9])
Bdim=(ring s[6],s[8],s[10])


##| define kinds of chords
tonic_chord_list=[
[C],[C,Em],[C,Am],[C,Em,Am],[C,Am,Em]]

sub_dominant_chord_list=[
[F],[Dm],[F,Dm],[Dm,F]]

dominant_chord_list=[
[G],[G7],[Bdim]]

all_chords=[tonic_chord_list,\
            sub_dominant_chord_list,\
            dominant_chord_list,\
            [[C]]]

all_chords.each do |chord_list|
  use_random_seed 999
  choose(chord_list).each do |c|
    cue :chord_play
    play_chord c
    sleep 1
  end
end




