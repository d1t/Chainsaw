class Users::InvitationsController < Devise::InvitationsController

	def after_accept_path_for(resource)
		root_path
	end
end