##| 好和弦的第 2 集
##| 十分鐘以內，一次搞懂所有的現代和弦代號

##| ref: https://www.rubydoc.info/github/samaaron/sonic-pi/SonicPi/Chord

##| 大和弦家族
define :major_family do |note|
    puts "major_family"
    chord_list=[chord(note, :major),
                chord(note, :major7),
                chord(note, :maj9),
                chord(note, :maj11),
                chord(note, :maj11).push(note+21),
                ]
    chord_list.each do |c|
      play_chord c
      sleep 1
    end
  end
  
  
  ##| 小和弦家族
  define :minor_family do |note|
    puts "minor_family"
    chord_list=[chord(note, :minor),
                chord(note, :minor7),
                chord(note, :m9),
                chord(note, :m11),
                chord(note, :m13),
                ]
    chord_list.each do |c|
      play_chord c
      sleep 1
    end
  end
  
  
  ##| 屬和弦家族
  define :dominant_family do |note|
    puts "dominant_family"
    chord_list=[chord(note, :dom7),
                chord(note, '9'),
                chord(note, '11'),
                chord(note, '13'),
                ]
    chord_list.each do |c|
      play_chord c
      sleep 1
    end
  end
  
  major_family :C4
  minor_family :C4
  dominant_family :C4
  
  ##| add
  define :chord_add do |base_chord, add_num|
    return base_chord.push(base_chord[0]+add_num).sort
  end
  
  play_chord chord_add chord(:C4, :major), 2
  sleep 1
  
  ##| sus
  play_chord chord(:C4, :sus2)
  sleep 1
  play_chord chord(:C4, :sus4)
  sleep 1
  play_chord chord(:C4, '7sus2')
  sleep 1
  play_chord chord(:C4, '7sus4')
  sleep 1
  
  ##| omit
  ##| No idea
  
  ##| 轉位
  ##| NO idea
  
  ##| all chord names in sonic-pi
  puts chord_names
  