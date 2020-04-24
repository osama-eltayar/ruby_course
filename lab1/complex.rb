class MyComplex 
    attr_accessor :real, :imagine

    @@mulCount = @@addCount = 0
    def initialize(r , i)
       @real ,@imagine =r,i
                  
    end

    def +(com)
        r = @real + com.real
        i = @imagine + com.imagine
        @@addCount +=1 
        c = MyComplex.new(r,i)
       
    end
    
    def *(com)
        r = (@real * com.real - @imagine * com.imagine)
        i = @real * com.imagine + @imagine * com.real
        @@mulCount +=1
        c = MyComplex.new(r,i)
    end

    def self.adding(coms)
       myC = MyComplex.new(0,0)
        coms.each{|c| myC += c } 
        return myC
    end

    def self.multi(coms)
        myC = MyComplex.new(1,0)
        coms.each{|c| myC *= c } 
        return myC
    end

    def self.get_stats
        "adding #{@@addCount} , multi #{@@mulCount}"
    end

    
end

 c1 = MyComplex.new(3,2)
 c2 = MyComplex.new(1,7)

c3 = c1*c2
puts "#{c3.real} + #{c3.imagine}i "


c4 =  c1+c2
puts "#{c4.real} + #{c4.imagine}i "

addC =  MyComplex::adding([c1,c2])
puts "#{addC.real} + #{addC.imagine}i "

mul = MyComplex::multi([c1,c2])
puts "#{mul.real} + #{mul.imagine}i" 

puts MyComplex::get_stats