ar = ('a'..'z')
gl = %w(a e i o u)
hash = {}
ar.each.with_index(1) { |let, i| hash[let] = i if gl.include?(let) }
puts hash
