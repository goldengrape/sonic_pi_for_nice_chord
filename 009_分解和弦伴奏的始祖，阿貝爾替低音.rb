##| 好和弦的第 9 集
##| 分解和弦伴奏的始祖，阿貝爾替低音！

def alberti_bass(cho)
    assert (cho.length==3 or cho.length==4)
    cho=cho.sort
    if cho.length==4
      cho.delete_at(2)
    end
    return cho[0],cho[2],cho[1],cho[2]
  end
  
  base_chord=chord(:G3, :major7)
  
  loop do
    play_pattern_timed alberti_bass(base_chord),\
      [0.25,0.25,0.25,0.25]
  end
  