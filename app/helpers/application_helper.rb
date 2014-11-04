module ApplicationHelper

  def formatted_price(price, currency = nil)
    currency = (currency || current_currency)
    number_with_precision(price, precision: currency == 'BTC' ? 4 : 2) + ' ' + currency
  end

  def flag_icon(country_iso)
    content_tag(:i, '', class: country_iso == 'btc' ? 'icon-bitcoin' : "famfamfam-flag-#{country_iso}")
  end

  def currency_rate_info
    "1 USD = #{session[:currency_rate]} #{current_currency}" if current_currency != 'USD'
  end

  def label_class_by_order_status(status)
    case status
    when 'paid'       then 'label-success'
    when 'canceled'   then 'label-danger'
    when 'pending'    then 'label-warning'
    when 'unpaid'     then 'label-default'
    when 'failure'    then 'label-danger'
    end
  end

  def title(page_title)
    content_for(:title) { "#{page_title} - " if page_title.present? }
  end
end
