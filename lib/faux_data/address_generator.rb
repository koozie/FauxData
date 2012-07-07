

module FauxData
class AddressGenerator

  def initialize 
    @city_state_zipcodes = Array.new
    @street_names = Array.new
    @filename_city_state_zip = File.join(File.dirname(__FILE__),'data','us','city_state_zipcode.txt')
    @filename_street_names = File.join(File.dirname(__FILE__),'data','us','street_names_top_1500.txt')
  end

  def address
    load_csz_file if @city_state_zipcodes.size < 1
    load_street_file if @street_names.size < 1
    street = "#{rand(9899) + 100} #{@street_names.choice[:street]}"
    return @city_state_zipcodes.choice.merge({:street => street.upcase.strip})
  end


  private
  def load_csz_file
    col_headers = %w[zip city state].map {|e| e.downcase.to_sym}
    if File.readable?(@filename_city_state_zip)
      File.open(@filename_city_state_zip,'r') do |file|
        file.each do |line|
          next if $. == 1 #skip header line
          rec = Hash[*col_headers.zip(line.chomp.split("\t")).flatten]
          @city_state_zipcodes << rec
        end
      end
    end
  end
  def load_street_file
    col_headers = %w[street occurence].map {|e| e.downcase.to_sym}
    if File.readable?(@filename_street_names)
      File.open(@filename_street_names,'r') do |file|
        file.each do |line|
          #next if $. == 1 #skip header line
          rec = Hash[*col_headers.zip(line.chomp.split("\t")).flatten]
          @street_names << rec
        end
      end
    end
  end



end
end
