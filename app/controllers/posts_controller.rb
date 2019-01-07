class PostsController < ApplicationController

  before_action :find_post, only: [:show, :update, :edit, :destroy]

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
      render 'new' # render the <new> template again
    end
  end
    
  def show
    # We can leave this method empty since we have the before_action declaration.
    # search for post by :id
    # @post = Post.find(params[:id])
 
  end

# whilst update is the actual change to records
def update
  # @post = Post.find(params[:id])
  # "..if passed our security method declared above"
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit' # else render the <edit> template again.
  end
  
end

# edit is the view that we will render allowing user to make changes
def edit
  # @post = Post.find(params[:id])
end

def destroy
 # @post = Post.find(params[:id])
 @post.destroy
 
 redirect_to posts_path
end


# private declaration must be at bottom of page o/w other methods wont be accessible..
  private

  def post_params
    # "Security feature" of rails that allows us to declare what type of input the form will accept when creating record.
    # set to true if passes validation.
    params.require(:post).permit(:title, :content) 
  end

  def find_post
    @post = Post.find(params[:id])

  end



end
