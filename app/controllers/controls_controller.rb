class ControlsController < ApplicationController

  class Paramsclass
    attr :value,true
    attr :name,true
  end

  def index
    @customeralanyse = getcustomeranalyse
    @monthdata = ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
    @customerconsumeanalyse = getcustomerconsumeanalyse
    @customersaleranking = getcustomersaleranking
    @intentiongrow = getintentiongrow
    @customergrow = getcustomergrow
    @products = getproduct
  end

  private

  def getcustomeranalyse #客户分析
    customeralalysearr = Array.new

    customercla = Paramsclass.new
    customercla.value = Customer.all.count
    customercla.name = '客户'
    customeralalysearr.push customercla

    intentioncla = Paramsclass.new
    intentioncla.value = Intention.all.count
    intentioncla.name = '意向客户'
    customeralalysearr.push intentioncla

    appointcla = Paramsclass.new
    @appointids = Appoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    intentionids = []
    @appointids.each do |f|
      intentionids.push f.intention.id
    end
    intentionids.uniq!
    appointcla.value = intentionids.count
    appointcla.name = '待跟进意向'
    customeralalysearr.push appointcla

    customerappointcla = Paramsclass.new
    @customerappointids = Customerappoint.where('appointtime >= ? and appointtime is not null',DateTime.parse(Time.now.strftime('%Y-%m-%d') + ' 00:00:00') - 8.hours)
    customerids = []
    @customerappointids.each do |f|
      customerids.push f.customer.id
    end
    customerids.uniq!
    customerappointcla.value = customerids.count
    customerappointcla.name = '待跟进客户'
    customeralalysearr.push customerappointcla

    serviceendcla = Paramsclass.new
    products = Product.where('overdue > ? and overdue < ? and overdue is not null',Time.now,Time.now + 30.days)
    serviceendcla.value = products.count
    serviceendcla.name = '服务即将到期'
    customeralalysearr.push serviceendcla

    return customeralalysearr
  end

  def getcustomerconsumeanalyse #客户消费分析
    customerconsumanalysearr = Array.new
    @nowdate = Time.now.strftime('%Y')
    @nowdate += '-01-01'
    Time.parse(@nowdate).end_of_year.month.times do |f|
      month = (f + 1).to_s
      if month.length == 1
        month = '0' + month
      end
      month = "%#{Time.now.strftime('%Y') + '-' + month}%"
      products = Product.where('created_at like ?',month)
      sum = 0
      products.each do |p|
        sum += p.number * p.price
      end
      customerconsumanalysearr.push sum
    end
    return customerconsumanalysearr
  end

  class Productclass
    attr :id,true
    attr :price,true
    attr :number,true
    attr :sum,true
  end

  class Customerclass
    attr :id,true
    attr :commpany,true
    attr :contact,true
    attr :price,true
  end

  def getcustomersaleranking
    productarr = Array.new
    products = Product.all
    products.each do |p|
      productcla = Productclass.new
      productcla.id = p.id
      productcla.price = p.price
      productcla.number = p.number
      productcla.sum = p.price * p.number
      productarr.push productcla
    end
    productarr.sort!{|p|p.sum}
    productarr.reverse!

    customerarr = Array.new
    customers = Customer.all
    customers.each do |f|
      sum = 0
      products = f.products
      products.each do |p|
        sum += p.number * p.price
      end
      customercla = Customerclass.new
      customercla.id = f.id
      customercla.commpany = f.commpany
      customercla.contact = f.contact
      customercla.price = sum
      customerarr.push customercla
    end
    customerarr.sort!{|p|p.price}
    #customerarr.reverse!
  end

  def getintentiongrow
    intentionarr = Array.new
    @nowdate = Time.now.strftime('%Y')
    @nowdate += '-01-01'
    Time.parse(@nowdate).end_of_year.month.times do |f|
      month = (f + 1).to_s
      if month.length == 1
        month = '0' + month
      end
      month = "%#{Time.now.strftime('%Y') + '-' + month}%"
      intentions = Intention.where('created_at like ?',month).count
      intentionarr.push intentions
    end
    return intentionarr
  end

  def getcustomergrow
    intentionarr = Array.new
    @nowdate = Time.now.strftime('%Y')
    @nowdate += '-01-01'
    Time.parse(@nowdate).end_of_year.month.times do |f|
      month = (f + 1).to_s
      if month.length == 1
        month = '0' + month
      end
      month = "%#{Time.now.strftime('%Y') + '-' + month}%"
      intentions = Customer.where('entertime like ?',month).count
      intentionarr.push intentions
    end
    return intentionarr
  end

  class Productclass
    attr :id,true
    attr :name,true
    attr :price,true
  end

  def getproduct
    productarr = Array.new
    @nowdate = Time.now.strftime('%Y')
    @nowdate += '-01-01'
    products = Productdef.all
    products.each do |p|
      pricearr = Array.new
      Time.parse(@nowdate).end_of_year.month.times do |f|
        month = (f + 1).to_s
        if month.length == 1
          month = '0' + month
        end
        month = "%#{Time.now.strftime('%Y') + '-' + month}%"
        product = Product.where('created_at like ? and productdef_id = ?',month,p.id)
        pricecount = 0
        product.each do |pp|
          pricecount += pp.number * pp.price
        end
        pricearr.push pricecount
      end
      productcla = Productclass.new
      productcla.id = p.id
      productcla.name = Productdef.find(p.id).name
      productcla.price = pricearr
      productarr.push productcla
    end
    return productarr
  end



end
