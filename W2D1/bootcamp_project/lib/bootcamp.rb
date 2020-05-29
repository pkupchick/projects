class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] } # Hash.new([]) ==> Didn't work-- why?
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @student_capacity > @students.length
        @students << student
        return true
    else
        return false
    end
  end

  def enrolled?(student)
    return true if students.include?(student)
    return false
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length * 1.0
  end

  def add_grade (student, grade)
    if @students.include?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if @grades[student] == [] || !@students.include?(student)
        return nil
    else
        @grades[student].sum / num_grades(student)
    end
  end
end


