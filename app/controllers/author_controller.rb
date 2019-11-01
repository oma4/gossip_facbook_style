class AuthorController < ApplicationController
    def new
  	Gossip.new
  end
  def create
  	Gossip.create
  end

  def show
    @user=User.find(params[:id])
    @gossips=Gossip.where(user_id:params[:id])
  end

  def index
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
  end
end
