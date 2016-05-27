class ChargesController < ApplicationController
  before_action :authenticate_user!

  def create
    customer = Stripe::Customer::create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Blocipedia membership - #{current_user.email}",
      currency: "usd"
    )

   flash[:notice] = "Thanks for upgrading your account, #{current_user.email}!"
   current_user.premium!
   redirect_to edit_user_registration_path(current_user)

   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Blocipedia membership - #{current_user.email}",
     amount: Amount.default
   }
  end

  def downgrade
byebug
    current_user.standard!
    current_user.wikis.each do |wiki|
      wiki.update(private: false)
    end
    flash[:notice] = "Your account has been downgraded to #{current_user.role}, #{current_user.email}!"
    redirect_to edit_user_registration_path(current_user)
  end
end
