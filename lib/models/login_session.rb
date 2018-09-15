class LoginSession < ActiveRecord::Base
  belongs_to :user

  def formatted_created_at
    created_at.strftime("%m/%d/%Y %I:%M:%p")
  end
end
