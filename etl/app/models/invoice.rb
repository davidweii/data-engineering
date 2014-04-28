class Invoice < ActiveRecord::Base
  attr_accessible :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name

  @@header= nil
  def self.load(data)
    raise ArgumentError unless data
    Invoice.delete_all
    lines = data.split("\n")
    @@header = build_header(lines[0])
    lines.each_with_index do |ln, i|
      insert(ln.split("\t")) if i > 0
    end
  end

  private
  def self.build_header(row)
    row.split("\t").each { |r| r.gsub!(' ','_') }
  end

  def self.insert(row)
    n = Invoice.new
    @@header.each_with_index do |cl, i|
      n.send("#{cl}=", row[i])  
    end
    n.save
  end
end
