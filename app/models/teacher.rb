class Teacher < ApplicationRecord
has_many :students, dependent: :destroy, inverse_of: :teacher
end
