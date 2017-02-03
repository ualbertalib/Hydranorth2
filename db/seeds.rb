# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Silly hyrax stuff.... :(
if !Rails.env.production? && !Hyrax::PermissionTemplate.exists?(admin_set_id: Hyrax::DefaultAdminSetActor::DEFAULT_ID)
  puts 'Seeding Permission Template for Hyrax!'
  Hyrax::PermissionTemplate.create!(admin_set_id: Hyrax::DefaultAdminSetActor::DEFAULT_ID, workflow_name: 'default')
end
