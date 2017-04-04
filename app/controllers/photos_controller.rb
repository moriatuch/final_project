class PhotosController < ApplicationController
  def index
    if (params.has_key?(:id) && params.has_key?(:random))
      @id=params['id']
      @random=params[:random]
    end

  end

  def sample
    @controller_message="Hello from controller"


  end

  def redirect_after_sign_in
    link_to '/pages', '#',
            :onclick => 'alert("Please no!")'
  end


end
