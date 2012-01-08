

require File.join(File.dirname(__FILE__),'personal_name_generator')
require File.join(File.dirname(__FILE__),'address_generator')
require File.join(File.dirname(__FILE__),'national_id_generator')
require 'date'



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
        return person
    end


    private

    def pick_sex
        return [:male, :female].choice
    end
end
end


