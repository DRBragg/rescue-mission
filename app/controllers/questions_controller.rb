class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = 'Added new Question.'
      redirect_to @question
    else
      flash[:danger] = 'Error saving question.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:success] = 'Question updated.'
      redirect_to @question
    else
      flash[:danger] = 'Error updating question.'
      redirect_to edit_question_path
    end
  end

  def destroy
    question = Question.find(params[:id])

    question.destroy

    flash[:warning] = 'Question deleted.'
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
