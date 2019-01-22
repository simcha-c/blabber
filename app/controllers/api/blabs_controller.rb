class Api::BlabsController < ApplicationController

  def index
    @blabs = Blab.all
    render json: @blabs
  end

  def show
    @blab = Blab.find(params[:id])
    render json: @blab
  end

  def create
    @blab = Blab.new(blab_params)
    @blab.author = User.all.sample # randomly assign a user until we set up frontend auth
    if @blab.save
      render json: @blab
    else
      render json: @blab.errors.full_messages, status: 422
    end
  end

  private

  def blab_params
    params.require(:blab).permit(:body)
  end  
  
end