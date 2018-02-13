require 'sinatra'
require 'sinatra/namespace'

def get_company_percentage(percentage, company)
  new_company = company / 100.to_f
  new_percentaje = (percentage / 2.to_f) / 100.to_f
  (new_percentaje * new_company) / 100.to_f
end

def get_chief_percentage(percentage, chief)
  new_chief = chief / 100.to_f
  new_percentaje = (percentage / 2.to_f) / 100.to_f
  (new_percentaje * new_chief) / 100.to_f
end

def calculate_bonus(percentage, salary, chief, company)
  chief_fee = get_chief_percentage(percentage, chief) * salary
  company_fee = get_company_percentage(percentage, company) * salary

  bonus = ((chief_fee + company_fee) * 100.to_f).round(2)

  status 200
  "Bonus to receive: #{bonus}".to_json
end

get '/' do
  'Welcome to Check My Bonus!'.to_json
end

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/bonus' do
    valid = true
    parameters = %w[percentage_salary salary
                    percentage_chief percentage_company]
    parameters.each { |p| valid &&= params.include?(p) }

    salary = params[:salary].to_f
    chief = params[:percentage_chief].to_f
    company = params[:percentage_company].to_f
    percentage = params[:percentage_salary].to_f

    return calculate_bonus(percentage, salary, chief, company) if valid

    status 422
    'Missing parameters'.to_json
  end
end
