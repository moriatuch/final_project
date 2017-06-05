class CountsController < ApplicationController
  def index
    @counts = Count.all
  end

  def new
    @count = Count.new
  end

  def create

    `cp #{params[:count][:attachment].tempfile.path} D:/git/final_project/matlab/temp.png`
    Dir.chdir('/git/final_project/matlab')
    `matlab -nodesktop -wait  -r "Count_Cells('prototype_cells.png')";quit`
    output = File.read('count_cell_result.txt')
    @count = Count.new(count_params)
    @count.user_id = session["user_id"]
    @count.result = output.to_i
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
