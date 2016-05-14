# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#KPACluster Seeds

KpaCluster.create(kpa_title: 'Leadership and Governance')
KpaCluster.create(kpa_title: 'Poverty')
KpaCluster.create(kpa_title: 'Social Accountability')
KpaCluster.create(kpa_title: 'Politics')
KpaCluster.create(kpa_title: 'Climate Change and Environment')

admin = Staff.create(email: "admin@albeo.com", first_name: "Admin", last_name: "Admin",password: "12341234", password_confirmation: "12341234")
admin.toggle!(:admin)
admin.save
