list = {'yvr' => 'Vancouver', 'yba' => 'Banff', 'yyz' => 'Toronto', 'yxx' => 'Abbotsford', 'ybw' => 'Calgary'}

# Why is it returning nil instead of first element of the list above
print "First key: "
p list.to_a[0][0]
print "First value: "
p list.to_a[0][1]
