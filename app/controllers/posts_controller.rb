class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
  
  end

  def create
    @post = Post.new(post_params)

    if @post.save # ".. if record was created => e.g, passed validation.."
      redirect_to @post # redirect to the <post> just created
    else
      render 'new' # render the <new> template
    end
    
  end

  private

  def post_params
    # "Security feature" of rails that allows us to declare what type of input the form will accept when creating record.
    # set to true if passes validation.
    params.require(:post).permit(:title, :content) 
  end


end
