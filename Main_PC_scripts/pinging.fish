#!/usr/bin/env fish


while true
  ping furaffinity.net -c 1 > /dev/null
  if test $status -eq 0
    break
  end
  sleep 0.5
end

echo Network available

