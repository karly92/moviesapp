class PreguntaController < ApplicationController
  before_action :set_preguntum, only: [:show, :edit, :update, :destroy]

  

  # GET /pregunta
  # GET /pregunta.json
  def index
    @pregunta = Preguntum.all
  end

  # GET /pregunta/1
  # GET /pregunta/1.json
  def show
    
  end

  # GET /pregunta/new
  def new
    @preguntum = Preguntum.new
    @pregunta = Preguntum.all

  end

  # GET /pregunta/1/edit
  def edit
  end
  
  def tecnica?
    classif == 'Tecnica'
  end
  # POST /pregunta
  # POST /pregunta.json
  def create

    @preguntum = Preguntum.new(preguntum_params)
    respond_to do |format|
      if @preguntum.save
        if tecnica?
          @preguntum.update(tipo: "tecnica")
          format.html { redirect_to action: "new", notice: 'Preguntum Tecnica was successfully created.'}
          format.json { render action: 'show', status: :created, location: @preguntum }
        else
          @preguntum.update(tipo: "comercial")
          format.html { redirect_to action: "new", notice: 'Preguntum Comercial was successfully created.'}
          format.json { render action: 'show', status: :created, location: @preguntum }
        end

      else
        format.html { render action: 'new' }
        format.json { render json: @preguntum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pregunta/1
  # PATCH/PUT /pregunta/1.json
  def update
    respond_to do |format|
      if @preguntum.update(preguntum_params)
        format.html { redirect_to @preguntum, notice: 'Preguntum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preguntum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pregunta/1
  # DELETE /pregunta/1.json
  def destroy
    @preguntum.destroy
    respond_to do |format|
      format.html { redirect_to pregunta_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preguntum
      @preguntum = Preguntum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preguntum_params
      params.require(:preguntum).permit(:contenido)
    end

    def classif
      m = Classifier::Bayes.new 'Tecnica','Comercial'
      m.train_tecnica "La calidad de la pelicula es muy mala"
      m.train_tecnica "No puedo ver el .avi en mi reproductor"
      m.train_tecnica "Los subtitulos no estan de acuerdo a la pelicula"
      m.train_comercial "Cual es el precio de la peliculas"
      m.train_comercial "Cuanto cuesta el envio"
      m.train_comercial "En cuantos dias llega mi pelicula"
      m.classify @preguntum.contenido
    end
end
