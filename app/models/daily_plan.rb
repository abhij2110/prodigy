class DailyPlan < ApplicationRecord
  belongs_to :program
  belongs_to :activity
end
