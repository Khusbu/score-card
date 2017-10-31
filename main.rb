require_relative 'student'
require_relative 'class_vii'

ARGUMENT_ERR_MSG = "Wrong input format. Please try again!"

def get_mark(arg)
  fields = arg.split('-')
  if fields.length != 2
    raise ArgumentError, ARGUMENT_ERR_MSG
  end
  if !(fields[1] !~ /\D/)
    raise ArgumentError, ARGUMENT_ERR_MSG
  end
  fields[1].to_i
end

def create_student(input)
  begin
    fields = input.split(',')
    if fields.length != 5
      raise ArgumentError, ARGUMENT_ERR_MSG
    end
    id = fields[0]
    s1 = get_mark(fields[1])
    s2 = get_mark(fields[2])
    s3 = get_mark(fields[3])
    s4 = get_mark(fields[4])
    Student.new(id, s1, s2, s3, s4)
  rescue Exception => ex
    puts "#{ex.message}"
  end
end

def create_class
  class_obj = ClassVII.new
  loop do
    record = gets.chomp
    break if record.empty?
    s = create_student(record)
    class_obj.register(s)
  end
  class_obj
end

def display_score_card(class_obj)
  if class_obj.students.length == 0
    return
  end
  print "\n\nScore card\n\n"
  print " ID | Subject 1 | Subject 2 | Subject 3 | Subject 4 | Grand-Total | Grade | Average-Compare |\n"
  class_obj.students.each do |s|
    printf(" %02d |     %02d    |     %02d    |     %02d    |     %02d    |     %03d     |   %s   |      %s      |\n", s.id, s.subject1, s.subject2, s.subject3, s.subject4, s.grand_total, s.grade, s.category)
  end
  print "----------------------------------------------------------------------------------------------\n\n\n"
end

def display_report(class_obj)
  print "----------------------------------------------------------------------------------------------\n"
  print "Grade report\n"
  print "\nNumber of students in A Grade :: ", class_obj.count_grade_A
  print "\nNumber of students in B Grade :: ", class_obj.count_grade_B
  print "\nNumber of students in C Grade :: ", class_obj.count_grade_C
  print "\nNumber of students above their grade average :: ", class_obj.calculate_above_students
  print "\nNumber of students below their grade average :: ", class_obj.calculate_below_students
  print "\n----------------------------------------------------------------------------------------------\n"
end

class_obj = create_class
if !class_obj.nil?
  class_obj.find_category_of_students
  display_score_card(class_obj)
  display_report(class_obj)
end
