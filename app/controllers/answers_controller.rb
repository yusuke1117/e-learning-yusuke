class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])  
    @answer = Answer.new
    if @lesson.next_word.nil?
      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])  
    @answer = @lesson.answers.create(answer_params)

    redirect_to new_lesson_answer_url(@lesson)
  end

  private
  def answer_params
   params.require(:answer).permit(:word_id, :choice_id)
  end
end
