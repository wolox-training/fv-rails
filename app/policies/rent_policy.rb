class RentPolicy
  attr_reader :user, :rent

  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  def show?
    user.id == rent.user_id
  end
end
