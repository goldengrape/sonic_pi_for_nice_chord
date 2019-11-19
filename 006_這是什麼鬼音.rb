##| 好和弦的第 6 集
##| 這是什麼鬼音

use_bpm 180

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

live_loop :ghost_drum do
  use_synth :gnoise
  cue :hit
  play_chord chord(:C3, :major)
  sleep 1
  cue :hit
  sleep 1
  cue :hit
  play_chord chord(:G3, :major)
  sleep 1
  cue :hit
  sleep 1
  
  cue :hit
  ns,ts,as=ghost_shadow(chord(:E3, :major), 1, [0.75,0.25],0.25)
  play_ghost ns, ts, as
  cue :hit
  play_chord chord(:E3, :major)
  sleep 1
  cue :hit
  play_chord chord(:G3, :major)
  sleep 1
  cue :hit
  sleep 1
end

live_loop :hihat do
  sync :hit
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 0.75
end