class Service
  include HTTParty
end

class Library < ActiveRecord::Base
  
  def query(field, term)
    result = Service.get(url + 'records/query', :query => { :field => field, :term => term }).parsed_response
    return nil unless result['metadata']
    unless result['metadata']['record'].class == Array
      result['metadata']['record'] = [result['metadata']['record']]
    end
    result.merge!({ 'repository' => name })
  end
  
end
