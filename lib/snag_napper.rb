# Use bugsnag to raise errors.
# Thank you Mr. Lloyd! 
module Kernel
  alias_method :_orig_raise, :raise
  def raise(*args)
    begin
      _orig_raise(*args)
    rescue Exception => e
      Bugsnag.notify(e)
      _orig_raise(e)
    end
  end
end
