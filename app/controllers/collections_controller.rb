class CollectionsController < ApplicationController

  def index
    @collection_items = Collection.all 
  end

  def angular
    @angular_collection_items = Collection.angular
  end

  def new
    @collection_item = Collection.new
    3.times { @collection_item.technologies.build }
  end

  def create
    @collection_item = Collection.new(collection_params)

    respond_to do |format|
      if @collection_item.save
        format.html { redirect_to collections_path, notice: 'Collection Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @collection_item = Collection.find(params[:id])
  end

  def update
    @collection_item = Collection.find(params[:id])

    respond_to do |format|
      if @collection_item.update(collection_params)
        format.html { redirect_to collections_path, notice: 'Collection Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @collection_item = Collection.find(params[:id])
  end

  def destroy
    @collection_item = Collection.find(params[:id])

    @collection_item.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Item was successfully removed.' }
    end
  end

  private

    def collection_params
      params.require(:collection).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        technologies_attributes: [:name]
                                        )
    end



end
