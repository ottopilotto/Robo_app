class RobotsController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :try_to_lock,  only: [ :update ] 
  rescue_from SystemCallError, :with => :server_not_found

def update

 
      if current_user.has_credits?
        if params[:cmd]
          params[:cmd].split(" ").each do |command|
          Robot.run_command(command.to_sym)
          end
        else
          Robot.run_command(params[:cmd])
        end
          current_user.payment
      else
          flash[:notice] = 'Buy more credits!'
        
      end
  redirect_to :back

#   if params[:cmd]
#         params[:cmd].split(" ").each do |command|
#           Robot.run_command(command.to_sym)
#         end
#   else
#         Robot.run_command(params[:cmd])
#   end
#   redirect_to :back
 end

def show 
  @proximity = Robot.proximity 
end


  private

  def try_to_lock 
    if Robot.lock
    else
      flash[:notice] = 'Try again in a few seconds'
    end
  end

  def server_not_found
    render 'error'
  end
    
  

end
 
