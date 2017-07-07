FactoryGirl.define do
  factory(:product) do
    name('Doritos')
    description('Doritos are baked tortilla chips infused with the finest herbs and spices, availible to consumers everywhere!')
    price(1.95)
    category('Chips')
  end

  factory(:review) do
    author('Sam')
    content('The flavor of these Dorito chips is exquisite, I can taste the authentic Mexican flavor!')
    rating(10)
    product_id(1)
  end
end
