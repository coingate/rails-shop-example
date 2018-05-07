# config valid only for Capistrano 3.1
lock '3.10.2'

set :application,   'rails_shop_example'
set :repo_url,      'https://github.com/coingate/rails-shop-example'
set :keep_releases, 5
set :linked_files,  %w( .env )
set :linked_dirs,   %w( log tmp/pids tmp/sockets )

# after 'deploy', 'unicorn:restart'