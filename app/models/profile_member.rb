# frozen_string_literal: true

class ProfileMember < ActiveRecord::Base
  belongs_to :member
end
