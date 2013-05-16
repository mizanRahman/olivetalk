#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Ot::Application.load_tasks

remote_repos = {
	"github" => "github", 
	"bitbucket" => "origin"
}

deploy_remotes = {'heroku'=>"heroku"}



desc "commit and push to all remotes "
task :deploy => [:push, :deploy_heroku]do

	puts "deployment completed."

end


desc "deploy to heroku only"
task :deploy_heroku => [:commit] do

    puts "deploying to heroku"
    system "git push #{deploy_remotes['heroku']} master"
    puts "Github Pages deploy complete"

end

desc "push to all remotes"
task :push =>[:commit]do
    puts "Pushing to remotes"
    remote_repos.each do |key,remote|
    	system "git push #{remote} master"
	end
    puts "Github Pages deploy complete"
end


desc "add and commit"
task :commit, :message do |t,args|
	if args.message
	    message = args.message
	  else
	    message = "Site updated at #{Time.now.utc}"

	system "git add ."
    system "git add -u"
    puts "Commiting #{message}"
    system "git commit -m \"#{message}\""

  end

	
end

desc "discard all local changes unstagged"
task :discard do
	system "git clean -df"
	system "git checkout ."
	
end

task :new_post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(source_dir)
  mkdir_p "#{source_dir}/#{posts_dir}"
  filename = "#{source_dir}/#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "comments: true"
    post.puts "categories: "
    post.puts "---"
  end
end
