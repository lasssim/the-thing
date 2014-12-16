require 'spec_helper'

require 'the_thing'

describe TheThing do

  it "is a thing" do
    expect(TheThing).to be_awesome
  end

  it "can rot" do
    TheThing.rot!
    expect(TheThing).not_to be_awesome
  end

end
