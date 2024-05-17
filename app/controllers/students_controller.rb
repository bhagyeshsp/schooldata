class StudentsController < ApplicationController
  before_action :set_teacher
  before_action :set_student, only: [:edit, :update, :show, :destroy]

  # GET /students or /students.json
  def index
    @student = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.all
  end

  # GET /students/new
  #Modified to add teacher's id
  def new
    @student = @teacher.students.build
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  #Modified to add teacher's id
  def create
    @student = @teacher.students.build(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to teacher_url(@teacher), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @teacher, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_student_url(@teacher), notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :gender, :grade, :attended, :teacher_id)
  end

  # Created to find the teacher's id and pass it through the before_action event
  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end
end
