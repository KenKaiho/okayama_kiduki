class Comment < ActiveRecord::Base
  belongs_to :awareness
  belongs_to :user,class_name: "User",foreign_key: "users_id"
end
