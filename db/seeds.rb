def trucate_all
  config = ActiveRecord::Base.configurations[::Rails.env]
  ActiveRecord::Base.establish_connection
  case config['adapter']
  when 'mysql', 'postgresql'
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}") if table != 'schema_migrations'
    end
  when "sqlite", "sqlite3"
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("DELETE FROM #{table}") if table != 'schema_migrations'
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'") if table != 'schema_migrations'
    end
    ActiveRecord::Base.connection.execute('VACUUM')
  end
end

trucate_all

nums = 10 # 100000
nums.times { |t| Book.create(name: "book-#{t}") }
nums.times { |t| Music.create(name: "music-#{t}") }
nums.times { |t| Movie.create(name: "movie-#{t}") }

book = Book.first
10.times { |t| Rec.create(order: -t, content: book) }
10.times { |t| Recx.create(order: -t) }
