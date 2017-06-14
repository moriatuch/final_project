class DnasController < ApplicationController
before_filter :authenticate_user!
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
    `cp #{params[:dna][:attachment1].tempfile.path} C:/Sites/final_project/matlab/red_temp`
    `cp #{params[:dna][:attachment2].tempfile.path} C:/Sites/final_project/matlab/blue_temp`
    Dir.chdir('/Sites/final_project/matlab')
    `matlab -nodesktop -wait  -r "red_compare_to_blue('red_temp', 'blue_temp')";quit`
    output = File.read('red&blue.txt')
    @dna = Dna.new(dna_params)
    result = []
    result = output.split(':')
    @dna.user_id = session["user_id"]
    @dna.ratio = result[0].to_f
    @dna.red = result[1].to_f
    @dna.blue = result[2].to_f
    if @dna.save
      byebug
      redirect_to dnas_path, notice: "The images #{@dna.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @dna = Dna.find(params[:id])
    @dna.destroy
    redirect_to dnas_path, notice:  "The image #{@dna.name} has been deleted."
  end

  private
  def dna_params
    params.require(:dna).permit(:name, :attachment1, :attachment2)
  end

end
