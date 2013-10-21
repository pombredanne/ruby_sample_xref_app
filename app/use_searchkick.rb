require 'active_record'
require 'searchkick'

class Product < ActiveRecord::Base
  searchkick
end


Product.reindex


products = Product.search "2% Milk"
products.each do |product|
  puts product.name
end


Product.search "2% Milk", where: {in_stock: true}, limit: 10, offset: 50
Product.search "milk", page: params[:page], per_page: 20
Product.search "fresh honey" # fresh AND honey
Product.search "fresh honey", partial: true # fresh OR honey

class Product2 < ActiveRecord::Base
  searchkick synonyms: [["scallion", "green onion"], ["qtip", "cotton swab"]]
end

Product.search "zuchini", misspellings: false


Product.search "2% Milk", facets: {store_id: {where: {in_stock: true}, limit: 10}}


product = Product.first
product.similar(fields: ["name"])


Product.clean_indices
