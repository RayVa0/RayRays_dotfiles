#!/usr/env/env fish


while true
  ping furaffinity.net -c 1
  if test $status -eq 0
    break
  end
  sleep 0.5
end

