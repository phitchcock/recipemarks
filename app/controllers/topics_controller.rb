class TopicsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    @bookmarks = @topic.bookmarks.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: "#{@topic.name} was created!"
    else
      flash[:error] = "Topic was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "#{@topic.name} was updated!"
    else
      flash[:error] = "Topic was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path, notice: "#{@topic.name} was destroyed!"
    else
      flash[:error] = "Topic was not destroyed, please try again"
      redirect_to @topic
    end
  end

  private

  def topic_params
    params.require(:topic).permit!
  end

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end
end