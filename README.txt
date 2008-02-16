### Requirements ###
Ruby
Git
Rake
Erubis gem
BlueCloth gem

### Get started ###

Clone squawk-micro

	$ git clone git@github.com:zackchandler/squawk-micro.git
	$ cd squawk-micro
	
Setup commit hook

Edit .git/hooks/post-commit file to say:

	#!/bin/sh
	rake publish

Set as executable
	
	$ chmod +x .git/hooks/post-commit

Make posts in the posts/ directory in this format:

	posts/001-first-post
	or
	posts/002_second_post
	
Commit changes

	$ git add .
	$ git commit -a -m 'Should auto-publish blog on commit'
	
A site directory will be created on commit containing your published blog.

Open site/index.html to see your blog.

### Rake ###

You can also build via rake:

	$ rake publish
