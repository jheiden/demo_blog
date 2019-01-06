class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
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
    
  def show
    # search for post by :id
    @post = Post.find(params[:id])
 
  end



  private

  def post_params
    # "Security feature" of rails that allows us to declare what type of input the form will accept when creating record.
    # set to true if passes validation.
    params.require(:post).permit(:title, :content) 
  end


end
