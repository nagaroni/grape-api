class ClassroomCourseCreator
  attr_reader :classroom_id, :course_ids

  def initialize(classroom_id, course_ids)
    @classroom_id = classroom_id
    @course_ids   = course_ids
  end

  def create
    return classroom unless new_course_ids?

    classroom_courses.create(classroom_course_params)
    classroom
  end

  private

  def classroom_course_params
    new_course_ids.map do |course_id|
      { course_id: course_id }
    end 
  end

  def new_course_ids?
    !new_course_ids.blank?
  end

  def new_course_ids
    @new_course_ids ||= course_ids - classroom.course_ids
  end

  def classroom_courses
    classroom.classroom_courses
  end

  def classroom
    @classroom ||= Classroom.find(classroom_id)
  end
end
