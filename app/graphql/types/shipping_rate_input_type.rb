module Types
  class ShippingRateInputType < Types::BaseInputObject
    argument :name, String
    argument :amount, Float
  end
end
