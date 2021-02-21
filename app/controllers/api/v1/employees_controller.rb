class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :validate_role, only: [:create, :update]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    if manager?
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

  def current
    @member = current_user
    @member = @member.decorate
    respond_to do |format|
      format.json { render :show }
    end
  end

  def create    
    if manager?
      begin        
        ActiveRecord::Base.transaction do
          @member = User.invite!(member_params)
          @company.company_users.create!(user: @member)
        end        
      rescue ActiveRecord::RecordInvalid => errors
        respond_to do |format|          
          format.json { render json: @member.errors, status: :unprocessable_entity }          
        end
      else 
        respond_to do |format|
          format.json { render :show, status: :created, location: api_v1_employee_path(@member) }
        end         
      end        
    else
      handle_unauthorized
    end
  end

  def update
    if @member.managed_by?(current_user)
      respond_to do |format|
        if @member.update(member_params)
          format.json { render :show, status: :ok, location: api_v1_employee_path(@member) }
        else
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def destroy
    if @member.managed_by?(current_user)
      @member.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  # lock employee
  # get_by_role
  # upload_employees

  private
    def set_company
      @company = current_user.company_user.company.decorate
    end

    def set_member
      @member = User.find(params[:id]).decorate    
    end

    def validate_role
      role = params.require(:member)[:role]
      unless ['manager', 'employee'].include? role
        render :json => {:error => "Invalid Role: #{role}"}, :status => :unprocessable_entity
      end
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
      params.require(:member).permit(:email, :first_name, :last_name, :role)            
    end
end
