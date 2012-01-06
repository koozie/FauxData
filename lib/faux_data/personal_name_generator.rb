

module FauxData
class PersonalNameGenerator

    def initialize 
        @surnames = Array.new
        @given_names_female = Array.new
        @given_names_male = Array.new
        @filename_surnames = File.join(File.dirname(__FILE__),'data','us','surnames.txt')
        @filename_given_names_female = File.join(File.dirname(__FILE__),'data','us','female_given_names.txt')
        @filename_given_names_male = File.join(File.dirname(__FILE__),'data','us','male_given_names.txt')

    end

    def surname
        load_surname if @surnames.size < 1
        return @surnames.choice
    end
    def given_name_female
        load_given_names_female if @given_names_female.size < 1 
        return @given_names_female.choice
    end
    def given_name_male
        load_given_names_male if @given_names_male.size < 1
        return @given_names_male.choice
    end




    private
    def load_name_file(filename)
        names = Array.new
        if File.readable?(filename)
            File.open(filename,'r') do |file|
                file.each do |line|
                    names << line[0,15].strip
                end
            end
        end
        names << "" if names.size == 0
        return names
    end
    def load_surname
        @surnames  = load_name_file(@filename_surnames)
    end
    def load_given_names_female
        @given_names_female  = load_name_file(@filename_given_names_female)
    end
    def load_given_names_male
        @given_names_male  = load_name_file(@filename_given_names_male)
    end

end
end
