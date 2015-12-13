class FavorsController < ApplicationController
  
  def index
    @favors = Favor.all
  end
  
  def show
    @favor = Favor.find(params[:id])
  
  end
  
  def new
    @favor = Favor.new
  
  end
  
  def create
    @favor = Favor.new(favor_params)
    @favor.trader = Trader.find(1)
    
    if @favor.save
      flash[:success] = "Your favor was created succesfully!"
      redirect_to favors_path
    
    else
      render :new
    end
     
  end
  
  private
  
    def favor_params
      params.require(:favor).permit( :title, :summary, :description)
    end

end