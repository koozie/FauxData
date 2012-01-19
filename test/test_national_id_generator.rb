
require 'rubygems'
require 'test/unit'
require 'pp'


require File.join(File.dirname(__FILE__),'..','lib','faux_data')

class Test_SSN_Creation < Test::Unit::TestCase
  
    def setup
    end
    def teardown
    end

    def test_ssn_creation
        nid = FauxData::NationalIdGenerator.new(:country_code => 'us')
        id = nid.national_id
        assert_equal(11,id.to_s.size,"SSN lenth should equal 11 with two (2) hypens and nine (9) digits: ssn [#{id}]")
        assert_equal(9,id.to_s.delete("-").size,"SSN lenth should have length of 9 chars")
        assert(id.to_s.delete("-") =~ /^\d{9}$/ ,"SSN lenth should equal nine (9) digits")
    end

    def test_ssn_tracking
        nid = FauxData::NationalIdGenerator.new(:country_code => 'us')
        ids = Array.new
        (1..100).each do |i|
            id = nid.national_id
            ids << id
        end
        assert_equal(ids.size, nid.national_ids.size, "Both arrays should contain 100 elements ")
        assert(ids == nid.national_ids, "Both arrays should contain the same 100 elements ")
    end
end
