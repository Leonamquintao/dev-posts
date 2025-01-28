# README

* Ruby version 3.2.2

* Rails version 7.2.2

created the project with:

> rails _7.2.2_ new --api dev-blog --skip-test --database=postgresql

Check the Gemfile to see the dependencies.

> bundle install

for Rspec initial setup I've run:

> rails generate rspec:install

should generate the following files:

```
create  .rspec
create  spec
create  spec/spec_helper.rb
create  spec/rails_helper.rb
```

For generating models I've run:

> rails generate model Post title:string body:text author:string

FactoryBot on `Rails command line`:

> FactoryBot.create(:post)

Manipulating data on `Rails command line`:

> post = Post.find(1)
> post.update(title: "New Title", body: "New Body", author: "New Author")


