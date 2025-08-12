#!/usr/bin/env fish



ping archlinux.org -c 1

if test $status -eq 0
  update_dotfiles -q
end

kdotool set_desktop 1



exit 0
