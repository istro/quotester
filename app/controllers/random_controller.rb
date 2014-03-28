class RandomController < ApplicationController
  skip_before_action :authenticate_user!

  def any_active
    active_groups = Group.find_all_by_active true
    all_quotes = []
    active_groups.each{ |group| all_quotes.push group.quotes.all }
    all_quotes.flatten!
    render json: all_quotes.sample.text, status: 200
  end

  def group_random
    if params[:name]
      group = Group.where('name ILIKE ?', params[:name]).first
      if group.nil?
        render json: "error: group '#{params[:name]}' not found", status: 404
      else
        # could also check to make sure there's at least one quote in the group... but whatevs
        render json: group.quotes.sample.text, status: 200
      end
    else
      render json: 'error: please provide a group name in params', status: 422
    end
  end
end
