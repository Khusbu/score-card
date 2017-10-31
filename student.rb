class Student
  attr_accessor :id, :subject1, :subject2, :subject3, :subject4, :grand_total, :grade, :category

  def initialize(id, s1, s2, s3, s4)
    @id = id
    @subject1 = s1
    @subject2 = s2
    @subject3 = s3
    @subject4 = s4
    @grand_total = calculate_grand_total
    @grade = calculate_grade
    @category = ''
  end

  def calculate_grand_total
    @grand_total = @subject1 + @subject2 + @subject3 + @subject4
  end

  def calculate_grade
    if @grand_total >= 340
      @grade = 'A'
    elsif @grand_total >= 300 and @grand_total < 340
      @grade = 'B'
    else
      @grade = 'C'
    end
  end
end
