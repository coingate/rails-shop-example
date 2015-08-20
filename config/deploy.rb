# config valid only for Capistrano 3.1
lock '3.2.1'

set :application,   'rails_shop_example'
set :repo_url,      'git@github.com:coingate/rails-shop-example.git'
set :keep_releases, 5
set :linked_files,  %w( .env )
set :linked_dirs,   %w( log tmp/pids tmp/sockets )

# after 'deploy', 'unicorn:restart'