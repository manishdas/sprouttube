# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  [
    {:name => "PHP" },
    {:name => "Rails" },
    {:name => "Ruby" },
    {:name => "CSS" },
    {:name => "HTML5" },
    {:name => "Mobile" },
    {:name => "Miscellaneous" },
  ].each do |attrb|
    Category.find_or_create_by_name(attrb)
  end

  [
    {:name => "admin", :email => "bikash.basukala@sprout-technology.com", :password => "admingod" },
    {:name => "Abhaya Thapa", :email => "abhaya.thapa@sprout-technology.com", :password => "password" },
    {:name => "Alana Puskarich", :email => "alana@sprout-technology.com", :password => "password" },
    {:name => "Anand Joseph", :email => "anand@sprout-technology.com", :password => "password" },
    {:name => "Anu K.C.", :email => "annu.kc@sprout-technology.com", :password => "password" },
    {:name => "Ashis Rai", :email => "ashis@sprout-technology.com", :password => "password" },
    {:name => "Bala Bhadra Maharjan", :email => "bala@sprout-technology.com", :password => "password" },
    {:name => "Bikash Basukala", :email => "bikash.basukala@sprout-technology.com", :password => "password" },
    {:name => "Bikash Poudel", :email => "bikash@sprout-technology.com", :password => "password" },
    {:name => "Chandra Mohan Thakur", :email => "chandra.thakur@sprout-technology.com", :password => "password" },
    {:name => "Deepak Lamichhane", :email => "deepak@sprout-technology.com", :password => "password" },
    {:name => "Dipesh Gautam", :email => "dipesh.gautam@sprout-technology.com", :password => "password" },
    {:name => "Dipil Saud", :email => "dipil.saud@sprout-technology.com", :password => "password" },
    {:name => "Gagan Shrestha", :email => "gagan@sprout-technology.com", :password => "password" },
    {:name => "Jayandra Pokhrel", :email => "jayandra@sprout-technology.com", :password => "password" },
    {:name => "Kapil Raj Nakhwa", :email => "kapil.nakhwa@sprout-technology.com", :password => "password" },
    {:name => "Krisha Ram Shilpakar", :email => "Krishna@sprout-technology.com", :password => "password" },
    {:name => "Kshitiz Jung Gurung", :email => "kshitiz.gurung@sprout-technology.com", :password => "password" },
    {:name => "Lau Chin", :email => "lau@sprout-technology.com", :password => "password" },
    {:name => "Laurel Sears", :email => "laurel@sprout-technology.com", :password => "password" },
    {:name => "Manish Lal Das", :email => "manish.das@sprout-technology.com", :password => "password" },
    {:name => "Mark Sears", :email => "mark@sprout-technology.com", :password => "password" },
    {:name => "Prabesh Shrestha", :email => "prabesh.shrestha@sprout-technology.com", :password => "password" },
    {:name => "Prashiddha Raj Joshi", :email => "prashiddha.joshi@sprout-technology.com", :password => "password" },
    {:name => "Pratuat Amatya", :email => "pratuat.amatya@sprout-technology.com", :password => "password" },
    {:name => "Prasvin Pandey", :email => "prasvin.pandey@sprout-technology.com", :password => "password" },
    {:name => "Rajan Maharjan", :email => "rajan@sprout-technology.com", :password => "password" },
    {:name => "Ranendra Adhikari", :email => "ranendra@sprout-technology.com", :password => "password" },
    {:name => "Roshan Joshi", :email => "roshanj@sprout-technology.com", :password => "password" },
    {:name => "Sachin Rai", :email => "sachin@sprout-technology.com", :password => "password" },
    {:name => "Sadiksha Gautam", :email => "sadiksha@sprout-technology.com", :password => "password" },
    {:name => "Safal Joshi", :email => "safal@sprout-technology.com", :password => "password" },
    {:name => "Samesh Swongamikha", :email => "samesh@sprout-technology.com", :password => "password" },
    {:name => "Sandeep Koirala", :email => "sandeep.koirala@sprout-technology.com", :password => "password" },
    {:name => "Saroj Maharjan", :email => "saroj@sprout-technology.com", :password => "password" },
    {:name => "Sarwagya Pandey", :email => "Sarwagya@sprout-technology.com", :password => "password" },
    {:name => "Tom Puskarich", :email => "tom@sprout-technology.com", :password => "password" },
  ].each do |attrb|
    Person.find_or_create_by_name(attrb)
  end

