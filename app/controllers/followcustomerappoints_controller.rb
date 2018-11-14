class FollowcustomerappointsController < ApplicationController

  def index
    @customerappointids = Customerappoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    customerids = []
    @customerappointids.each do |f|
      customerids.push f.customer.id
    end
    customerids.uniq!
    @customers = Customer.where('id in (?)',customerids)
  end

end
