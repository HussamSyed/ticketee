class ProjectsController < ApplicationController
	
	before_filter :authorize_admin!, :except => [:index, :show]
	before_filter :find_project, :only => [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end
	
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."
			render :action => "new"
		end
	end

	def show
		#the line below is commented out because
		#the before_filter method does its job
		#@project = Project.find(params[:id])
	end

	def edit
		#the line below is commented out because
		#the before_filter method does its job
		#@project = Project.find(params[:id])
	end

	def update
		#the line below is commented out because
		#the before_filter method does its job
		#@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:notice] = "Project has been updated."
			redirect_to @project
		else
			flash[:alert] = "Project has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		#the line below is commented out because the before_filter method does its job
		#@project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = "Project has been deleted."
		redirect_to projects_path
	end

	private
		def find_project
			@project = Project.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The project you were looking " +
							"for could not be found."
			redirect_to projects_path
		end

		def authorize_admin!
			authenticate_user!
			unless current_user.admin?
				flash[:alert] = "You must be an admin to do that."
				redirect_to root_path
			end
		end
end
