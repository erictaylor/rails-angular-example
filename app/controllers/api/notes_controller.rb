class Api::NotesController < Api::BaseController
  # GET /api/collections/:collection_id/notes
  # GET /api/collections/:collection_id/notes.json
  def index
    render json: collection.notes
  end

  # GET /api/collections/:collection_id/notes/:id
  def show
    render json: note
  end

  # POST /api/collections/:collection_id/notes
  def create
    note = collection.notes.create!(safe_params)
    render json: note, status: 201
  end

  # PATCH /api/collections/:collection_id/notes/:id
  # PUT   /api/collections/:collection_id/notes/:id
  def update
    note.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  # DELETE /api/collections/:collection_id/notes/:id
  def destroy
    note.destroy
    render nothing: true, status: 204
  end

  private
  def collection
    @colleciton ||= Collection.find(params[:collection_id])
  end

  def note
    @note ||= collection.notes.find(params[:id])
  end

  def safe_params
    params.require(:note).permit(:title, :content)
  end
end
