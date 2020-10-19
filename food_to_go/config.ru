require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


#placing the controllers here is called mounting

use OrderController
use UserController
run ApplicationController
