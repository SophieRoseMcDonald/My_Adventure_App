
From: /Users/sophie/wdi/project2/myadventure/app_console.rb @ line 9 :

    4: require_relative 'models/adventure'
    5: require_relative 'models/tag'
    6: require_relative 'models/comment'
    7: require_relative 'models/user'
    8: binding.pry
 => 9: puts ' app console'

[1] pry(main)> adv = Adventure.first
=> #<Adventure:0x007feac5cb96e0
 id: 1,
 name: "Possum Hollow",
 image_url: "http://www.banyulenillumbikkids.com.au/web/wp-content/uploads/2016/08/park.jpg",
 address: "Beverley Rd, Heidelberg",
 details: "Lorem lean startup ipsum product market fit customer development acquihire technical cofounder.",
 special_mention:
  "fully fenced - good shade - bbqs - basketball court - flying foxes - public toilets - picnic shelter - walking trails nearby - sporting fields nearby - fitness equipment nearby">
[2] pry(main)> adv.tags
=> []
[3] pry(main)> adv.tags.push
=> []
[4] pry(main)> adv.tags.push Tag.find(1)
=> [#<Tag:0x007feac56ae098 id: 1, tag_name: "playground">]
[5] pry(main)> adv.tags
=> [#<Tag:0x007feac56ae098 id: 1, tag_name: "playground">]
[6] pry(main)> adv.tags.push Tag.find_by('playground')
ActiveRecord::StatementInvalid: PG::UndefinedColumn: ERROR:  column "playground" does not exist
LINE 1: SELECT  "tags".* FROM "tags" WHERE (playground) LIMIT $1
                                            ^
: SELECT  "tags".* FROM "tags" WHERE (playground) LIMIT $1
from /Users/sophie/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.1.4/lib/active_record/connection_adapters/postgresql_adapter.rb:614:in `async_exec'
[7] pry(main)> adv.tags.push Tag.find_by("bbq")
ActiveRecord::StatementInvalid: PG::UndefinedColumn: ERROR:  column "bbq" does not exist
LINE 1: SELECT  "tags".* FROM "tags" WHERE (bbq) LIMIT $1
                                            ^
: SELECT  "tags".* FROM "tags" WHERE (bbq) LIMIT $1
from /Users/sophie/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.1.4/lib/active_record/connection_adapters/postgresql_adapter.rb:614:in `async_exec'
[8] pry(main)> adv.tags.push Tag.find_by(tag_name: 'playground')
=> [#<Tag:0x007feac56ae098 id: 1, tag_name: "playground">, #<Tag:0x007feac3274060 id: 1, tag_name: "playground">]
