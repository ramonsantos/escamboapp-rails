# frozen_string_literal: true

class Member < ActiveRecord::Base
  has_many :ads
  has_one :profile_member

  ratyrate_rater

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
