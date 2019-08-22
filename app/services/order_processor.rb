class OrderProcessor

    def initialize(order)
        @order = order
        @products = order.products
    end

    def ship
        # return false unless products_available?
        # @products.each { |p| product.reduce_inventory }

        if products_available?
            @products.each { |p| product.reduce_inventory }

            return @order.ship
        else
            return false
        end

        # @order.ship
    end

    
    
    private

    def products_available?
        # @products.all? { |p| products_available? }

        @products.map { |p| products_available? }
    end

end