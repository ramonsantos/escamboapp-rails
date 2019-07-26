# frozen_string_literal: true

class Member < ActiveRecord::Base
  has_many :ads
  has_one :profile_member
  accepts_nested_attributes_for :profile_member

  validate :nested_attributes

  ratyrate_rater

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    errors.add(:base, 'É necessário preencher os campos Primeiro e Segundo nome.') if nested_attributes_blank?
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.second_name.blank?
  end
end
