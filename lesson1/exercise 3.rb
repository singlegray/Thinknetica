puts 'Lenght side 1'
side1 = gets.to_f
puts 'Lenght side 2'
side2 = gets.to_f
puts 'Lenght side 3'
side3 = gets.to_f

arside = [side1, side2, side3].sort

if arside[2]**2 == arside[0]**2 + arside[1]**2
  puts 'Rectangular'
elsif arside.uniq.size == 1
  puts 'Equilateral'
elsif arside.uniq.size == 2
  puts 'Isosceles'
end
