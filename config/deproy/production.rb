# server "db.example.com", user: "deploy", roles: %w{db}
server "13.112.212.128", user: "ec2-user", roles: %w{app db web}

set :rails_env, "production"
set :unicorn_rack_env, "production"

# role-based syntax
# ==================