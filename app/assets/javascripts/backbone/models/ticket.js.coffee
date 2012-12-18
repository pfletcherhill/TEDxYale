class TEDxYale.Models.Ticket extends Backbone.Model
  paramRoot: 'ticket'

  defaults:
    'name' : null
    'email' : null

class TEDxYale.Collections.TicketsCollection extends Backbone.Collection
  model: TEDxYale.Models.Ticket
  url: '/tickets'
