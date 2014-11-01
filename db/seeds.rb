[
  { title: 'Polpettina Vinyl Toy', price: 12 },
  { title: 'Bruttino Vinyl Toy', price: 12 },
  { title: 'Happy Om Nom Plush', price: 8.50 },
  { title: 'GitHub Octocat', price: 40 },
  { title: 'Skeletrino Kitty', price: 25 },
  { title: 'Latte Moofia', price: 20 }
].each do |item|
  Item.create(item) unless Item.where(title: item[:title]).exists?
end