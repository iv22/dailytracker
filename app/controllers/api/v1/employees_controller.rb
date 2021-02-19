class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    if current_user.role == 'manager'      
      @members = @company.members
    else
      handle_unauthorized
    end
  end

  def show
    if @member.managed_by?(current_user)
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  def create    
    if current_user.role == 'manager'
      begin
        user = nil
        ActiveRecord::Base.transaction do
          user = User.create!(member_params)
          @company.company_users.create!(user: user)
        end
      rescue ActiveRecord::RecordInvalid => errors
        respond_to do |format|          
          format.json { render json: @member.errors, status: :unprocessable_entity }          
        end
      else 
        respond_to do |format|          
          format.json { render :show, status: :created, location: api_v1_employee_path(user) }          
        end         
      end        
    else
      handle_unauthorized
    end
  end

  # lock employee
  # change_role
  # get_by_role
  # upload_employees

  private
    def set_company
      @company = current_user.company_user.company.decorate
    end

    def set_member
      @member = User.find(params[:id]).decorate    
    end

    def handle_unauthorized
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end  

    def handle_no_content
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end

    def member_params
      params.require(:member).permit(:email, :password, :first_name, :last_name, :role)
    end
end
