server 'drshnitsel.ru',
       roles: %w(app db),
       primary: true,
       ssh_options: {
         user: 'rest_test_task',
         auth_methods: %w(publickey)
       }

set :puma_threads, [0, 16]
set :puma_workers, 2
set :puma_init_active_record, false
set :puma_preload_app, true
