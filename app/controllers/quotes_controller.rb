class QuotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @quote = Quote.new
    @group_id = params[:group_id]
  end

  def create
    group = Group.find params[:group_id]

    if group.quotes.create quote_params
      redirect_to group_quotes_path
    else
      redirect_to :back, notice: 'There was an error'
    end
  end

  def edit
    @quote = Quote.find params[:id]
  end

  def index
    @group = Group.find params[:group_id]
    @quotes = @group.quotes
  end

  def show
  end

  def update
    @quote = Quote.find params[:id]
    @quote.update quote_params
    redirect_to group_quotes_path
  end

  def destroy
    Quote.destroy params[:id]
    redirect_to group_quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :group_id)
  end

end
