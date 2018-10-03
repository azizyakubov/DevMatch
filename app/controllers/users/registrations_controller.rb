class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new

  #Extend default Devise gem behavior for users signing up with Pro account
  # (plan.id == 2) and saves with a special Stripe subscription function.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end

  private
    def select_plan
      unless (params[:plam]== '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to signup"
        redirect_to root_url
      end
    end
end
