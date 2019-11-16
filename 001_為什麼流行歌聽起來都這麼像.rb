##| 好和弦的第 1 集
##| 為什麼流行歌聽起來都這麼像？
##| http://wiki.nicechord.com/index.php/%E7%82%BA%E4%BB%80%E9%BA%BC%E6%B5%81%E8%A1%8C%E6%AD%8C%E8%81%BD%E8%B5%B7%E4%BE%86%E9%83%BD%E9%80%99%E9%BA%BC%E5%83%8F%EF%BC%9F

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

chord_list.each do |c|
  puts c
  use_synth :piano
  play_chord c,amp: 1.5, sustain: 1
  sleep 1
end
