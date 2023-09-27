# Destroy all records
PostTag.destroy_all
Tag.destroy_all
Comment.destroy_all
Post.destroy_all
PostCategory.destroy_all
User.destroy_all

puts 'Starting seed'

# Create post categories
post_categories = PostCategory.create([
  { name: 'Blog' },
  { name: 'Portfolio' }
])

# Create users
user = User.create(
  email: 'victor@victorbarbosa.com',
  password: '123123'
)

user = User.create(
  email: 'test@test.com',
  password: '123123'
)

# Create tags
tags = Tag.create([
  { name: 'Tech' },
  { name: 'Software Development' },
  { name: 'Entrepreneurship' },
  { name: 'Learning' },
  { name: 'Thoughts' },
  { name: 'Innovation' },
  { name: 'Venture Capital' },
  { name: 'Brazil' },
  { name: 'Silicon Valley' },
  { name: 'Ruby on Rails' },
  { name: 'Javascript' }
])

# Create blog posts
5.times do
  blog = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    post_category: post_categories.find { |pc| pc.name == 'Blog' },
    link: Faker::Internet.url,
    user: user,
    tag_ids: tags.sample(3).map(&:id)  # Assign 3 random tags to each post
  )
end

# Create portfolio posts
5.times do
  portfolio = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    post_category: post_categories.find { |pc| pc.name == 'Portfolio' },
    link: Faker::Internet.url,
    user: user,
    tag_ids: tags.sample(3).map(&:id)  # Assign 3 random tags to each post
  )
end

# Create comments
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

puts 'Seed finished'
