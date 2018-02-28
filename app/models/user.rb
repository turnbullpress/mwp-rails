class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create do
    Metrics.counter(:users_created_counter, "Users created counter").increment
  end

  def set_default_role
    self.role ||= :user
  end

  def password_required?
    false
  end

  def send_confirmation_notification?
    false
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
