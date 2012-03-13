
require 'test/unit'
require 'pp'
require 'date'
require 'faux_data'


class Test_Person_Creation < Test::Unit::TestCase
  
    def setup
    end
    def teardown
    end

    def test_person_creation
        required_keys = %w[ssn surname first_name middle_name street city state zip date_of_birth].map {|i| i.downcase.to_sym}
        pg = FauxData::PersonGenerator.new
        person = pg.person
        assert(person.is_a?(Hash), "Person should be a hash")
        required_keys.each do |k|
            assert(person.key?(k), "Should have this key: #{k}")
        end
        assert(person[:date_of_birth].is_a?(Date), "Date of Birth should be a date object")

    end

    def test_ssn_tracking
        pg = FauxData::PersonGenerator.new
        persons = Array.new
        (1..100).each do |i|
            person = pg.person
            persons << person
        end
        assert_equal(100 , persons.size , "Both arrays should contain 100 elements ")
    end
end
