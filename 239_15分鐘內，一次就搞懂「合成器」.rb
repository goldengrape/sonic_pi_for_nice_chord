##| 好和弦的第 239 集
##| 15 分鐘內，一次就搞懂「合成器」！（Synthesizer）
##| http://wiki.nicechord.com/index.php/15_%E5%88%86%E9%90%98%E5%85%A7%EF%BC%8C%E4%B8%80%E6%AC%A1%E5%B0%B1%E6%90%9E%E6%87%82%E3%80%8C%E5%90%88%E6%88%90%E5%99%A8%E3%80%8D%EF%BC%81%EF%BC%88Synthesizer%EF%BC%89

notes=[:C4, :E4, :G4]
t=[0.25,0.25,0.25]
space_time=2


define :basic_synth do |wave_type|
  puts wave_type
  use_synth wave_type
  play_pattern_timed notes, t
  sleep space_time
end

##| sine wave synth
basic_synth :sine

##| triangle
basic_synth :tri

##| square
basic_synth :square

##| sawtooth
basic_synth :saw

##| Low pass filter
lpf_cutoff=[80,100,120]
lpf_cutoff.each do |c|
  puts "Low pass filter"
  puts c
  with_fx :lpf, cutoff: c do
    basic_synth :saw
  end
end

##| high pass filter
hpf_cutoff=[30,50,80]
hpf_cutoff.each do |c|
  puts "High pass filter"
  puts c
  with_fx :hpf, cutoff: c do
    basic_synth :saw
  end
end

##| filter resonance
resonance=[0.3,0.6,0.9]
resonance.each do |r|
  puts "filter resonance"
  puts r
  with_fx :rlpf, cutoff: 100, res:r do
    basic_synth :saw
  end
end

##| ADSR
define :adsr do |wave_type,adsr_time, adsr_level|
  puts "ADSR"
  puts wave_type
  use_synth wave_type
  play_pattern_timed notes, t,\
    attack: adsr_time[0],\
    decay: adsr_time[1],\
    sustain: adsr_time[2],\
    release: adsr_time[3],\
    attack_level: adsr_level[0],\
    decay_level: adsr_level[1],\
    sustain_level: adsr_level[2]
end

adsr :saw, [0.2,0.2,0.3,0.3], [1,0.8,0.2]