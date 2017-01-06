class PostgreSQL::BaseController < ApplicationController

  helper_method :current_database

  def current_database
    return nil unless params[:database_name]
# binding.remote_pry
    PostgreSQL::Database.new(name: params[:database_name] || params[:name], deployment: current_deployment)
  end

end
