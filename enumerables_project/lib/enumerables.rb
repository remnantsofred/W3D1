class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        
        proc = Proc.new { |ele| (selected << ele if prc.call(ele)) }
        self.my_each(&proc) 

        # self.my_each do |ele|
        #     selected << ele if prc.call(ele)
        # end

        selected
    end

    def my_reject(&prc)
        selected = []
        
        proc = Proc.new { |ele| (selected << ele unless prc.call(ele)) }
        self.my_each(&proc) 

        selected
    end

    def my_any?(&prc) 
        proc = Proc.new { |ele| return true if prc.call(ele) }
        self.my_each(&proc)  
        false
    end

    def my_all?(&prc)
        proc = Proc.new { |ele| return false unless prc.call(ele) }
        self.my_each(&proc)  
        true
    end

end


class Array

    def my_flatten
        one_d_array = []
        self.each do |ele|
            if ele.class == Array
                self.my_flatten
            else 
                one_d_array << ele
            end
        end
        one_d_array
    end 

    def my_zip(*n)
        zip = Array.new(self.length) { Array.new(n.length + 1)}
        i = 0
        
        while i < self.length
            zip[i][0] = self[i]
            
            n.each_with_index do |subarr, j|
                zip[i][j+1] = subarr[i]
            end
            
            i += 1
        end

        zip
    end

    def my_rotate(n=1)
        if n.positive? 
            n.times { self.push(self.shift) }
        else
            n.abs.times { self.unshift(self.pop) }
        end
        self
    end

    def my_join(joiner="")
        joined_string = ""
        i = 0
        while i < self.length - 1
            joined_string += self[i].to_s + joiner.to_s
            i += 1
        end
        joined_string += self[-1].to_s
        joined_string
    end

    def my_reverse
        reversed = []
        proc = Proc.new { |ele| reversed.unshift(ele) }
        self.my_each(&proc) 
        reversed
    end

    def factors(num)
        
    end

end

