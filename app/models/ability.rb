class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(user)
    @user = user
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    can :read, User
    if user.admin?
      can :index, Answer
      can :manage, Result
      can :manage, Problem
    else
      can :manage, City do |city|
        city.user == user
      end
      can :create, Answer do |answer|
        basic_write_permissions(answer)
      end
      can :update, Answer do |answer|
        basic_write_permissions(answer) &&
        (answer.result.nil? || !answer.result.valid_answer)
      end
    end

    def basic_write_permissions(object)
      {
        Answer => lambda { |answer| answer.city.user == user && answer.problem == Problem.current }
      }[object.class].call(object)
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
