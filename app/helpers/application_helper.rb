module ApplicationHelper
	def robot_control_button(text, cmd)
		button_to text, {:controller => "robots", :action => "update", :cmd => cmd}, method: :put 
	end

end
