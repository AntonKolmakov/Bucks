class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.try(:last) || record
  end

  def index?
    user&.is_admin?
  end

  alias create? index?
end