require 'spec_helper'

require 'the_thing'

describe TheThing do

  let(:oneTheThing) { TheThing.new }

  subject { oneTheThing }

  it "is a thing" do
    expect(subject).to be_awesome
  end

  it "can rot" do
    subject.rot!
    expect(subject).not_to be_awesome
  end

  context "two theThings exist" do
    let(:otherTheThing) { TheThing.new }

    context "the can send messages to each other" do
      context "no messages sent" do
        it { expect(oneTheThing.sent_messages).to eq [] }
        it { expect(otherTheThing.received_messages).to eq [] }
      end

      context "one message sent" do
        let(:message) { "Hello" }

        before { oneTheThing.sendMessage(message, otherTheThing) }

        it { expect(oneTheThing.sent_messages.last).to eq message }
        it { expect(otherTheThing.received_messages.last).to eq message }
      end
    end
  end
end
