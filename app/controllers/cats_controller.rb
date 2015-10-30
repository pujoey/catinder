class CatsController < ApplicationController

  def index
    @cats = Cat.all

    if params["random"] =="true"
      @random = rand(1..Cat.count)
      redirect_to cat_path(@random)
    end

  end

  def show
    @cat = Cat.find(params["id"])
  end

  def update
    cat = Cat.find(params["id"])
    cat.upvote! if params["vote"]
    redirect_to cats_path(random: true)
  end

  def new
    @cat = Cat.new
  end

  def create
    cat = Cat.new(cat_params)
    cat.votes = 0

      if cat.save
        redirect_to cat_path(cat)
      else
        redirect_to new_cat_path
      end

  end



  private
    def cat_params
      params.require(:cat).permit(:name, :image_uri)
    end

end
