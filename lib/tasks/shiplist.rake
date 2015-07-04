require 'open-uri'

namespace :theshiplist do
  desc "TODO"
  task :german, [:url] => :environment do |t, args|
    doc = Nokogiri::HTML(open(args.url))
    print args.url, ":\n"
    print doc.xpath("(//font[count(.//strong)=1])[1]//text()").collect{|x| x.text}.join("").gsub("\n"," ").gsub(/ +/," "),"\n\n"

    for r in doc.xpath("(//tr[count(td)=7])")
      last_column = []
      (1..7).each do |column|
        this_column = r.xpath("td[#{column}]//text()").collect{|t| t.text}.join(" ").gsub(/ +/," ").gsub(/^ $/,"")
        print (this_column or last_column[column]), "\t"
        if(this_column) then
          last_column[column] = column
        end
      end
      print "\n"
    end
  end
end
