require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 
#rack handles requests and override allows us to transmorm a post to a put/patch/elete - middleware to send through params that will change method
#check perams for a key with _mothod and set through as input 
use NoteController
use UserController
run ApplicationController
