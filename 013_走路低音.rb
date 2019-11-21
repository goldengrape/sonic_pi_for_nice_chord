##| ##| 好和弦的第 13 集
##| ##| 走路低音！（Walking Bass）

use_synth :piano
chord_C=chord(:C2, :major).push(:C3)
chord_F=chord_C-:C2+:F2
chord_G=chord_C-:C2+:G2
last_tone=:C3
chord_list=[chord_C,chord_F,chord_G].ring

use_bpm 120
##| 分解和弦
define :decompos do |chord|
  return chord.to_a.ring
end

chord_list.each do |chord|
  play_pattern_timed decompos(chord), 1
end
play last_tone, sustain: 4
sleep 4

##| 更换顺序
define :shuffle_order do |chord|
  return (chord.take(1)+chord.drop(1).shuffle).ring
end

chord_list.each do |chord|
  play_pattern_timed shuffle_order(chord), 1
end
play last_tone, sustain: 4
sleep 4

##| 经过音
define :passing do |chord|
  a=chord[0]+2
  return [chord[0],a,chord[1], chord[0]].ring
end

chord_list.each do |chord|
  play_pattern_timed passing(chord), 1
end
play last_tone, sustain: 4
sleep 4

##| 高低半音
define :high_or_low do |this_chord, next_chord|
  h_or_l=(dice(2)-1.5)*2
  last_note=next_chord[0]+h_or_l
  return this_chord.take(3).push(last_note)
end

chord_list.length.times do
  idx=tick
  play_pattern_timed high_or_low(chord_list[idx],
                                 chord_list[idx+1]),1
end
play last_tone, sustain: 4
sleep 4

##| 八分音符和三連音裝飾

define :decoration do |chord|
  if one_in(2)
    ns=[chord[0]].concat(chord.take(3).shuffle).push(chord[-1]).ring
    ts=[1,1,1,[0.5,0.5]].shuffle.flatten
  else
    ns=[chord[0]].concat(chord.take(3).reflect.shuffle).push(chord[-1]).ring
    ts=[1,1,1,[1.0/3,1.0/3,1.0/3]].shuffle.flatten
  end
  return ns,ts
  
end

chord_list.each do |chord|
  ns,ts= decoration(passing(chord))
  puts ns
  puts ts
  play_pattern_timed ns,ts
end
play last_tone, sustain: 4
sleep 4
