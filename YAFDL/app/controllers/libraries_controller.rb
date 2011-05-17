class LibrariesController < ApplicationController
  
  def index
    @libraries = Library.all
  end
  
  def search
    field = params[:field].downcase
    term = params[:term].blank? ? 'all' : params[:term].downcase
    source = params[:library]
    if source.blank?
      libraries = Library.all
      @results = []
      libraries.each do |library|
        result = library.query(field, term)
        @results << result if result
      end
    else
      library = Library.find(source)
      result = library.query(field, term)
      @results = result ? [result] : [] 
    end
  end
  
end
