class DnasController < ApplicationController
  def index
    @dnas = Dna.all
    @dnas = Dna.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @dnas.to_csv }
      format.xls # { send_data @dnas.to_csv(col_sep: "\t") }
    end
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
