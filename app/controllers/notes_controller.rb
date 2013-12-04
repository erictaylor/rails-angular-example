class NotesController < ApplicationController
  # GET /notes/:id
  # GET /notes/:id.json
  def show
    render json: Note.find(params[:id])
  end
end
