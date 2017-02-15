class WordsController < ApplicationController
  http_basic_authenticate_with name:"user", password: "pass"
  before_action :find_word, only: [:show, :edit, :update, :destroy]
  def index
  	@words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @word.destroy
    redirect_to root_path
  end

  def find_word
  	@word = Word.find(params[:id])
  end

  def word_params
  	params.require(:word).permit(:definition, :translation)
  end
end
