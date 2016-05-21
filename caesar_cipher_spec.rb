$num = (0..9).to_a
$m   = ('a'..'z').to_a
$M   = ('A'..'Z').to_a


def caesar_cipher(text, shift)
	letter = text.split('')
	coded_letter = letter.map {|l| encode(l, shift) }
    return coded_letter.join
end
def encode(char, shift)	 
	if $m.include? char
		i = $m.index char
		j = (i + shift) % 26
		return $m[j]
	elsif $M.include? char
	     i = $M.index char
	     j = (i + shift) % 26
	     return  $M[j]
	elsif (char.ord >=48 && char.ord <= 57)     	
         i = $num.index(char.to_i)
         j = (i + shift) % 10
         return $num[j].to_s
    else
     
        return char
    end                         	
end

#tests

describe "#caesar_cipher"do 
	it "translates a single lowercase word" do
       caesar_cipher("hello", 1).should == "ifmmp"
    end
    it "translates a single Uppercase word" do
       caesar_cipher("CODING", 2).should == "EQFKPI"
    end	
    it "returns an empty string" do
        caesar_cipher(" ", 2).should == " "
    end 	
    it "returns the same input if shit is 0" do
        caesar_cipher("Testing is nice!", 0).should == "Testing is nice!"
    end	
    it "translates the end of the alphabet" do
        caesar_cipher("wxyzabcd", 2).should == "yzabcdef"
    end
    it "translates the beginning of the alphabet" do
        caesar_cipher("wxyzabcd", -2).should == "uvwxyzab"
    end 
    it "doesn't translate special characters or spaces" do
        caesar_cipher("!@-_#{}$%^ &*µ()°; '' ", 5).should == "!@-_#{}$%^ &*µ()°; '' "
    end	
    it "allows shifts greater than 26" do
        caesar_cipher("Web", 30).should == "Aif"
    end	
    
end