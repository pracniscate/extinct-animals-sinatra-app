require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# middleware
use Rack::MethodOverride

# mounting controllers
use UsersController
use ExAnimalsController
run ApplicationController
