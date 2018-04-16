class CollectionsController < ApplicationController

  def index
    @collection_items = Collection.all 
  end

end
