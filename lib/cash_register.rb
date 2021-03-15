
class CashRegister

    attr_accessor :total, :discount, :items, :last_total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_total = 0
    end

    def add_item(item, price, quantity=1)
        @total += price * quantity
        quantity.times do
            @items << item
        end
        @last_total = price * quantity
    end

    def apply_discount
        if discount > 0
            @total = @total - @total * @discount/100
            # @total *= (100-@discount)/100.to_f
            # self.total -= (self.discount.to_f/100) * self.total
                "After the discount, the total comes to $#{total}."
        elsif @discount == 0
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - @last_total
    end

end