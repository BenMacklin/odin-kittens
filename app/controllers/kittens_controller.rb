class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    if @kitten.save
    redirect_to kitten_path, notice: "Kitten has been saved"
    else
    render new_kitten_path
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    kitten = current_account.kitten.find(params[:id])
    kitten.update!(person_params)
    redirect_to kitten_path
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
