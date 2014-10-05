class TicketBuilder
  attr_accessor :ticket

  def initialize
    @ticket = Ticket.new
  end

  def set_url url
    @ticket.url = url
  end

  def set_description description
    @ticket.description = description
  end

  def set_browser browser
    @ticket.browser = browser
  end
end

class BugTicketBuilder < TicketBuilder
  def initialize
    super
    @ticket.type = 'bug'
  end
end

class FeatureTicketBuilder < TicketBuilder
  def initialize
    super
    @ticket.type = 'feature'
  end
end

class Ticket
  attr_accessor :url, :description, :browser, :type
  attr_reader :created_at

  def initialize
    @created_at = Time.now
  end
end

class Application
  def create_ticket builder
    #builder = builder.new
    builder.set_url('http://www.example.com')
    builder.set_description('typo on line 2')
    builder.set_browser('MSIE')
    builder.ticket
  end
end
