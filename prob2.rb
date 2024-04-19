def parse_invoices(invoice_data)
    # Regex pattern to match each component of the invoice entries
    pattern = /(\d{4}-\d{2}-\d{2}) - ([\w\d]+) - ([\w\s]+) - \$(\d+(?:,\d{3})*|\d+)/
  
    # Split the invoice data into lines and process each line
    invoice_data.split("\n").each do |line|
      if line.match?(pattern)
        match = line.match(pattern)
        date = match[1]
        invoice_number = match[2]
        client_name = match[3]
        amount = match[4]
  
        # Print out each component in a structured format
        puts "Date: #{date}, Invoice Number: #{invoice_number}, Client: #{client_name}, Amount: $#{amount}"
      end
    end
  end
  
  # Multiline string for the invoice entries
  invoice_entries = <<-INVOICES
  2023-03-01 - INV001 - Acme Corp - $1,000
  2023-03-02 - INV002 - Beta LLC - $2,050
  2023-03-03 - INV003 - Gamma Inc - $3,500
  INVOICES
  
  # Call the function to parse the invoices
  parse_invoices(invoice_entries)
  