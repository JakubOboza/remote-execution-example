class BuildsController < ApplicationController

  def index
    @builds = current_user.builds.all(:order => "created_at DESC")
  end

  def new
    @build = current_user.builds.new
  end

  def create
    @build = current_user.builds.new(build_params)
    if @build.save
      flash[:notice] = "Build created"
      redirect_to builds_path
    else
      flash[:error] = "Could not create your build"
      render :new
    end
  end


  protected

  def build_params
    params.require(:build).permit(:command, :remote)
  end

end
