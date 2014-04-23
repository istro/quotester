class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    if Group.create group_params
      redirect_to :groups
    else
      render :new
    end
  end

  def index
    @groups = Group.find :all, order: 'created_at ASC'
  end

  def show
    redirect_to controller: 'quotes', action: 'index', group_id: params[:id]
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
