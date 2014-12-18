class TheThing

  @awesome = true

  def self.awesome?
    @awesome
  end

  def self.rot!
    @awesome = false
  end

end
