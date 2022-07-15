module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
    field :add_to_cart, mutation: Mutations::AddToCart
    field :update_cart_qty, mutation: Mutations::UpdateCartQty
    field :setting_shipping_zone, mutation: Mutations::SettingShippingZone
    field :delete_shipping_zone, mutation: Mutations::DeleteShippingZone
    field :create_order, mutation: Mutations::CreateOrder
    field :update_order, mutation: Mutations::UpdateOrder
    field :create_address, mutation: Mutations::CreateAddress
  end
end
