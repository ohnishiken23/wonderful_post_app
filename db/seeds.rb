# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 自作
# 3.times do |n|
#   User.create!(
#     email: "user00#{(n+1)}@test.com",
#     password: "test1234"
#   )

#   50.times do |num|
#     Article.create!(
#       title: "No.#{num+1}:user#{n+1}の記事",
#       content: "No.#{num+1}:user#{n+1}の記事の本文",
#       user_id: n+1
#     )
#   end
# end

3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = 'test1234'
  end

  50.times do |ii|
    ii += 1
    user.articles.find_or_create_by!(title: "No.#{ii}: user00#{i}の記事") do |article|
      article.content = "No.#{ii}: user00#{i}の記事の本文"
    end
  end
end
