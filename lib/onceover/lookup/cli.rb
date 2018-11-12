# Create a class to hold the new command definition.  The class defined should
# match the file we are contained in.
class Onceover
  module Lookup
    class CLI

        # Static method defining the new command to be added
        def self.command
          @cmd ||= Cri::Command.define do
            name 'lookup'
            usage 'lookup [--name NAME]'
            summary "Hello, World! plugin for Onceover"
            description <<-DESCRIPTION
Enable the `puppet lookup` command to use onceover configuration
            DESCRIPTION
          
            option :n,  :name, 'Who to say hello to', :argument => :optional

            run do |opts, args, cmd|
              Onceover::Lookup::Lookup
            end
          end
        end
      end
  end
end

# Register the new command with onceover.  The method you add must match your 
# own code
Onceover::CLI::Run.command.add_command(Onceover::Lookup::CLI.command)

