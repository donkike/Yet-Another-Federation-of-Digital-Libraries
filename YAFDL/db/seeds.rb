# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

bidis = Crack::XML.parse(File.open('config/yafdl.xml', 'rb').read)['yafdl']['bidi']

for bidi in bidis
  Library.create(bidi)
end


