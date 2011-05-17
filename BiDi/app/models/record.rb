class Record < ActiveRecord::Base
  
  has_and_belongs_to_many :creators
  has_and_belongs_to_many :subjects
  
  def self.query(field, term)
    if field == 'all'     
      query = Record.column_names.inject("") do |q, col|
        q += "#{col} LIKE :term OR "
      end
      query.slice!(-4, 4)
      r = Record.where(query, { :term => '%' + term + '%' }) + Record.query('subject', term) + Record.query('creator', term)
      r.uniq
    elsif Record.column_names.index(field)
      where("#{field} LIKE ?", '%' + term + '%')
    else
      joins(field.pluralize.to_sym).where("#{field.pluralize}.name LIKE ?", '%' + term + '%')
    end
  end
  
end
