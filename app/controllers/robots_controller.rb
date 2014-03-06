class RobotsController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :try_to_lock,  only: [ :update ] 

def update

 if params[:cmd]
        params[:cmd].split(" ").each do |command|
          Robot.run_command(command.to_sym)
        end
  else
  Robot.run_command(params[:cmd])
end
  redirect_to :back
end

def show 
  @proximity = Robot.proximity 
  
end
# def lock
#   Robot.lock
#   redirect_to :back
# end

# def forward
#   Robot.forward
#   redirect_to :back
# end

# def backward
#   Robot.backward
#   redirect_to :back
# end

# def slow_forward
#   Robot.slow_forward
#   redirect_to :back
# end

# def slow_backward
#   Robot.slow_backward
#   redirect_to :back
# end

# def left
#   Robot.left
#   redirect_to :back
# end

# def right
#   Robot.right
#   redirect_to :back  
# end

# def run
#   Robot.run
#   redirect_to :back
# end

# def attack
#   Robot.attack
#   redirect_to :back
# end

# def proximity
#   @proximity = Robot.proximity
#   flash[:notice] = @proximity
#   redirect_to :back
  
# end

  private

  def try_to_lock 
    if Robot.lock
    else
      flash[:notice] = 'Try again in a few seconds'
    end
  end

 

end
  
