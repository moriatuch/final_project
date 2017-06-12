class PhotosController < ApplicationController
  before_filter :authenticate_user!
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
    link_to '/photos', '#',
            :onclick => 'alert("Please no!")'
  end
end
