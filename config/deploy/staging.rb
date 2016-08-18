# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

 server '192.168.10.10', user: 'vagrant', roles: %w{app db web}
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}

# path to deploy the project
set :deploy_to, '/home/vagrant/www/app/staging'

# set some variables that is used in deploy tasks written in deploy.rb
# don't keep the sensetive credentials here; like database name, username and password
# you can use overlay for setting sensetive information.
set :app_path, '/home/vagrant/www/app/staging/current'
set :app_debug, false
