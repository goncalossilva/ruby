begin
  require "socket"
  require "test/unit"
rescue LoadError
end


class TestUDPSocket < Test::Unit::TestCase
  def test_connect
    s = UDPSocket.new
    host = Object.new
    class << host; self end.send(:define_method, :to_str) {
      s.close
      "127.0.0.1"
    }
    assert_raise(IOError, "[ruby-dev:25045]") {
      s.connect(host, 1)
    }
  end

  def test_bind
    s = UDPSocket.new
    host = Object.new
    class << host; self end.send(:define_method, :to_str) {
      s.close
      "127.0.0.1"
    }
    assert_raise(IOError, "[ruby-dev:25057]") {
      s.bind(host, 2000)
    }
  end
end if defined?(UDPSocket)
