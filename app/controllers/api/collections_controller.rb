class Api::CollectionsController < Api::BaseController
  # GET /api/collections
  # GET /api/collections.json
  def index
    render json: Collection.all
  end

  def show
    render json: collection
  end

  def create
    collection = Collection.create!(safe_params)
    render json: collection, status: 201
  end

  def update
    collection.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    collection.destroy
    render nothing: true, status: 204
  end

  private
  def collection
    @collection ||= Collection.find(params[:id])
  end

  def safe_params
    params.require(:collection).permit(:name)
  end
end
