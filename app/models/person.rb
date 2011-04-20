class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :likes
  has_many :videos

  # validates_uniqueness_of :name
  #  validates_uniqueness_of :email
  #  validates_presence_of :name
  #  validates_presence_of :email
  # validates :name, :presence => true,
  #                    :uniqueness => true
  validates :email, :presence => true,
                    :uniqueness => true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :encrypted_password, :password_confirmation, :remember_me
  ajaxful_rater
  def increase_points
      self.points += 5
  end

end

# == Schema Information
#
# Table name: people
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#  points               :integer
#  review_id            :integer
#

