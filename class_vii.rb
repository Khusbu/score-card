require_relative 'student'

class ClassVII
  attr_accessor :students

  def initialize
    @students = []
  end

  def register(student)
    @students << student unless student.nil?
  end

  def count_grade_A
    count_grade('A')
  end

  def count_grade_B
    count_grade('B')
  end

  def count_grade_C
    count_grade('C')
  end

  def calculate_below_students
    calculate_students_in_category("BELOW")
  end

  def calculate_above_students
    calculate_students_in_category("ABOVE")
  end

  def calculate_avg_for_grade_A
    calculate_grade_avg('A')
  end

  def calculate_avg_for_grade_B
    calculate_grade_avg('B')
  end

  def calculate_avg_for_grade_C
    calculate_grade_avg('C')
  end

  def find_category_of_students
    avg_A = calculate_avg_for_grade_A
    avg_B = calculate_avg_for_grade_B
    avg_C = calculate_avg_for_grade_C
    @students.each do |s|
      case s.grade
      when 'A' then s.category = compare_average(s.grand_total, avg_A)
      when 'B' then s.category = compare_average(s.grand_total, avg_B)
      when 'C' then s.category = compare_average(s.grand_total, avg_C)
      end
    end
  end

  private
  def calculate_grade_avg(grade)
    sum = 0.0
    no_of_students = 0
    @students.each do |s|
      if s.grade == grade
        sum += s.grand_total
        no_of_students += 1
      end
    end
    if no_of_students > 0
      return sum / no_of_students
    end
    0
  end

  def count_grade(grade)
    no_of_students = 0
    @students.each do |s|
      if s.grade == grade
        no_of_students += 1
      end
    end
    no_of_students
  end

  def compare_average(total, grade_average)
    if total > grade_average
      return 'ABOVE'
    end
    'BELOW'
  end

  def calculate_students_in_category(category)
    no_of_students = 0
    @students.each do |s|
      if s.category == category
        no_of_students += 1
      end
    end
    no_of_students
  end
end
