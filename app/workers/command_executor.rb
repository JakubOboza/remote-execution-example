require 'rush'

class CommandExecutor
  @queue = :commands_queue
  def self.perform(build_id)
    build = Build.find(build_id)
    begin
      box = Rush::Box.new(build.remote)          # lets start with localbox
      output = box["/tmp"].bash(build.command)  # I'm using tmp for now to create a bit sandboxy env
      build.output = output
      build.succeed!
    rescue
      build.failed!
    end
  end
end