class QuestionsController < ApplicationController

  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @create_answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    if signed_in?
      @question = Question.new(question_params)
      if @question.save
        flash[:notice] = "Your question has been posted!"
        redirect_to questions_path
      else
        flash[:notice] = "Your question could not be posted!"
        render :new
      end
    else
      flash[:notice] = "You need to be signed in!"
      redirect_to(new_session_path)
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.update(params[:id], question_params)
    if @question.save
      flash[:notice] = "The question has been updated!"
      redirect_to question_path(params[:id])
    else
      flash[:notice] = "Invalid update"
      render :edit
    end
  end

  def destroy
    Question.destroy(params[:id])
    flash[:notice] = "The question has been deleted!"
    redirect_to questions_path
  end

  private

  def question_params
    question = params.require(:question).permit(:title, :description)
    question.merge(user_id: session['user_id'])
  end
end
