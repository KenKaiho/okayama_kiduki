class Awareness < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  belongs_to :user,class_name: "User",foreign_key: "users_id"
end
