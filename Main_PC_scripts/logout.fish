#!/usr/bin/env fish


kdotool set_desktop 1

ping archlinux.org -c 1

if test $status -eq 0
  update_dotfiles -q
end

exit 0
