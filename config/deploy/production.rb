server '54.95.243.124', user: 'ec2-user', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/aws/note_list.pem'