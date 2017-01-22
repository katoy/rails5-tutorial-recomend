def trucate_all
  config = ActiveRecord::Base.configurations[::Rails.env]
  ActiveRecord::Base.establish_connection
  case config['adapter']
  when 'mysql', 'postgresql'
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}") if table != 'schema_migrations'
    end
  when 'sqlite', 'sqlite3'
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("DELETE FROM #{table}") if table != 'schema_migrations'
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'") if table != 'schema_migrations'
    end
    ActiveRecord::Base.connection.execute('VACUUM')
  end
end

trucate_all

nums = 10 # 100000
nums.times { |t| Book.create(name: "book-#{t + 1}") }
nums.times { |t| Music.create(name: "music-#{t + 1}") }
nums.times { |t| Movie.create(name: "movie-#{t + 1}") }

book = Book.first
10.times { |t| Rec.create(order: -t, content: book) }
10.times { |t| Recx.create(order: -t) }

9.times { |t| Recf.create(order: t + 1, content_type: (t % 3 + 1)) }
recf1 = Recf.where(order: 1).first
recf1.update_attributes!(fixed_flag: true, fixed_id: 1)

recf4 = Recf.where(order: 4).first
recf4.update_attributes!(fixed_flag: true, fixed_id: 2)

recf2 = Recf.where(order: 2).first
recf2.update_attributes!(fixed_flag: true, fixed_id: -1)
