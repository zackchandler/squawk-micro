#!/usr/bin/env ruby

%w(rubygems ostruct fileutils erubis bluecloth).each { |lib| require lib }

# generate layout
layout_template = Erubis::Eruby.new(File.read('views/layout.erb'))
index_template = Erubis::Eruby.new(File.read('views/index.erb'))
page_template = Erubis::Eruby.new(File.read('views/post.erb'))

# get posts
posts = Dir['posts/*'].reverse.map do |post|
  OpenStruct.new(:permalink => post.split('/').last,
                 :title => post.split('/').last.gsub(/-|_/, ' ')[4..-1],
                 :published_at => File.ctime(post),
                 :body => File.read(post))
end

# generate site folder
FileUtils.mkdir_p 'site'

# generate pages
posts.each do |post|
  File.open("site/#{post.permalink}.html", 'w+') do |page|
    page << layout_template.evaluate(:content => page_template.evaluate(:post => post))
  end
end

# generate index page
File.open('site/index.html', 'w+') do |page|
  page << layout_template.evaluate(:content => index_template.evaluate(:posts => posts))
end