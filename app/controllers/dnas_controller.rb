class DnasController < ApplicationController
  def index
    @dnas = Dna.all
  end

  def new
    @dna = Dna.new
  end

  def create
    @dna = Dna.new(compare_params)
    @dna.user_id = session["user_id"]
    if @dna.save
      redirect_to dnas_path, notice: "The image #{@dna.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @dna = dna.find(params[:id])
    @dna.destroy
    redirect_to dnas_path, notice:  "The image #{@dna.name} has been deleted."
  end

  private
  def compare_params
    params.require(:dna).permit(:name, :attachment)
  end

end
