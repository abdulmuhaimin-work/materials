class TopicsController < ApplicationController

  respond_to :js
  before_action :authenticate!, except: [:index]

  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def create
    @new_topic = Topic.new
    @topic = current_user.topics.build(topic_params)
    authorize @topic

    if @topic.save
      flash.now[:success] = "You've created a new topic."
    else
      flash.now[:danger] = @topic.errors.full_messages
    end
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    if @topic.update(topic_params)
      flash[:success] = "You've updated the topic."
      redirect_to topics_path(@topic)
    else
      flash[:danger] = @topic.errors.full_messages
      redirect_to edit_topic_path(@topic)
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.destroy
      redirect_to topics_path
    else
      redirect_to topics_path(@topic)
    end
  end


private


  def topic_params
    params.require(:topic).permit(:title, :description, :image)
  end

end
