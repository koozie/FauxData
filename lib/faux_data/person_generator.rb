

require 'date'
require 'faux_data/personal_name_generator'
require 'faux_data/address_generator'
require 'faux_data/national_id_generator'



module FauxData
class PersonGenerator
  def initialize
    @name = PersonalNameGenerator.new
    @address = AddressGenerator.new
    @national_id = NationalIdGenerator.new(:county_code => 'us')
    @max_age_in_days = (365.2524 * 100).to_i
  end

  def person
    sex = pick_sex()
    address = @address.address
    person = address.merge({
        :sex => sex,
        :surname => @name.surname,
        :first_name => sex == :male ? @name.given_name_male : @name.given_name_female,
        :middle_name => sex == :male ? @name.given_name_male : @name.given_name_female,
        :ssn => @national_id.national_id,
        :date_of_birth => Date.today - (rand(@max_age_in_days))
    })
    person[:email] = "#{person[:first_name].strip.downcase}.#{person[:surname].strip.downcase}@" + pick_email_domain()
    return person
  end


  private

  def pick_sex
    return [:male, :female].choice
  end

  def pick_email_domain
    return %w[ example.com example.net example.org].choice
  end
end
end


