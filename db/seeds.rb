require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end


100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(title: RandomData.random_sentence, body: RandomData.random_paragraph)
posts = Post.all

post = Post.last
Comment.find_or_create_by(post: post, body: RandomData.random_paragraph)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
