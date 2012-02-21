class UserProcess < ActiveRecord::Base

  validates_presence_of :title, :message, :owner
  
  has_many :process_members, :dependent => :delete_all
  
  def add_members(hash)
    hash.each_value do |val|
      member = ProcessMembers.new({:role_id=>val["role"], :email=>val["email"], :process_id=>id })
      member.save
    end
  end
end
