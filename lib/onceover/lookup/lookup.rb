require "erb"
require "tempfile"

class Onceover
  module Lookup
    class Lookup

      # Figure out what hiera.yaml we should be using. If there isn't a custom
      # one, then fallback to the per-environment one. We don't care if this
      # exists or not because it really should...
      def self.resolve_hiera_yaml
        hiera_yaml = "spec/hiera.yaml" if File.exist? "spec/hiera.yaml" else "hiera.yaml"
      end

      def self.setup
        puppet_conf_template = File.join(File.dirname(File.expand_path(__FILE__)), "../../../res/puppet.conf.erb")

        template = File.read(puppet_conf_template)

        # used by the template
        hiera_yaml = resolve_hiera_yaml
        content  = ERB.new(template, nil, '-').result(binding)

        Tempfile.open do |f|
          f.puts content

          system([
            "puppet",
            "lookup",
            "--config",
            f.path,
          ])
        end

      end
    end
  end
end
