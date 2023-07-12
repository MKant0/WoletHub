class LinksController < ApplicationController

  def create
    @link = Link.new(link_params)
    if @link.save
      # handle a successful save
      flash[:success] = "Link was successfully created."
      redirect_to @link
    else
      # handle an unsuccessful save
      flash[:error] = "There was an error creating the link."
      render 'new'
    end
  end

  private

def link_params
  params.require(:link).permit(:id, :username, :holder_id, :holder_type, :created_at, :active, :institution, :mode)
end

end
