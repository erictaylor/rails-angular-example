Notebook::Application.routes.draw do
  scope :api do
    # Collection
    get "/collections(.:format)" => "collections#index"
    get "/collections/:id(.:format)" => "collections#show"
    get "/collections/:id/notes" => "collections#get_notes"

    # Notes
    get "/notes/:id(.:format)" => "notes#show"
  end
end
