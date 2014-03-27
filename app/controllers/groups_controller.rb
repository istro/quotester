class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.new group_params

    if group.save
      redirect_to :groups
    else
      render :new
    end
  end

  def index
    @groups = Group.find :all, order: 'id'
  end

  def show
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]
    @group.update group_params
    redirect_to :groups
  end

  def destroy
    Group.destroy params[:id]
    redirect_to :groups
  end

  private

  def group_params
    params.require(:group).permit(:name, :active)
  end

end
