set :application, 'rest_test_task'
set :repo_url, 'https://github.com/DrShnitzel/gallery_demo_app.git'

set :rbenv_ruby, 'rbx-2.5.2'
set :linked_files, %w(.env) + (fetch(:linked_files) || [])
set :deploy_to, '/var/www/rest_test_task'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :linked_dirs, %w( log
                      tmp/pids
                      tmp/cache
                      tmp/sockets
                      vendor/bundle
                      public/system
                      public/uploads)
