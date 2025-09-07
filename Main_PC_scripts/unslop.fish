#!/usr/bin/env fish

echo q to exit 
sleep 2

for image in (ls | shuf)
  chafa -l $image 
  read -l -P "Delete[y/N]" ans

  switch $ans 
    case Y y
      set_color red; echo deleting $image
      set_color normal
      rm -v $image
      command clear
    case q Q
      echo exiting
      exit 2
    case ''
      echo not deleting $image
      command clear
    case '*'
      echo dont do that
  end
end

echo Parsed the whole directory, exiting 
