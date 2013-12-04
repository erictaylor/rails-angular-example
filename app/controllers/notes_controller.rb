class NotesController < ApplicationController
  def safe_params
    params.require(:note).permit(:title, :content)
  end

  # GET /api/collections/:collection_id/notes
  # GET /api/collections/:collection_id/notes.json
  def index
    render json: Note.where(:collection_id => params[:collection_id])
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
end
