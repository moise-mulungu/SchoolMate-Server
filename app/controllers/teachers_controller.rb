class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]

  # GET /teachers
  def index
    @teachers = Teacher.all
    render json: @teachers
  end

  # GET /teachers/:id
  def show
    render json: @teacher
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: @teacher, status: :created
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/:id
  def update
    if @teacher.update(teacher_params)
      render json: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/:id
  def destroy
    @teacher.destroy
    head :no_content
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :subject)
  end
end
