class FollowappointsController < ApplicationController

  def index
    @appointids = Appoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    intentionids = []
    @appointids.each do |f|
      intentionids.push f.intention.id
    end
    intentionids.uniq!
    @intentions = Intention.where('id in (?)',intentionids)
  end

end
