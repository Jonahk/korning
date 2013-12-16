require 'csv'
require 'date'

datafile = Rails.root + 'db/data/sales.csv'

def sanitize(raw_values)

    {
        "employee" => raw_values[0],
        "customer_and_account_no" => raw_values[1],
        "product_name" => raw_values[2],
        "sale_date" => Date.strptime(raw_values[3], '%m/%d/%Y'),
        "sale_amount" => raw_values[4].gsub(/[^\d\.]/, '').to_f,
        "units_sold" => raw_values[5].to_i,
        "invoice_no" => raw_values[6].to_i,
        "invoice_frequency" => raw_values[7]
    }
end

Sale.delete_all

CSV.foreach(datafile, headers: true) do |row|
    values = sanitize(row)
    Sale.create!(values)
end
    # puts "Sale with invoice no. #{sale.invoice_no} processed"
    #   Sale.find_or_create_by(invoice_no: row['invoice_no']) do |sale|
