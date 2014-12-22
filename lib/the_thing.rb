class TheThing
  
  attr_accessor :sent_messages, :received_messages

  def initialize
    @awesome = true
    @sent_messages     = []
    @received_messages = []
  end

  def awesome?
    @awesome
  end

  def rot!
    @awesome = false
  end

  def receive(message)
    @received_messages << message
  end

  def send_message(message, receiver)
    receiver.receive(message)
    @sent_messages << message
  end
end
