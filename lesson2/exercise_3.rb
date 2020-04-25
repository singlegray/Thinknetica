arfib = [0, 1]
while arfib[-1] <= 100
  arfib << arfib[- 1] + arfib[- 2]
end
arfib.pop
puts arfib
