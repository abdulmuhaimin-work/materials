class PostsController < ApplicationController

  respond_to :js
  before_action :authenticate!, except: [:index]

  def index
    @topic = Topic.includes(:posts).find_by(id: params[:topic_id])
    @posts = @topic.posts
    @post = Post.new
  end

  def create
    @new_post = Post.new
    @topic = Topic.find_by(id: params[:topic_id])
    @post = current_user.posts.build(post_params.merge(topic_id: params[:topic_id]))
    authorize @post

    if @post.save
      flash.now[:success] = "You've created a new post"
    else
      flash.now[:danger] = @post.errors.full_messages
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
    authorize @post
  end

  def update
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
    authorize @post

    if @post.update(post_params)
      flash[:success] = "You've updated post"
      redirect_to topic_posts_path(@topic)
    else
      flash[:danger] = @post.errors.full_messages
      redirect_to edit_topic_post_path(@topic, @post)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
    authorize @post

    if @post.destroy
      redirect_to topic_posts_path(@topic)
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
