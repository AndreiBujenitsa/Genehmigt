class UserProcess < ActiveRecord::Base
  attr_accessor :recipients
  validates_presence_of :title, :message, :owner, :recipients
  
  has_many :process_members, :dependent => :delete_all
  
  after_create :add_members
  
  def add_members
    hash = recipients
    hash.each_value do |val|
      member = ProcessMembers.new({:role_id=>val["role"], :email=>val["email"], :process_id=>id })
      member.save
    end
  end
end
