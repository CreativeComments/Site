set :production_server, "#{production_hostname}"
set :user, "#{production_account}"
set :app_path, "apps/#{application}"
set :document_root, "#{production_document_root}"

# Uncomment the variables below if the DB-credentials are different from
# the credentials on the staging server
set :db_username, "cc"
set :db_password, ""
set :db_host, "localhost"