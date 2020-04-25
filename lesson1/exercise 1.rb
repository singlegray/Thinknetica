puts 'What is your name?'
name = gets.chomp
puts 'How height are you?'
height = gets.to_i
weight = (height - 110) * 1.15
if weight.negative?
  puts "#{name} Your weight is perfect"
else
  puts "#{name} You ideal weight - #{weight}"
end
