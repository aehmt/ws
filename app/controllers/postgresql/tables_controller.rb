require 'pry-remote'
class PostgreSQL::TablesController < PostgreSQL::BaseController

  def index
		tables = current_database.tables
		if tables
			render locals: {tables: tables}
		else
      render :file => 'public/404.html', :status => :not_found, :layout => false
		end
  end

  def show
		tmp = current_database
		table = PostgreSQL::Table.new(:name => params[:table_name], :database => tmp, :deployment => tmp.deployment)
		table_data = table.data(tmp, tmp.deployment)
    render locals: {table: table_data}
  end
end
