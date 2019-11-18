##| 好和弦的第 7 集
##| 什麼是「12 小節藍調」

tonic=:C3
C7=(ring :C3, :E3, :Bb3, :D4)-:C3+tonic
F7=(ring :F3, :Eb3, :A3, :D4)-:C3+tonic
G7=(ring :G3, :F3, :B3, :E4)-:C3+tonic

blues=[C7,C7,C7,C7,
       F7,F7,C7,C7,
       G7,F7,C7,C7]

live_loop :blue_chord do
  blues.each do |b|
    cue :play_chord
    [0,1,3,1].each do |i|
      play b[i], amp: 2, release: 2/3.0
      sleep 2/3.0
      play b[2], amp: 0.5,release: 1/3.0
      sleep 1/3.0
    end
  end
end

live_loop :blue_chord2 do
  blues.each do |b|
    sync :play_chord
    sleep 2
    play b, amp: 2, release: 2/3.0
    sleep 2/3.0
    play b, amp: 0.5,release: 1/3.0
    sleep 1/3.0
  end
end