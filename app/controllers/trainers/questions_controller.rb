class Trainers::QuestionsController < ApplicationController
  before_action :logged_in_user

  def index
    @questions = Question.includes(:topic, :user, :answers)
                         .page(params[:page]).per Settings.paging.size
  end

  def new
    @question = current_user.questions.build
    @topics = Topic.all
    @role = Question.roles
    @question.answers.build
  end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = t "global.question.create_suss"
      redirect_to new_trainers_question_path
    else
      flash.now[:danger] = t "global.question.create_faild"
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def question_params
    params.require(:question).permit Question::QUESTION_PERMIT
  end
end
