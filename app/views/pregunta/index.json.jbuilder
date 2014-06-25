json.array!(@pregunta) do |preguntum|
  json.extract! preguntum, :id, :contenido
  json.url preguntum_url(preguntum, format: :json)
end
