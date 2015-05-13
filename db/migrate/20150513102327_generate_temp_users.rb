class GenerateTempUsers < ActiveRecord::Migration
  def change
    100.times do |x|
      puts "Create User #{x.to_s}"
      User.create(first_name: 'Name '+x.to_s, last_name: x.to_s, email: 'temp_'+x.to_s+'@appyhotel.com', phone: '0812345679')
    end
  end
end
