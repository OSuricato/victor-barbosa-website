User.destroy_all
PostCategory.destroy_all
Post.destroy_all
Comment.destroy_all

puts 'starting seed'

post_categories = PostCategory.create([
  { name: 'Blog' },
  { name: 'Portfolio' }
])

user = User.create(
  email: 'victor@victorbarbosa.com',
  password: '123123'
)

user = User.create(
  email: 'test@test.com',
  password: '123123'
)



5.times do
  blog = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    post_category: post_categories.find { |pc| pc.name == 'Blog' },
    link: Faker::Internet.url,
    user: user
  )
end

5.times do
  portfolio = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    post_category: post_categories.find { |pc| pc.name == 'Portfolio' },
    link: Faker::Internet.url,
    user: user
  )
end

users = []
3.times do
  users << User.create(
    email: Faker::Internet.email,
    password: '123123'
  )
end

users.each do |user|
  5.times do
    post = Post.all.sample
    post.comments.create(
      content: Faker::Lorem.paragraph(sentence_count: 2),
      user: user
    )
  end
end

puts 'seed finished'
