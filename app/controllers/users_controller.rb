class UsersController < ApplicationController
  before_action :require_signin, :except => [:show, :new , :create]
  before_action :require_correct_user, :except => [:show, :new , :create, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    # respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
        redirect_to @user, notice: "Usuario creado con éxito."
      else
        # format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        redirect_to users_path, alert: "No fue posible crear el usuario."
      end
    # end
  end

  def update
    @user = User.find(params[:id])
    # respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user }
        redirect_to @user, notice: "Usuario actualizado con exito."
      else
        # format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        redirect_to users_path @user, alert: "No fue posible procesar la solicitud."
      end
    # end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :first, :last, :role, :phone, :description, :avatar_file_name, :birthdate, :gender)
    end

    def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url, alert: "Unauthorized access!" unless current_user?(@user) || current_user_admin?
    end
end
