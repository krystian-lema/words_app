class AppWordsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index, :show, :create, :update, :destroy]
  http_basic_authenticate_with name:"user", password: "pass"
  before_action :find_word, only: [:show, :edit, :update, :destroy]

  def index
  	@words = Word.all.order("created_at")
  end

  def new
    @word = Word.new
  end

  def create
  	parsed_body = getparsebody
    @word = Word.create( 
 	  definition: parsed_body['definition'],
      translation: parsed_body['translation'])
    if @word.save
      respond_to do |format|
      	format.json {
    	  render json: {success: true}
      	}
      end
    else
      respond_to do |format|
      	format.json {
    	  render json: {success: false}
      	}
      end
    end
  end
  
  def show
  end

  def edit
  end

  def update
  	parsed_body = getparsebody
    update_complete = @word.update(
      definition: parsed_body['definition'],
      translation: parsed_body['translation'])
    if update_complete
      respond_to do |format|
      	format.json {
    	  render json: {success: true}
      	}
      end
    else
      respond_to do |format|
      	format.json {
    	  render json: {success: false}
      	}
      end
	end	
  end

  def destroy
    @word.destroy
  end

  def getparsebody
    request.body.rewind
    request_body = request.body.read
    if request_body.empty?
      request_body = '{}'
    end
    parsed_body = JSON.parse(request_body)
    parsed_body
  end

  def find_word
  	@word = Word.find(params[:id])
  end

  def word_params
  	params.require(:word).permit(:definition, :translation)
  end

end
