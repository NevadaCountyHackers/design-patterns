class TicketSystemFactory
  def create_ticket(title, description)
    raise NotImplementedError, "#{self.class.name} does not implement create_ticket()"
  end
end

class AbstractTicket
  def submit
    raise NotImplementedError, "#{self.class.name} does not implement submit()"
  end
end

class JiraTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return JiraTicket.new(title, description)
  end
end

class GitHubTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return GitHubIssue.new(title, description)
  end
end

class PivotalTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return PivotalTicket.new(title, description)
  end
end

