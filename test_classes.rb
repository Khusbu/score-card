require_relative 'class_vii'
require_relative 'student'
require 'test/unit'

class TestClass < Test::Unit::TestCase

  def test_student
    assert_equal(260, Student.new(1, 50, 60, 70, 80).calculate_grand_total)
    assert_equal('C', Student.new(1, 50, 60, 70, 80).calculate_grade)
  end

  def test_class_vii
    c = ClassVII.new
    c.register(Student.new(1, 50, 60, 70, 80)) # grand_total: 260
    c.register(Student.new(2, 60, 70, 80, 90)) # 300
    c.register(Student.new(3, 65, 75, 85, 95)) # 320
    c.register(Student.new(4, 95, 80, 90, 90)) # 355
    c.register(Student.new(5, 70, 69, 89, 80)) # 308
    c.register(Student.new(6, 59, 90, 100, 80)) # 329
    c.register(Student.new(7, 55, 67, 78, 86)) # 286
    c.register(Student.new(8, 49, 50, 90, 100)) # 289
    c.register(Student.new(9, 98, 99, 79, 88)) # 364
    c.register(Student.new(10, 58, 61, 71, 81)) # 271
    c.find_category_of_students

    assert_equal(10, c.students.length)

    assert_equal(2, c.count_grade_A)
    assert_equal(4, c.count_grade_B)
    assert_equal(4, c.count_grade_C)

    assert_equal(359.5, c.calculate_avg_for_grade_A)
    assert_equal(314.25, c.calculate_avg_for_grade_B)
    assert_equal(276.5, c.calculate_avg_for_grade_C)

    assert_equal("BELOW", c.students[0].category)
    assert_equal("ABOVE", c.students[8].category)

    assert_equal(5, c.calculate_below_students)
    assert_equal(5, c.calculate_above_students)

  end
end
