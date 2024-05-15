json.extract! student, :id, :name, :gender, :grade, :attended, :teacher_id, :created_at, :updated_at
json.url student_url(student, format: :json)
