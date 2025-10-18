
set h (date "+%H")
if test $h -le 5; or test $h -ge 22
  echo n
else 
  echo d
end
