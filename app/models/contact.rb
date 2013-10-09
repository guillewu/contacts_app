class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :user_id, :favorite

  validates :email, :name, :user_id, :presence => :true

  belongs_to :user
  has_many :contact_shares

  has_many :shared_to,
            :through => :contact_shares,
            :source => :user

  def self.contacts_for_user_id(user_id)
    contacts = Contact.joins(
      "LEFT OUTER JOIN contact_shares ON
      contacts.id = contact_shares.contact_id")
      .where("contacts.user_id = #{user_id}
            OR contact_shares.user_id = #{user_id}")
  end
end
