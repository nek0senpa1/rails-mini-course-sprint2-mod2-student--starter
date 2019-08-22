class Order < ApplicationRecord

    def products
        product_ids = OrderProduct.where(order_id: id).pluck(:product_id)

        Product.find(product_ids)

    end

    def shippable?
        status != "shipped" && products.count > 0
    end

    def ship
        if shippable?
            update(status: "shipped")
        else
            false
        end
        
    end

end
