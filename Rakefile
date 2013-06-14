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

desc "push to heroku only"
task :push_heroku do

    puts "pushing to heroku"
    system "git push #{deploy_remotes['heroku']} master"
    puts "push complete"

end


desc "deploy to heroku only"
task :deploy_heroku => [:commit] do

    puts "deploying to heroku"
    system "git push #{deploy_remotes['heroku']} master"
    puts "Github Pages deploy complete"

end

desc "push to all remotes"
task :push =>[:commit] do
    puts "Pushing Source code to remote repositories"
    remote_repos.each do |key,remote|
    	puts "Pushing to #{key}"
    	system "git push #{remote} master"
	end
    puts "Remote push complete"
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

#todo: will be improved later by calling rake task
desc "database setup"
task :db_setup do
  system "rake db:reset"
  system "rake db:migrate"
  system "rake db:seed"
end

