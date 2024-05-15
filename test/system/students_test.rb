require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    check "Attended" if @student.attended
    fill_in "Gender", with: @student.gender
    fill_in "Grade", with: @student.grade
    fill_in "Name", with: @student.name
    fill_in "Teacher", with: @student.teacher_id
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    check "Attended" if @student.attended
    fill_in "Gender", with: @student.gender
    fill_in "Grade", with: @student.grade
    fill_in "Name", with: @student.name
    fill_in "Teacher", with: @student.teacher_id
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
