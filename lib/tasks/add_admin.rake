# -*- encoding : utf-8 -*-
desc "创建初始管理员"
require "csv"
task :create_admin => :environment do
  CSV.foreach("#{Rails.root}/lib/data/init_admin.csv") do |row|
    if Admin.find_by_username(row[1].strip).nil?
  	  flag = Admin.create(:email => row[0].strip, :username => row[1].strip, :password => row[2].strip, :password_confirmation => row[2].strip)
        if flag == 1
          puts "Create admin :name => #{row[1].strip}"
        else
          puts "Fails to Create admin :name => #{row[1].strip}"
        end
    else
      puts "Alread exits admin :name => #{row[1].strip}"
    end
  end
end
