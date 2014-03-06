require 'open-uri'
class Robot 


	# @@url = 'http://192.168.0.44:1237/'
	@@url = 'http://127.0.0.1:4567/'
	@@api_key = '4'

	def self.run_command(cmd)
		if [:forward, :backward, :slow_forward, :slow_backward, :left, :right, :run, :attack].include?(cmd)
			Robot.send cmd
		end

	end

	def self.lock
		open(@@url + @@api_key +'/lock').read 
	end

	def self.proximity
		open(@@url + '/proximity').read
		
	end

	def self.forward
		open(@@url + @@api_key + '/forward').read
	end

	def self.backward
		open(@@url + @@api_key + '/backward').read
	end

	def self.slow_forward
		open(@@url + @@api_key + '/slow_forward').read
	end

	def self.slow_backward
		open(@@url + @@api_key + '/slow_backward').read
	end

	def self.left
		open(@@url + @@api_key + '/left').read
	end

	def self.right
		open(@@url + @@api_key + '/right').read
	end

	def self.run
		open(@@url + @@api_key + '/run').read
	end

	def self.attack
		open(@@url + @@api_key + '/attack').read
	end



end