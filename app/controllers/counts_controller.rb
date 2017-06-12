class CountsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @counts = Count.all
    @counts = Count.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @counts.to_csv }
      format.xls # { send_data @counts.to_csv(col_sep: "\t") }
    end
  end

  def new
    @count = Count.new
  end

  def create
    `cp #{params[:count][:attachment].tempfile.path} C:/Sites/final_project/matlab/count_temp`
    Dir.chdir('/Sites/final_project/matlab')
    `matlab -nodesktop -wait  -r "Count_Cells('count_temp')";quit`
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
