class RandomController < ApplicationController
  skip_before_action :authenticate_user!

  respond_to :json

  def any_active
    active_groups = Group.where(active: true).to_a
    all_quotes = []
    active_groups.each{ |group| all_quotes.push group.quotes.load }
    all_quotes.flatten!
    response = { advice: all_quotes.sample.text }
    render json: response
  end

  def group_random
    if params[:name]
      group = Group.where('name ILIKE ?', params[:name]).first
      if group.nil?
        response = { error: "error: group '#{params[:name]}' not found" }
        render json: response
      else
        # could also check to make sure there's at least one quote in the group... but whatevs
        response = { advice: group.quotes.sample.text }
        render json: response, status: 200
      end
    else
      response = { error: 'error: please provide a group name in params' }
      render json: response, status: 422
    end
  end
end
