# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

records = Crack::XML.parse(File.open('config/mdata1.xml').read)['metadata']['record']

for record in records
  puts record
  record_db = Record.new
  if record['creator'].respond_to? 'each' 
    for creator in record['creator']
      record_db.creators << Creator.find_or_create_by_name(creator)
    end
  else
    record_db.creators << Creator.find_or_create_by_name(record['creator'])
  end
  record.delete('creator')
  if record['subject'].respond_to? 'each' 
    for subject in record['subject']
      record_db.subjects << Subject.find_or_create_by_name(subject)
    end
  else
    record_db.subjects << Subject.find_or_create_by_name(record['subject'])
  end
  record.delete('subject')
  record_db.update_attributes(record)
end
