class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self

  end

  def self.create_from_collection(students_array)
    students_array.each {|s| Student.new(s)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|

      self.instance_variable_set("@#{key}","#{value}")
      # self.class_eval("def #{key}=(#{value}); @#{key}=#{value}; end")
    end
    self
  end

  def self.all
    @@all
  end

end
