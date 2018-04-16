class CollectionsController < ApplicationController

  def index
    @collection_items = Collection.all 
  end

  def new
    @collection_item = Collection.new
  end

  def create
    @collection_item = Collection.new(params.require(:collection).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @collection_item.save
        format.html { redirect_to collections_path, notice: 'Collection Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

end
