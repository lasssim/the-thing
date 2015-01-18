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
    true
  end

  def send_message(message_body, receiver)
    message = Message.new(message_body)
    
    return unless receiver.receive(message)
    message.acknowledge!
    
    @sent_messages << message
  end
end

class Message < String
  def valid_message?
    !empty?
  end
  
  def acknowledge!
    @acknowledged = true
  end
  
  def acknowledged?
    !!@acknowledged
  end
end
