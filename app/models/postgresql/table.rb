class PostgreSQL::Table
  include Virtus.model

  attribute :database, PostgreSQL::Database
  attribute :deployment, PostgreSQL::Deployment

  attribute :name, String
  
  def client
    database.client 
  end

  def data(database, deployment)
		# binding.remote_pry
		conn=PGconn.connect(:hostaddr=>"127.0.0.1", :port=>6432, :dbname=>database.name)
		res = conn.exec("SELECT * FROM #{name}")
		rows_count = res.num_tuples
		data = []
		data << name
		data << res.fields
    	
		for i in 0..rows_count-1
			row_hash = res[i]
			data << row_hash
		end
		data	
  end

end
