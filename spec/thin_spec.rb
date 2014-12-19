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

  context "two theThings exist" do
    let(:other_thing) { TheThing.new }

    context "the can send messages to each other" do
      context "no messages sent" do
        it { expect(one_thing.sent_messages).to eq [] }
        it { expect(other_thing.received_messages).to eq [] }
      end

      context "one message sent" do
        let(:message) { "Hello" }

        before { one_thing.send_message(message, other_thing) }

        it { expect(one_thing.sent_messages.last).to eq message }
        it { expect(other_thing.received_messages.last).to eq message }
      end
    end
  end
end
