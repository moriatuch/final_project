class DnasController < ApplicationController

  before_filter :authenticate_user!
  @user_id = nil

  def index
    @users = User.all
    @users.each do |user|
      @user_id = session["user_id"] if user.id == session["user_id"]
    end
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
    if valid_data(params[:dna][:attachment1].content_type) && valid_data(params[:dna][:attachment2].content_type)
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
        redirect_to dnas_path, notice: "The images #{@dna.name} has been uploaded."
      else
        render "new"
      end
    else
      redirect_to dnas_path, notice: "The files type is unvalid, the file type need to be png/tiff/jpg/jepg."
    end
  end

  def destroy
    @dna = Dna.find(params[:id])
    @dna.destroy
    redirect_to dnas_path, notice:  "the file type must be an image."
  end

  private
  def dna_params
    params.require(:dna).permit(:name, :attachment1, :attachment2)
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
