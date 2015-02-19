require 'httparty'

module OutcomesApi

  def self.search(cohorts)
    url = "http://104.131.73.180/api/v1/cohorts"
    response = HTTParty.get(url)
    JSON.parse(response.body)["Search"]
  end

  def self.info(cohort_id)
    url = "http://104.131.73.180/api/v1/cohorts/#{cohort_id}"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

  def self.student(students)
    url = "http://104.131.73.180/api/v1/cohorts/#{cohort_id}/students"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
binding.pry
end
