class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.new
    3.times { @word.choices.new }
  end
  
  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)
    if @word.save
      redirect_to admin_category_url(@category)
    else
      render 'new'
    end
    # save word
    # redirect_to category show page
    # else
    #render a new page
  end

  def edit
    @word = Word.find(params[:id])
  end

  def index
  end
  
  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
    end
end
