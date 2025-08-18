#!/usr/bin/env fish


while true
  ping furaffinity.net -c 1 > /dev/null 2>&1
  if test $status -eq 0
    echo
    break
  end
  echo -n no net..
  sleep 0.5
end

echo Network available

