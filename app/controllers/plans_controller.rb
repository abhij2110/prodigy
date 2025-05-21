class PlansController < ApplicationController
  before_action :authenticate_user!

  def show
    day = params[:id].to_i
    plans = DailyPlan.includes(:activity).where(day: day)

    render json: {
      day: day,
      activities: plans.map do |plan|
        {
          id: plan.activity.id,
          title: plan.activity.title,
          completed: UserActivityCompletion.exists?(
            user: current_user, daily_plan: plan
          )
        }
      end
    }
  end

  def complete_activity
    day = params[:day].to_i
    activity_id = params[:activity_id].to_i

    daily_plan = DailyPlan.find_by(day: day, activity_id: activity_id)
    return render json: { error: 'Activity not found' }, status: :not_found unless daily_plan

    completion = UserActivityCompletion.find_or_create_by!(
      user: current_user,
      daily_plan: daily_plan
    )
    completion.update(completed_at: Time.current)

    render json: { success: true }
  end
end
