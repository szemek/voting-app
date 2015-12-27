require 'erb'

class HostsParser
  class << self
    def hosts
      entries.select(&condition)
    end

    def condition
      lambda { |host| host.start_with?(prefix) }
    end

    def prefix
      'app_'
    end

    def entries
      lines.map(&:split).map { |ip, host, *rest| host }
    end

    def lines
      config.read.each_line
    end

    def config
      File.open('/etc/hosts')
    end
  end
end

hosts = HostsParser.hosts
config = File.open('/etc/nginx/conf.d/default.conf', 'w')
template = File.open('/opt/scripts/default.conf.erb').read
config.write(ERB.new(template).result)
config.close
