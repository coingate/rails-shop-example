Rails.application.routes.draw do
  get     'cart'            => 'cart#index',        as: :cart
  post    'cart/add/:id'    => 'cart#add_item',     as: :cart_add_item
  post    'cart/checkout'   => 'cart#checkout',     as: :checkout
  delete  'cart/empty'      => 'cart#empty',        as: :cart_empty
  delete  'cart/remove/:id' => 'cart#remove_item',  as: :cart_remove_item

  post  'payments/notify'
  get   'payments/success'
  get   'payments/check'

  get 'pages/how-to-buy' => 'pages#how_to_buy', as: :how_to_buy

  post 'currencies/set_currency/:currency' => 'currencies#set_currency', as: :set_currency

  resources :orders, only: [:index, :show]

  root 'items#index'
end
