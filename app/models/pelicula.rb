class Pelicula < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :genero

	mount_uploader :imagen, PeliculaImagenUploader
end
