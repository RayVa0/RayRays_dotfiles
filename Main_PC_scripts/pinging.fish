#!/usr/bin/env fish

set timeout 1000

while test $timeout -gt 0
  ping furaffinity.net -c 1 > /dev/null 2>&1
  if test $status -eq 0
    echo -n
    break
  end
  set_color ff0000; echo -n no net..
  set timeout (math "$timeout - 1")
  sleep 0.5
end

if test $timeout -gt 0
  set_color 00f000; echo -n network is up!
else
  set_color ff0000; echo script timeout
  exit 1
end

echo

