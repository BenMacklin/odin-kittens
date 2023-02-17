class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @kitten }

    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
    redirect_to kitten_path(@kitten), notice: "Kitten has been saved"
    else
    render new_kitten_url
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    kitten = Kitten.find(params[:id])
    kitten.update!(kitten_params)
    redirect_to kitten_path(kitten)
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.delete
    flash.notice="'#{@kitten.name}' record was deleted"

    redirect_to root_url
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
