class BrainsController < ApplicationController
  before_action :set_brain, except: %i[new create index]
  before_action :set_user

  def new
    @brain = Brain.new
  end

  def create
    params[:brain][:user_id] = current_user.id
    @brain = Brain.new(brain_params)
    if @brain.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @brains = Brain.all
  end

  def show; end

  def edit; end

  def update
    if current_user.id == @brain.user_id
      @brain.update(brain_params)
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @brain.user_id
      @brain.destroy
      redirect_to brains_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def brain_params
    params.require(:brain).permit(:name, :description, :price, :user_id)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
