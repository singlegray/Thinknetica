puts 'a?'
a = gets.to_f
puts 'b?'
b = gets.to_f
puts 'c?'
c = gets.to_f
d = b**2 - 4 * a * c
if d.negative?
  puts 'No values'
elsif d.zero?
  puts "x = #{-b / (2 * a)}"
elsif d.positive?
  koren = Math.sqrt(d)
  puts "x1 = #{(-b + koren) / (2 * a)} x2 = #{(-b - koren) / (2 * a)}"
end
