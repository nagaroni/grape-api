class AssessmentRepresenter < Grape::Roar::Decorator
  include Roar::JSON
  include Roar::JSON::HAL
  include Roar::Hypermedia

  include Grape::Roar::Extensions::Relations

  def self.polymorphic_id
    lambda do |*args|
      "#{self.assessmentable_type.downcase}_id" if self
    end
  end

  def self.polymorphic_name
    lambda do |*args|
      self.assessmentable_type.downcase if self
    end
  end

  property :id
  property :assessmentable_id, as: polymorphic_id
  property :average_grade

  link_self

  relation :belongs_to, :assessmentable, as: polymorphic_name, decorator: CourseRepresenter, embbed: false
  
  private

  def request(opts)
    Grape::Request.new(opts[:env])
  end

  def polymorphic_name
    represented.assessmentable_type.downcase.pluralize
  end
end
