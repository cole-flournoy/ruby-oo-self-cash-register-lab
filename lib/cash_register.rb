require "pry"

class CashRegister
    attr_accessor :total, :items, :previous_total
    attr_reader :discount 
    
    def initialize(employee_discount=0)
        @total = 0
        @discount = employee_discount
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        @previous_total = @total
        @total += price * quantity
        quantity.times {@items << title}
    end

    def apply_discount
        if self.discount > 0
            reduction = self.total * (self.discount/100.to_f)
            self.total -= reduction.to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply." 
        end   
    end

    def void_last_transaction
        if self.items == []
            @total = 0
        else   
            @total = @previous_total
        end
    end
end
