class Build < ActiveRecord::Base

  STATUS = ["failed", "success"]

  belongs_to :user

  validates :command, presence: true
  validates :remote , presence: true

  after_create  :schedule_execution_task

  def schedule_execution_task
    Resque.enqueue(CommandExecutor, self.id)
  end

  def failed!
    self.state = "failed"
    self.save
  end

  def succeed!
    self.state = "success"
    self.save
  end

end
