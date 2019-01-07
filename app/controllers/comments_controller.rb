class CommentsController < ApplicationController

  def create
    # since comments belong to a post we need to locate the post to attach comment to.
    # post_id was created through running rails g migration AddPostIdToComments
    # and then editing code in migration file. <:post_id> and <comments> is linked to arguments in migration file

    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :comment))
    redirect_to post_path(@post)

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end
