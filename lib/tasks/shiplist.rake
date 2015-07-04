require 'open-uri'

namespace :theshiplist do
  desc "TODO"
  task :german, [:url] => :environment do |t, args|
    doc = Nokogiri::HTML(open(args.url))
    print args.url, ":\n"
    print doc.xpath("//font[count(.//strong)=1]//text()").collect{|x| x.text}.join("").gsub("\n"," ").gsub(/ +/," "),"\n\n"
  end
end
