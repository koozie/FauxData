



class SSN
    attr_reader :ssn

    def initialize(ssn_string='')
        self.ssn=(ssn_string) 
    end

    def ssn=(ssn_string='')
        @ssn = ssn_string.to_s.strip.delete('-')
    end
    # @return [String] Return String of SSN
    def to_s()
        return @ssn.to_s
    end
    def ==(obj)
        if obj.respond_to?(:to_s)
            self.to_s == obj.to_s
        end
    end
    def eql?(obj)
        self.==(obj)
    end

    # @return [String] Return SSN string with dashes as 123-45-6789
    def p()
        return '000-00-0000' unless self.valid?
        return @ssn.to_s.unpack('A3A2A4').join('-')
    end
    # @return [String] Return SSN string masking the first 5 digits, XXX-XX-6789
    def p_mask(mask_char = 'X')
        return '111-11-0000'.gsub(/1/, mask_char) unless self.valid?
        return ('111-11-' + @ssn[-4..-1]).gsub(/1/,mask_char)
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
    def valid?()
        return false if not @ssn =~ /^(\d){9}$/   #test for 9 digits
        ssn = Hash[* [:area, :group, :serial].zip(@ssn.unpack("A3A2A4")).flatten]       
        return false if ssn[:group] == '00'
        return false if ssn[:serial] == '0000'
        return false if ssn[:area] == '000'
        return false if ssn[:area] == '666'
        return false if ssn[:area].to_i >= 900 and ssn[:area].to_i <=999
        return true
    end

end
