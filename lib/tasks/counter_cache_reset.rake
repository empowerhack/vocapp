namespace :answers do
  desc 'Recalculates answer vote counters'
  task recalculate_counters: :environment do
    Answer.find_each do |answer|

      Answer.reset_counters(answer.id, :upvotes, :downvotes)

    end
  end
end
