class HardWorker
  include Sidekiq::Worker

  def perform(_args)
    sleep 2
  end
end
