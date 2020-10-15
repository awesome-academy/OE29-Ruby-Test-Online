class Trainers::TopicsController < ApplicationController
  before_action :logged_in_user
  before_action :build_topic, only: :create

  def index
    @topic = Topic.all
  end

  def new
    @topic = current_user.topics.build
  end

  def create; end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end
