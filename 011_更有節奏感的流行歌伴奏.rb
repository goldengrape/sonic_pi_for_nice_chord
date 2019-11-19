##| 好和弦的第 11 集
##| 更有節奏感的流行歌伴奏

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

##| ghost_shadow
##| make ghost notes
define :ghost_shadow do |base_chord, full_t, split_ratio, amp|
  split_ratio=split_ratio.ring
  notes=[]
  times=[]
  amps=[]
  note=base_chord
  t=full_t*split_ratio.tick
  notes.push(note)
  times.push(t)
  amps.push(1)
  
  (0..split_ratio.length-2).each do |g|
    note=base_chord.sort[g]
    t=full_t*split_ratio.tick
    notes.push(note)
    times.push(t)
    amps.push(amp)
  end
  return notes, times, amps
end

define :play_ghost do |notes, times, amps|
  notes.zip(times,amps).each do |n, t, a|
    play n, amp: a
    sleep t
  end
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
            G,G7,
            )
ghost_amp=0.3

live_loop :continuum do
  chord_list.each do |base_chord|
    l, r= one_three(base_chord)
    ##| left hand
    play l, sustain: 4
    
    ##| right hand
    ##| 1
    play_chord r
    sleep 1
    ##| 2
    if one_in(2)
      ns,ts,as=ghost_shadow(r, 1, [0.75,0.25],ghost_amp)
      play_ghost ns,ts,as
    else
      play_chord r
      sleep 1
    end
    ##| 3
    if one_in(4)
      ns,ts,as=ghost_shadow(r, 1, [0.75,0.25],ghost_amp)
      play_ghost ns,ts,as
    else
      play_chord r
      sleep 1
    end
    ##| 4
    ns,ts,as=ghost_shadow(r, 1, [0.6,0.2,0.2],0.2)
    play_ghost ns,ts,as
  end
end


