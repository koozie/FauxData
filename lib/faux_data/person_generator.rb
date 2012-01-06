


require File.join(File.dirname(__FILE__),'personal_name_generator')
require File.join(File.dirname(__FILE__),'address_generator')



module FauxData
class PersonGenerator
    def initialize
        @name = PersonalNameGenerator.new
        @address = AddressGenerator.new
    end

    def person
        sex = pick_sex()
        address = @address.address
        person = address.merge({
                :sex => sex,
                :surname => @name.surname,
                :first_name => sex == :male ? @name.given_name_male : @name.given_name_female,
                :middle_name => sex == :male ? @name.given_name_male : @name.given_name_female,
        })
        return person
    end


    private

    def pick_sex
        return [:male, :female].choice
    end
end
end


