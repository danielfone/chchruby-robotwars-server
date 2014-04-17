class Team < ActiveRecord::Base

  serialize :scores, JSON

  after_initialize :setup_defaults

  validates :name, presence: true

  before_save :store_total

private

  def setup_defaults
    self.scores ||= {}
  end

  def store_total
    values = scores.values.compact
    puts "Scores: "
    puts values.inspect
    avg = (values.sum.to_f / values.count.to_f)
    puts "Average: #{avg}"
    write_attribute :total, avg
  end

end
