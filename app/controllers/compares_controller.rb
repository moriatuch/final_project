class ComparesController < ApplicationController
  def index
    @compares = Compare.all
  end

  def new
    @compare = Compare.new
  end

  def create
    @compare = Compare.new(compare_params)
    @compare.user_id = session["user_id"]
    if @compare.save
      redirect_to compares_path, notice: "The image #{@compare.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @compare = Compare.find(params[:id])
    @compare.destroy
    redirect_to compares_path, notice:  "The image #{@compare.name} has been deleted."
  end

  private
  def compare_params
    params.require(:compare).permit(:name, :attachment)
  end

end
