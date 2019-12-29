class DirectoriesController < ApplicationController
  before_action :find_directory!, only: [:show, :edit, :update, :destroy]

  def index
    @directories = Directory.roots
  end

  def new
    @directory = Directory.new
  end

  def show; end

  def edit; end

  def create
    Directory.create(create_params)

    redirect_back(fallback_location: root_path)
  end

  def update
    @directory.update(update_params)

    redirect_to directory_path(@directory)
  end

  def destroy
    @directory.destroy

    redirect_to action: :index
  end

  private

  def find_directory!
    @directory = Directory.find(params[:id])
  end

  def create_params
    params.require(:directory).permit(:name, :parent_id)
  end

  def update_params
    params.require(:directory).permit(:name)
  end
end
