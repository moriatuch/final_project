class CountsController < ApplicationController
  def index
    @counts = Count.all
  end

  def new
    @count = Count.new
  end

  def create
    @count = Count.new(count_params)
    @compare.user_id = session["user_id"]
    if @count.save
      redirect_to counts_path, notice: "The image #{@count.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @count = Count.find(params[:id])
    @count.destroy
    redirect_to counts_path, notice:  "The image #{@count.name} has been deleted."
  end

  private
  def count_params
    params.require(:count).permit(:name, :attachment)
  end

end
