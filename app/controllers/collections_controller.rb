class CollectionsController < ApplicationController
  def safe_params
    params.require(:collection).permit(:name)
  end

  # GET /api/collections
  # GET /api/collections.json
  def index
    render json: Collection.all
  end
end
