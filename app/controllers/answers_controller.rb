class AnswersController < ApplicationController

  def create
    if signed_in?
      answer = Answer.new(answer_params)
      if answer.save
        flash[:notice] = "Your answer has been added!"
        redirect_to question_path(params[:question_id])
      else
        flash[:notice] = "Invalid answer"
        redirect_to question_path(params[:question_id])
      end
    else
      flash[:notice] = 'You need to sign in if you want to do that!'
      redirect_to(new_session_path)
    end
  end

  private

  def answer_params
    question_id = params.permit(:question_id)
    user_id = session[:user_id]
    body = params.require(:answer).permit(:body)
    question_id.merge({ user_id: user_id }).merge(body)
  end

end
