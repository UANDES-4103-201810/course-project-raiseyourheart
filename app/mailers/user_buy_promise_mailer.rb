class UserBuyPromiseMailer < ApplicationMailer
  default :from => "raiseyourheartchile@gmail.com"

  def promise_confirmation(user_buy_promise)
    @fund = user_buy_promise
    @promise = Promise.find(@fund.promise_id)
    @user = User.find(user_buy_promise.user_id)
    @project = ProjectDatum.current_project(@promise.project_id)
    mail(to: @user.email, subject: "Buy Promise Confirmation")
  end
end
