namespace :db do
    desc "Run migrations on remote server"
    task :remote_migrate => :environment do
      run_cmd = "rake db:migrate RAILS_ENV=production"
      system(run_cmd)
    end
  end
  