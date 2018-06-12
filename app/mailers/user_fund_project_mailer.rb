class UserFundProjectMailer < ApplicationMailer
  default :from => "raiseyourheartchile@gmail.com"

  def fund_confirmation(user_fund_project)
    @fund = user_fund_project
    @user = User.find(user_fund_project.user_id)
    @project = ProjectDatum.current_project(@fund.project_id)
    mail(to: @user.email, subject: "Fund Confirmation")
  end
end
