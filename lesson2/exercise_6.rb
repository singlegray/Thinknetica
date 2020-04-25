hash_product = {}

loop do
  puts 'product? or stop'
  products = gets.chomp
  break if products == 'stop'

  puts 'quantity?'
  quantity = gets.to_f
  puts 'price?'
  price = gets.to_f

  hash_product[products] = { quantity: quantity, price: price, total: quantity * price }
end

total = 0
hash_product.each_pair do |key, value|
  puts "Product - #{key}, Quantity - #{value[:quantity]}, Price - #{value[:price]}, Total for product - #{value[:total]}"
  total += value[:total]
end

puts "Total #{total}"
