class LayoutsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_staff!
	
	def application
		@projects = Project.all
		@updates = Update.all
	end
end
