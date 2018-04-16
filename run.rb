require './lib/job_sorter'

puts "Enter jobs list in multiple lines. Enter 'end' once you are done."

$/ = 'end'
input = STDIN.gets

puts 'The sorted result is: '+JobSorter.process(input)