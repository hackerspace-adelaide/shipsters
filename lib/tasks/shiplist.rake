require 'open-uri'

namespace :theshiplist do
  desc "TODO"
  task :german, [:url] => :environment do |t, args|
    doc = Nokogiri::HTML(open(args.url))
    print args.url, ":\n"
    # find the first font tag containing a single strong tag
    print doc.xpath("(//font[count(.//strong)=1])[1]//text()").collect{|x| x.text}.join("").gsub("\n"," ").gsub(/ +/," "),"\n\n"

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
    end
  end
end
