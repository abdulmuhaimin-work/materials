class CommentsController < ApplicationController

  respond_to :js
  before_action :authenticate!, except: [:index]

  def index
    @topic = Topic.includes(:posts).find_by(id: params[:topic_id])
    @post = Post.includes(:comments).find_by(id: params[:post_id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params.merge(post_id: params[:post_id]))
    @new_comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
    @topic = @post.topic


    if @comment.save
      flash.now[:success] = "You've created a new comment."
    else
      flash.now[:danger] = @comment.errors.full_messages
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    @topic = @post.topic
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    @topic = @post.topic

    if @comment.update(comment_params)
      flash.now[:success] = "You've updated ur commment"
    else
      redirect_to edit_topic_post_comment_path(@post, @comment)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    @topic = @post.topic

    if @comment.destroy
      flash.now[:success] = "You've deleted ur commment"
    end
  end



  private

    def comment_params
      params.require(:comment).permit(:body, :image)
    end
end
