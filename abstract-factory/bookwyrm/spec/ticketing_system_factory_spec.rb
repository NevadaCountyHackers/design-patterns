require 'spec_helper'

describe TicketSystemFactory do
  it "#create_ticket raises error" do
    factory = TicketSystemFactory.new
    expect {
      factory.create_ticket('title', 'description')
    }.to raise_error(NotImplementedError, /does not implement create_ticket/)
  end
end

describe AbstractTicket do
 it "#send raises error" do
   ticket = AbstractTicket.new
   expect {
     ticket.submit
   }.to raise_error(NotImplementedError, /does not implement submit/)
 end
end
