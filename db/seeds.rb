# db/seeds.rb
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create Admins
admin1 = Admin.find_or_create_by!(email: 'admin1@example.com') do |admin|
  admin.name = 'Admin One'
  admin.password = 'password'
  admin.institution_name = 'Example Institution'
  admin.category = 'Primary School'
end

# Create Teachers
teacher1 = Teacher.find_or_create_by!(email: 'teacher1@example.com') do |teacher|
  teacher.name = 'Teacher One'
  teacher.password = 'password'
  teacher.subject = 'Biology'
end

teacher2 = Teacher.find_or_create_by!(email: 'teacher2@example.com') do |teacher|
  teacher.name = 'Teacher Two'
  teacher.password = 'password'
  teacher.subject = 'Mathematics'
end

# Create Students
student1 = Student.find_or_create_by!(email: 'student1@example.com') do |student|
  student.name = 'Student One'
  student.password = 'password'
end

student2 = Student.find_or_create_by!(email: 'student2@example.com') do |student|
  student.name = 'Student Two'
  student.password = 'password'
end

# Create Courses
course1 = Course.find_or_create_by!(name: 'Biology 101') do |course|
  course.teacher = teacher1
  course.number_of_students = 30
end

course2 = Course.find_or_create_by!(name: 'Math 101') do |course|
  course.teacher = teacher2
  course.number_of_students = 25
end

# Create Fees
fee1 = Fee.find_or_create_by!(student: student1, amount: 1000.00, due_date: Date.today + 30) do |fee|
  fee.total_paid = 0.0
  fee.paid = false
end

fee2 = Fee.find_or_create_by!(student: student2, amount: 1200.00, due_date: Date.today + 30) do |fee|
  fee.total_paid = 0.0
  fee.paid = false
end

# Create Payments
Payment.find_or_create_by!(fee: fee1, amount: 200.00)
Payment.find_or_create_by!(fee: fee2, amount: 300.00)
