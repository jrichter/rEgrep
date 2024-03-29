#! ruby -w
require 'colorize'


keybinding_files = ARGV
files = ""
keybinding_files.each {|file| files += File.basename(file) + " "}

puts %$Searching "#{files.strip}"$.blue
puts "quit! to exit \n \n"
puts "Enter Search Term".green

Signal.trap('INT') do
  puts "terminating...".red
  Process.exit
end

while term = STDIN.gets
  term = term.chomp
  Process.exit if term == "quit!"

  keybinding_files.each do |file|
    puts %$Searching "#{File.basename(file.to_s)}"$.on_white + "\n \n"
    result =  `egrep -B 1 -A 1 #{term.to_s} #{file.to_s}` + "\n \n"
    if result.strip.empty?
      puts "#{term}".blue.on_white +  " not matched \n \n"
    else
      output = result.gsub(/#{term}/,"#{term}".blue.on_white)
      puts output + "\n"
    end
  end
  puts "quit! to exit \n \n"
  puts "Enter Search Term".green
end
