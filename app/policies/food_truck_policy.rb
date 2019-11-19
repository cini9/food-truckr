class FoodTruckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.food_truck_owner
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end
end
