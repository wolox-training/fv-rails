require 'sidekiq-scheduler'
require 'date'

class ExpiredRentScheduler
  include Sidekiq::Worker

  def perform
    rents = Rent.where('final_date < ?', Time.zone.today)
    rents.each do |rent|
      UserMailer.rent_expired(rent.id).deliver_later
    end
  end
end
