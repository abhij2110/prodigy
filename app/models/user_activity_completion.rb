class UserActivityCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :daily_plan
end
