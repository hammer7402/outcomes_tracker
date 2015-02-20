module DissemblyApiHelper
  BASE_URI = 'http://104.131.73.180/api'

  def self.set_version(version=1)
    @@version = "/v#{version}"
  end
  set_version 1

  def self.root_path
    BASE_URI + @@version
  end

  def self.get(resource)
    HTTParty.get(root_path + "/#{resource}")[resource.split('/').last]
  end

  def self.get_resource(name, hash)
    resources = get(name).map do |resource|
      symbolify resource
    end
    hash ? hashify(resources) : resources
  end

  # RESOURCES

  def self.cohorts(hash=false)
    get_resource "cohorts", hash
  end

  def self.courses(hash=false)
    get_resource "courses", hash
  end

  def self.students(hash=false)
    get_resource "students", hash
  end

  # NESTED

  def self.students_in_cohort(cohort_id)
    get_resource "cohorts/#{cohort_id}/students", false
  end

  private 

  def self.hashify(array)
    hash = {}
    array.each {|item| hash[item[:id]] = item}
    hash
  end

  def self.symbolify(hash)
    hash.keys.each do |key|
      value = hash[key]
      hash[key.to_sym] = value
      hash.delete(key)

      symbolify value if value.is_a? Hash
    end
    hash
  end
end
