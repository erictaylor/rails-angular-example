class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    render json: Collection.all
  end

  # GET /collections/:id
  # GET /collections/:id.json
  def show
    render json: Collection.find(params[:id])
  end

  # GET /collections/:id/notes
  # GET /collections/:id/notes.json
  def get_notes
    render json: Note.where(:collection_id => params[:id])
  end
end
