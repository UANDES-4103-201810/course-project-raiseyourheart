class CreateUserFundProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fund_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.numeric :amount

      t.timestamps
    end
  end
end
