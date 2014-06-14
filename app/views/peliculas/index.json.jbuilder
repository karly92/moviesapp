json.array!(@peliculas) do |pelicula|
  json.extract! pelicula, :id, :titulo, :anio, :genero, :actores, :imagen
  json.url pelicula_url(pelicula, format: :json)
end
