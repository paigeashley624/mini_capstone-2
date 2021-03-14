class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(
      url: params[:url],
    )

    # #happy/sad path
    # if @image.save
    #   render "show.json.jb"
    # else
    #   render json: { message: @image.errors.full_messages }, status: 406
    # end
  end
end
