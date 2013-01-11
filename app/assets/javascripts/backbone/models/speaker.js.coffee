class TEDxYale.Models.Speaker extends Backbone.Model
  paramRoot: 'speaker'

  defaults:
    'name' : null

class TEDxYale.Collections.Speakers extends Backbone.Collection
  model: TEDxYale.Models.Speaker
  url: '/speakers'