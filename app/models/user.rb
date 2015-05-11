class User < ActiveRecord::Base
  validates :phone,  :presence => {:message => 'hello world, bad operation!'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 10 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
