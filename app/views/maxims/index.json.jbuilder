json.array!(@maxims) do |maxim|
  json.extract! maxim, :id, :word, :author, :img_path
  json.url maxim_url(maxim, format: :json)
end
