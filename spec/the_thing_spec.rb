require 'spec_helper'

require 'the_thing'

describe TheThing do

  let(:one_thing) { TheThing.new }

  subject { one_thing }

  it "is a thing" do
    expect(subject).to be_awesome
  end

  it "can rot" do
    subject.rot!
    expect(subject).not_to be_awesome
  end

  context "two things exist" do
    let(:other_thing) { TheThing.new }

    context "they can send messages to each other" do
      context "no messages sent" do
        it { expect(one_thing.sent_messages).to eq [] }
        it { expect(other_thing.received_messages).to eq [] }
      end

      context "one message sent" do
        let(:message) { "Hello" }

        before { one_thing.send_message(message, other_thing) }

        it { expect(one_thing.sent_messages.last).to eq message }
        it { expect(other_thing.received_messages.last).to eq message }

        it { expect(other_thing.received_messages.last).to be_a_valid_message }
        it { expect(one_thing.sent_messages.last).to be_acknowledged }
      end
    end
  end
  
  describe "#receive" do
    let(:receiver) { TheThing.new }
    
    context "receiving messages does not always work" do
      before { allow(receiver).to receive(:receive).and_return(false, true) }
    
      it "still can deliver the message successfully" do
        one_thing.send_message("Hello", receiver)
        expect(one_thing.sent_messages.count).to eq 1
      end
    end
  end
end
