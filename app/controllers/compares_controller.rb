class ComparesController < ApplicationController
  def index
    @compares = Compare.all
  end

  def new
    @compare = Compare.new
  end

  def create
    `cp #{params[:compare][:attachment].tempfile.path} D:/git/final_project/matlab/temp.png`
    Dir.chdir('/git/final_project/matlab')
    `matlab -nodesktop -wait  -r "compare_ver2('temp.png')";quit`
    output = File.read('myfile.txt')
    @compare = Compare.new(compare_params)
    @compare.user_id = session["user_id"]
    @compare.result = output.to_i
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
