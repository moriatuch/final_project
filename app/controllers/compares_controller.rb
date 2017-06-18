class ComparesController < ApplicationController
  before_filter :authenticate_user!
  @user_id = nil

  def index
    @users = User.all
    @users.each do |user|
      @user_id = session["user_id"] if user.id == session["user_id"]
    end
    @compares = Compare.all
    @compares = Compare.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @compares.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def new
    @compare = Compare.new
  end

  def to_csv
    Dir.chdir('/Sites/final_project/matlab')
    `sqlite3.exe -csv C:/Sites/final_project\db\development.sqlite3 "SELECT * FROM dnas" > C:/Sites/final_project\ExcelTest.csv`
  end

  def create
    `cp #{params[:compare][:attachment].tempfile.path} C:/Sites/final_project/matlab/compare_temp.png`
    Dir.chdir('/Sites/final_project/matlab')
    `matlab -nodesktop -wait  -r "compare_ver3('compare_temp.png')";quit`
    output = File.read('myfile.txt')
    @compare = Compare.new(compare_params)
    @compare.user_id = session["user_id"]
    @compare.result = output.to_f
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
