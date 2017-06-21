class CountsController < ApplicationController
  before_filter :authenticate_user!
    @user_id = nil

  def index
    @users = User.all
    @users.each do |user|
      @user_id = session["user_id"] if user.id == session["user_id"]
    end
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
    if valid_data(params[:count][:attachment].content_type)
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
    else
      redirect_to counts_path, notice: "The file type is unvalid, the file type need to be png/tiff/jpg/jepg."
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

  def valid_data(attachment)
    if (attachment.match /.png/)
      return true
    elsif attachment.match /.tiff/
      return true
    elsif attachment.match /.jpg/
      return true
    elsif attachment.match /.jepg/
      return true
    else
      return false
    end
  end

end
