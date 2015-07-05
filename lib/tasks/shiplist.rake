require 'open-uri'

namespace :theshiplist do
  desc "TODO"
  task :german, [:url] => :environment do |t, args|
    doc = Nokogiri::HTML(open(args.url))
    print args.url, ":\n"
    # find the first font tag containing a single strong tag
    desc = doc.xpath("(//font[count(.//strong)=1])[1]")

    shipname = desc.xpath("strong//text()").collect{|x| x.text}.join(" ").gsub("\n"," ").gsub(/ +/," ")
    print shipname,"\n"

    shiptype = desc.xpath("strong/preceding-sibling::text()")
    print shiptype,"\n"

    remaining = desc.xpath("strong/following-sibling::text()").collect{|x| x.text}.join(" ").gsub("\n"," ").gsub(/ +/," ")
    print remaining,"\n"

    tonnage = remaining[/(\d+) ton/,1]
    print tonnage,"\n"

    m = /from ([^0-9]+)([^,]+)/.match(remaining)
    from = m[1]
    from_date = Date.parse(m[2])

    print from,"\n"
    print from_date,"\n"

    
    m = /arrived at ([^0-9]+)([^,]+)/.match(remaining)
    to = m[1]
    to_date = Date.parse(m[2])
    print to,"\n"
    print to_date,"\n"

    ship = Ship.new(name: shipname, launched: from_date)
    ship.save
    voyage = Voyage.new(ship: ship)
    voyage.save

    from_port = Port.new(name: from)
    from_port.save

    from_stop = Stop.new(voyage: voyage, port_id: from_port.id, departure: from_date)
    #from_stop.save

    to_port = Port.new(name: to)
    to_port.save

    to_stop = Stop.new(voyage: voyage, port_id: to_port.id, arrival: to_date)
    #to_stop.save

    







    # grab all text node descendants and normalise spaces
    print desc.xpath(".//text()").collect{|x| x.text}.join("").gsub("\n"," ").gsub(/ +/," "),"\n\n"

    last_row = []
    # select rows with 7 columns where the 2nd column (given) is not blank
    for r in doc.xpath("(//tr[count(td)=7 and not(td[2]/text()='\u00a0')])")
      this_row = []
      (1..7).each do |column|
        # concatenate all text elements and normalize spaces (treat nbsp?)
        this_column = r.xpath("td[#{column}]//text()").collect{|t| t.text}.join(" ").gsub(/ +/," ").gsub(/^ $/,"")
        if this_column.blank? then
          if [1,6].include? column then
            this_column = last_row[column]
          end
        else
          last_row[column] = this_column
        end
        this_row[column] = this_column
        #print this_column, "\t"
      end
      print this_row, "\n"

      birthdate = nil
      age = this_row[3]
      if(!age.blank?) then 
        birthdate = from_date-age.to_i.years
      end 

      passenger = Passenger.new(name: this_row[2]+" "+this_row[1], birthdate: birthdate)
      passenger.save

      from_stop.embarked.append(passenger) 
      to_stop.disembarked.append(passenger)
    end
    from_stop.save
    to_stop.save  
  end
end


