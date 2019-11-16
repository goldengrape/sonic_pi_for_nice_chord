##| 好和弦的第 3 集
##| 和弦只要加「2」就會比較厲害

##| add2
define :chord_add do |base_chord, add_num|
    # 如果是用符号, 比如(:C,:D,:E), 那么加入数字以后, 再排序会报错
    # 所以自定义和弦, 特别是XonY的那种, 还是用数字表示比较好
    return base_chord.push(base_chord[0]+add_num).sort
  end
  
  chord_G_on_B=(ring note(:B3), note(:D4), note(:G4))
  chord_Em_on_G=(ring note(:G3), note(:B3), note(:E4))
  chord_C_on_E=(ring note(:E3), note(:G3), note(:C4))
  
  chord_list=[chord(:C4, :major), \
              chord_G_on_B,
              chord(:A3, :minor),\
              chord_Em_on_G,\
              chord(:F3, :major),\
              chord_C_on_E,\
              chord(:D3, :minor),\
              chord(:G3, :major)
              ]
  
  ##| 用第1课的流行音乐常用和弦, 加2, 然后琶音
  live_loop :add_2_chord do
    chord_list.each do |ch|
      c=chord_add ch, 2
      use_synth :piano
      play_pattern_timed c, [0.25, 0.25, 0.25,0.5]
    end
  end
  
  