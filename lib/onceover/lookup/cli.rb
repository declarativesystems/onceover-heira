# Create a class to hold the new command definition.  The class defined should
# match the file we are contained in.
require "onceover/lookup/lookup"
class Onceover
  class CLI
    class Lookup

      def self.command
        @cmd ||= Cri::Command.define do
          name 'lookup'
          usage 'lookup [--name NAME]'
          summary "Hello, World! plugin for Onceover"
          description <<-DESCRIPTION
Run the `puppet lookup` command to use onceover configuration
          DESCRIPTION

          option nil, :passthru, 'Arguments to passthrough to puppet lookup', argument: :required
          option nil, :factset, 'Extract and use this factset with `puppet lookup`', argument: :optional

          run do |opts, args, cmd|
            Onceover::Lookup::Lookup.run(opts[:passthru], opts[:factset])
          end
        end
      end
    end

    class Setup

      def self.command
        @cmd ||= Cri::Command.define do
          name 'setup'
          usage 'setup'
          summary "Setup the onceover to work with `puppet lookup`"
          description <<-DESCRIPTION
Setup onceover-lookup by creating .puppet.conf.onceover
          DESCRIPTION

          run do |opts, args, cmd|
            Onceover::Lookup::Lookup.setup
          end
        end
      end
    end
  end
end

Onceover::CLI::Run.command.add_command(Onceover::CLI::Lookup.command)
# sub-sub command
Onceover::CLI::Lookup.command.add_command(Onceover::CLI::Setup.command)

