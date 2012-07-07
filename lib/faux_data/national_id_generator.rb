

module FauxData
class NationalIdGenerator

  
  def initialize(opts = {})
    options = {
      :country_code => 'us'
    }.merge(opts)
    @country_code = options[:country_code]
    @@consumed_national_ids = Array.new
  end


  def national_id
    id = ''
    while (not valid_national_id_us?(id)) 
      id = generate_national_id_us if @country_code == 'us'
      #pp id
    end
    @@consumed_national_ids << id
    return id
  end
  def national_ids
    ids = Array.new
    ids.replace @@consumed_national_ids
    return ids
  end


  private
  def generate_national_id_us
    ssn = "#{rand(1000).to_s.rjust(3,'0')}-#{rand(100).to_s.rjust(2,'0')}-#{rand(10000).to_s.rjust(4,'0')}"
    return ssn
  end

  
  # Test to see if valid SSN using IRS rules on SSN
  #
  # SSN can be broken down into Area, Group, and Serial Number as AAA-GG-SSSS
  #
  # Area Numbers: excluding area numbers 000, 666 and 900-999.
  # Group Numbers: SSN randomization will not assign group number 00 
  # Serial NUmbers: SSN randomization will not assign serial number 0000. 
  # SSNs containing group number 00 or serial number 0000 will continue to be invalid.
  #
  def valid_national_id_us?(ssn)
    return false if @@consumed_national_ids.include?(ssn)
    ssn = ssn.delete('-')
    return false if not ssn =~ /^(\d){9}$/   #test for 9 digits
    ssn = Hash[* [:area, :group, :serial].zip(ssn.unpack("A3A2A4")).flatten]     
    return false if ssn[:group] == '00'
    return false if ssn[:serial] == '0000'
    return false if ssn[:area] == '000'
    return false if ssn[:area] == '666'
    return false if ssn[:area].to_i >= 900 and ssn[:area].to_i <=999
    return true
  end


end
end
