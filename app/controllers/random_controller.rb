class RandomController < ApplicationController
  skip_before_action :authenticate_user!

  respond_to :json

  def get_praise
    # costumize for specific users.
    # todo: bring that out into UI
    if params[:name].casecmp('marekjanicki') == 0
      params[:group_name] = 'stern'
      group_random
    else
      any_active
    end
  end

  def any_active
    active_groups = Group.where(active: true).to_a
    all_quotes = []
    active_groups.each{ |group| all_quotes.push group.quotes.load }
    all_quotes.flatten!
    response = { advice: all_quotes.sample.text }.to_json
    render json: response,  status: 200, callback: params[:callback]
  end

  def group_random
    if params[:group_name]
      group = Group.where('name ILIKE ?', params[:group_name]).first
      if group.nil?
        any_active
      else
        if group.quotes.length > 0
          response = { advice: group.quotes.sample.text }
          render json: response, status: 200, callback: params[:callback]
        else
          any_active
        end
      end
    else
      any_active
    end
  end
end
