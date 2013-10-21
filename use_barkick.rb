require 'barkick'

gtin = GTIN.new("016000275263")
gtin.valid?      # true
gtin.gtin14      # "00016000275263"
gtin.ean13       # "0016000275263"
gtin.upc         # "016000275263"
gtin.prefix      # "001"
gtin.prefix_name # "GS1 US"

gtin = GTIN.new("299265108631")
gtin.variable?   # true
gtin.restricted? # true
gtin.price       # 8.63
gtin.base_gtin14 # "00299265000003"

gtin = GTIN.new("03744806")
gtin.base_gtin14 # "00037000004486"

puts GTIN.check_digit("01600027526") # "3"
