class BlabsController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]
  #controller hook, cannot be used inside model

  def index
    @blabs = Blab.all.includes(:author)
    #the only way to pass information from controller to view is to use
    #instance variables
    #local variables will not be passed to the view

    # render json: blabs
    # render :test #this is the block given to the "yield" in application.html.erb
    #rails knows where to find this test view inside the blabs folder
    #and finds test.html.erb
    render :index
    #RESTful convention is we want to match the name of the controller action
  end

  def show
    @blab = Blab.find(params[:id])
    # render json: blab
    render :show
  end

  def create
    # need to use Postman to test this now
    # author = User.all.sample # random author
    @blab = current_user.authored_blabs.new(blab_params)
    # @blab.author = current_user
    if @blab.save # returns true/false
      # render json: blab
      redirect_to blab_url(@blab)
   
    else
      # render json: blab.errors.full_messages, status: 422
      flash.now[:errors] = @blab.errors.full_messages
      # typically, flash.now is for rendering
      # whereas flash is for redirecting
      # redirect_to new_blab_url
      render :new, status: 422
    end
  end

  def update
    blab = current_user.authored_blabs.find(params[:id])
    # can either redirect or render, NOT BOTH
    if blab.update(blab_params)
      # redirect the user to the show page
      redirect_to blab_url(params[:id])
      #We redirect here, because once the user is updated,
      #the update function completed it's job and we want to 
      #start a new HTTP cycle by redirecting to show
      #This is separation of responsibilities
    else 
      flash[:errors] = blab.errors.full_messages
      redirect_to blab_url(params[:id])
      # render json: blab.errors.full_messages
    end
  end

  def destroy
    blab = current_user.authored_blabs.find(params[:id])
    #do not need to have an instance variable, because this data is not being sent to the view
    
    blab.destroy
    # redirect to blabs index
    redirect_to blabs_url
  end

  def new
    @blab = Blab.new
    #this will give us a blank default Blab object that we can use in the views

    # render :new
    # If nothing is rendered or redirected, Rails knows to look for
    # the RESTful convention template which in this case would be
    # new.html.erb (the name of the method .html.erb)
  end

  def edit
    @blab = current_user.authored_blabs.find_by(id: params[:id])
    if @blab
      render :edit
    else 
      flash[:errors] = ["You cannot edit this blab"]
      redirect_to blab_url(params[:id])
    end
  end

  def get_cookie
    my_cookie = flash[:errors]
    if my_cookie
      render plain: "Here's your cookie: #{my_cookie}"
    else
      render plain: "You haven't set a cookie called :my_cookie yet"
    end
  end

  def set_cookie
    maybe_cookie = [params[:my_cookie]]

    if maybe_cookie
      flash.now[:errors] = maybe_cookie
      render plain: "I am setting your cookie: #{flash[:errors]}"
    else
      render plain: "You must provide a cookie"
    end
  end

  private

  def blab_params # will return a hash-like object
    # will expect blab to be a key and body to be a key inside
    # of the blab key eg. {blab: {body: "hey derr"}}
    params.require(:blab).permit(:body) # returns {"body": "hey derr"}
  end
end