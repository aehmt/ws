class PostgreSQL::DatabasesController < PostgreSQL::BaseController

  def index
    # binding.remote_pry
    if current_deployment 
      render locals: {databases: current_deployment.databases}
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def current_database
    return nil unless params[:name]
    PostgreSQL::Database.new(name: params[:name], deployment: current_deployment)
  end

end
