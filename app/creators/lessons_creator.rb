class LessonsCreator
  attr_reader :course_id, :lesson_params

  def initialize(course_id, lesson_params)
    @course_id     = course_id
    @lesson_params = lesson_params
  end

  def create
    course.lessons.create(lesson_params)
  end

  private

  def course
    @course ||= Course.find(course_id)
  end
end
