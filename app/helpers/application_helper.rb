module ApplicationHelper

  def timeshow(time)
    nowtime = ''
    subtime = Time.now - time
    if subtime < 5.minutes
      nowtime = '刚刚'
    elsif subtime > 5.minutes && subtime <= 10.minutes
      nowtime = '5分钟前'
    elsif subtime > 10.minutes && subtime <= 20.minutes
      nowtime = '10分钟前'
    elsif subtime > 30.minutes && subtime <= 1.hours
      nowtime = '半小时前'
    elsif subtime > 1.hours && subtime <= 24.hours
      nowtime = (subtime / (60 * 60)).to_i.to_s + '小时前'
    elsif subtime > 1.days && subtime < 2.days
      nowtime = '1天前'
    else
      nowtime = time.strftime('%Y-%m-%d %H:%M:%S')
    end
    return nowtime
  end

  def getintentioncount
    appointids = Appoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    intentionids = []
    appointids.each do |f|
      intentionids.push f.intention.id
    end
    intentionids.uniq!
    intentions = Intention.where('id in (?)',intentionids).count
  end

  def getcustomerappointcount
    customerappointids = Customerappoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    customerids = []
    customerappointids.each do |f|
      customerids.push f.customer.id
    end
    customerids.uniq!
    customers = Customer.where('id in (?)',customerids).count
  end

  def getserviceendcount
    products = Product.where('overdue > ? and overdue < ? and overdue is not null',Time.now,Time.now + 30.days).count
  end

end
