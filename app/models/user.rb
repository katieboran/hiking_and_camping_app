class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :hiking_reviews,
             :dependent => :destroy

  has_many   :camping_reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
