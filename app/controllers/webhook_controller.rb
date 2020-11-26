# frozen_string_literal: true

class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def orders_create
    order = Order.new(get_params)
    if order.save
      p 'Order Created'
    else
      p 'Error'
    end
    render json: {success: true }
  end

  private

  def get_params
    {
      shop_id: get_shop_id,
      store_domain: request.headers['X-Shopify-Shop-Domain'],
      order_number: params[:order_number],
      email: params[:customer][:email],
      first_name: params[:customer][:default_address][:first_name],
      last_name: params[:customer][:default_address][:last_name],
      address1: params[:customer][:default_address][:address1],
      address2: params[:customer][:default_address][:address2],
      city: params[:customer][:default_address][:city],
      province: params[:customer][:default_address][:province],
      country: params[:customer][:default_address][:country],
      zip_code: params[:customer][:default_address][:zip],
      product_title: params[:line_items][0][:title],
      phone: params[:customer][:default_address][:phone],
      json_data: params.to_json
    }
  end

  def get_shop_id
    Shop.find_by(shopify_domain: request.headers['X-Shopify-Shop-Domain'])&.id
  end
end
