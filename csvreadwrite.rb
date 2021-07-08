require 'csv'
table = CSV.parse(File.read("addresses.csv"), headers: false)

File.open("newCsv.csv", "w") do |csv|
    for row in table
        x = row.join(',')
        csv << x << "\n"
    end
end