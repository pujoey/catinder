class CatsController < ApplicationController

  def index

      if params["random"] =="true"
      @random = rand(1..Cat.count)
      redirect_to cat_path(@random)
      end


    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params["id"])
  end


end
