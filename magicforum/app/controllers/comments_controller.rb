class CommentsController < ApplicationController

  def index
    @topic = Topic.includes(:posts).find_by(id: params[:topic_id])
    @post = Post.includes(:comments).find_by(id: params[:post_id])
    @comments = @post.comments
  end

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(post_params.merge(post_id: params[:post_id]))

    if @comment.save
      redirect_to topic_post_comments_path(@post)
    else
      render new_topic_post_comment_path(@post)
    end
  end



  private

    def post_params
      params.require(:comment).permit(:body)
    end
end
