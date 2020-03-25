##| 好和弦的第 15 集
##| 更多終止的方式！（續集）

use_synth :pretty_bell

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

##| define Cadence
##| 正终止
authentic_cadence=[[G7, C]]
##| 半终止
half_cadence=[[G7], [G] ]
##| 假终止
deceptive_cadence=[[G7, Am], [G7, Dm], [G7, Em], [G7,F], [G7, Bdim]]
##| 变格终止/ 教会终止
plagal_cadence=[[F,C]]


##| play chords

all_chords=[tonic_chord_list,\
            sub_dominant_chord_list,\
            dominant_chord_list,\
            deceptive_cadence,\
            sub_dominant_chord_list,\
            authentic_cadence, plagal_cadence]

all_chords.each do |chord_list|
  use_random_seed 999
  choose(chord_list).each do |c|
    cue :chord_play
    play_chord c
    sleep 1
  end
end

