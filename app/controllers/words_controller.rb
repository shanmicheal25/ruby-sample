class WordsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy] 
    before_action :set_word, only: %i[show edit update destroy]

    def index 
        @words = Word.page params[:page]
    end

    def new 
        @word = current_user.words.new
    end

    def create
      @word = Word.new(word_params)
      @word.user = current_user
      if @word.save
        redirect_to(words_path)
      else
        render :new
      end
    end

    def show; end

    def edit 
      authorize @word
    end

    def update
      authorize @word
      if @word.update(word_params)
        redirect_to(words_path(@word))
      else
        render :edit
      end
    end

    def destroy
      @word.destroy
      redirect_to(words_path)
    end

    private 
    
    def word_params
        params.require(:word).permit(:content, :language_id)
    end

    def set_word 
      @word = Word.find(params[:id])
    end

end


