desc "Create first admin account"
task :create_admin => :environment do
  Admin.create(:email => 'admin@networking.io', :username => 'admin', :password => '12345678', :password_confirmation => '12345678')
end
