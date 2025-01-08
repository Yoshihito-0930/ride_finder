namespace :safety_tips do
  desc 'create safety tip'
  task create_daily_tip: :environment do
    SafetyTipsController.new.create_daily_tip
  end
end
