rails_root = File.expand_path('../../', __FILE__)
$listen = File.expand_path('tmp/sockets/unicorn.sock', rails_root)
listen $listen, :backlog => 2048
timeout 65

working_directory rails_root

stderr_path File.expand_path('log/unicorn.log', rails_root)
stdout_path File.expand_path('log/unicorn.log', rails_root)
