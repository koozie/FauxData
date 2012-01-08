

require 'rubygems'
require 'csv'
require File.join(File.dirname(__FILE__),'..','lib','faux_data','person_generator')


col_headers =  %w[ssn surname first_name middle_name street city state zip date_of_birth sex email].map {|i| i.downcase.to_sym}
pg = FauxData::PersonGenerator.new

puts CSV.generate_line(col_headers)
(1..100).each do |i|
    person = pg.person
    puts CSV.generate_line(person.values_at(* col_headers))
end

