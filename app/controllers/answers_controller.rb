class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      AnswerMailer.new_answer(@answer).deliver
      flash[:success] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:danger] = "Failed to save answer."
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
