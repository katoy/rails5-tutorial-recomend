## レコメンデーションの練習

```
# ruby 2.4, rails 5 は事前にインストールして置く事

$ bundle install
$ bin/rails db:environment:set RAILS_ENV=development
$ rails db:migrate
$ rails db:reset

$ rails c
> Recx.make.map {|x| x.content.name }
=> => ["music-5", "book-9", "music-7", "movie-8", "music-8", "book-3", "book-7", "movie-3", "movie-7"]

> Rec.make.map {|x| x.content.name }
=> ["book-8", "movie-6", "music-3", "music-4", "book-4", "movie-5", "movie-2", "book-6", "music-6"]
```
make メソッドを実行する度に、異なる商品リストが得られていることが示されている。

Rec は polymorphic で、 Book, Music, Movie に結びつけている。

Recx は virtual attribute で content メンバーを定義し、そこに Book, Music, Movie を結びつけている。
![erd.png](erd.png)


Recf クラス

```
$ rails c
Running via Spring preloader in process 76136
Loading development environment (Rails 5.0.1)
[1] pry(main)> Recf.show(recs);""
NameError: undefined local variable or method `recs' for main:Object
from (pry):1:in `<main>'
[2] pry(main)> q = RecommendService::Recf.new;""
=> ""
[3] pry(main)> recs = q.make;""
  Recf Load (46.9ms)  SELECT "recfs".* FROM "recfs" ORDER BY "recfs"."order" ASC
  Book Load (20.4ms)  SELECT "books".* FROM "books" WHERE "books"."id" IN (1, 2)
  Music Load (0.5ms)  SELECT "musics".* FROM "musics" WHERE "musics"."id" = -1
  Movie Load (0.1ms)  SELECT "movies".* FROM "movies" WHERE 1=0
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE ("books"."id" NOT IN (1, 2))
  Music Load (0.2ms)  SELECT "musics".* FROM "musics" WHERE ("musics"."id" != -1)
  Movie Load (0.4ms)  SELECT "movies".* FROM "movies" WHERE (1=1)
=> ""
[4] pry(main)> Recf.show(recs);""
#<Recf id: 1, order: 1, content_type: "book", fixed_flag: true, fixed_id: 1, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Book id: 1, name: "book-1", author: nil, page: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 3, order: 3, content_type: "movie", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Movie id: 9, name: "movie-9", author: nil, playtime: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 4, order: 4, content_type: "book", fixed_flag: true, fixed_id: 2, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Book id: 2, name: "book-2", author: nil, page: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 5, order: 5, content_type: "music", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Music id: 1, name: "music-1", player: nil, playtime: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 6, order: 6, content_type: "movie", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Movie id: 7, name: "movie-7", author: nil, playtime: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 7, order: 7, content_type: "book", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Book id: 8, name: "book-8", author: nil, page: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 8, order: 8, content_type: "music", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Music id: 2, name: "music-2", player: nil, playtime: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
#<Recf id: 9, order: 9, content_type: "movie", fixed_flag: false, fixed_id: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
	#<Movie id: 2, name: "movie-2", author: nil, playtime: nil, created_at: "2017-01-22 10:16:02", updated_at: "2017-01-22 10:16:02">
=> ""
```
