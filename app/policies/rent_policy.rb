class RentPolicy
  attr_reader :user, :rent

  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  def create?
    user.id == rent.user_id
  end

  def index?
    user.id == rent.user.id
  end
end