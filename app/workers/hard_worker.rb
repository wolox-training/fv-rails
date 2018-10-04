class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    sleep 2
    puts 'idunno'
  end
end
