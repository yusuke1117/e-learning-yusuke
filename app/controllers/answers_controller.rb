class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])  
    @answer = Answer.new
    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.lesson_result)
      redirect_to lesson_url(@lesson) #in show page: @lesson.result
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
