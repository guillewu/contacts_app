class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :email, :name, :presence => true
  validates :email, :uniqueness => true

  has_many :contact_shares
  has_many :contacts

  has_many :contacts_shared_to_me,
            :through => :contact_shares,
            :source => :contact
end
