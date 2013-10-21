require 'stripe'

# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account
Stripe.api_key = "fake"

# Get the credit card details submitted by the form
token = '111222333'

# Create the charge on Stripe's servers - this will charge the user's card
begin
  charge = Stripe::Charge.create(
    :amount => 1000, # amount in cents, again
    :currency => "usd",
    :card => token,
    :description => "payinguser@example.com"
  )
rescue Stripe::CardError => e
  # The card has been declined
end


customer = Stripe::Customer.create(
        :email => 'alice@example.com',
        :description => 'description',
        :card => token
      )
puts customer.active_card.last4
customer.update_subscription({:plan => "premium"})


customer = Stripe::Customer.retrieve(customer.id)
puts customer.email
customer.save
