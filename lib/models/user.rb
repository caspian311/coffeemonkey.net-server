class User < ActiveRecord::Base
  has_many :login_sessions

  def last_login
    return nil if login_sessions.empty?
    login_sessions.last.formatted_created_at
  end
end
