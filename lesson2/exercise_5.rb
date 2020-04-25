puts 'Date?'
date = gets.to_i
puts 'Month?'
month = gets.to_i
puts 'Year?'
year = gets.to_i

month_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
month_days[:february] = 28 if (year % 4 != 0 || year % 100 == 0) && (year % 400 != 0)

puts month_days.take(month).sum - (month_days[month-1] - date)
