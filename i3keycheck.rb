#!/usr/bin/ruby

i3conf = File.readlines(ENV["HOME"] + "/.i3/config") # open config file as an array of lines

# loop through config via lines
lineNum = 1
keybindings = {}
mode = false

i3conf.each do |directLine|
  line = directLine

  # check if in a mode
  if line[0..3] == "mode"
    mode = true 
  elsif line[0] == "}" && mode == true
    mode = false
  end
  if mode == true
    next
  end

  # remove beginning spaces
  while line[0] == " "
    line[0] = ""
  end
  
  # check if the line assigns a key binding
  if line[0..6] == "bindsym"
    # find the keybinding
    charnum = 8
    keybinding = ""
    while line[charnum] != " "
      keybinding += line[charnum]
      charnum += 1
    end

    # add keybinding to hash
    if keybindings.has_key?(keybinding)
      keybindings[keybinding].push(lineNum)
    else
      keybindings[keybinding] = [lineNum]
    end
  end
  lineNum += 1
end

# check for conflicts
conflicts = 0

keybindings.each do |keybinding, lineNums|
  if lineNums.length > 1
    conflicts += 1
    puts "Conflict #{conflicts} (#{keybinding}):"
    lineNums.each { |lineNum| puts "line number #{lineNum}: #{i3conf[lineNum - 1]}" }
  end
end

if conflicts == 0
  puts "Your keybindings are conflict free! :)"
end
