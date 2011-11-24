#! /home/justin/.rvm/rubies/ruby-1.9.3-preview1/bin/ruby -w

keybinding_file = "~/.emacs.d/modules/prelude-global-keybindings.el"

while true

  puts %$ Searching "#{File.basename(keybinding_file)}" - quit! to exit $
  term = gets
  term = term.chomp
  break if term == "quit!"

  puts `egrep -B 2 -A 2 #{term.chomp.to_s} #{keybinding_file}` + "\r"

end
