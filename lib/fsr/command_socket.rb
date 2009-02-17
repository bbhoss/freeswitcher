require "fsr/event_socket"
require "fsr/cmd"
CONFIG = YAML::load(File.read(File.join(File.dirname(__FILE__), "../../", "config.yaml")))
module FSR
  class CommandSocket < EventSocket
    include Cmd

    def initialize(args = {})
      @server = args[:server] || CONFIG['settings']['inbound']['host']
      @port = args[:port] || CONFIG['settings']['inbound']['port']
      @auth = args[:auth] || CONFIG['settings']['inbound']['password']
      @socket = TCPSocket.new(@server, @port)
      super(@socket)
      unless login
        raise "Unable to login, check your password!"
      end
    end

    def login
      response #Clear buf from initial socket creation/opening
      self << "auth #{@auth}"
      response #Return response, clear buf for rest of commands
    end
  end
end
