[
  { title: 'Brewed Coffee', price: 1 },
  { title: 'Cafe Mocha', price: 3 },
  { title: 'Caramel Macchiato', price: 3 },
  { title: 'Caramel Mocha', price: 4 },
  { title: 'Espresso Con Panna', price: 5 },
  { title: 'Espresso', price: 2 }
].each do |item|
  Item.create(item) unless Item.where(title: item[:title]).exists?
end