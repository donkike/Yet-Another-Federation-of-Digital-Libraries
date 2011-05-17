class RecordsController < ApplicationController
  
  def query
    field = params[:field]
    term = params[:term]
    @records = Record.query(field, term)
    render 'mdata.xml'
  end
  
end
