class TEDxYale.Models.Speaker extends Backbone.Model
  paramRoot: 'speaker'

  defaults:
    'name' : null
    'thumbnail' : null
    'public' : null
    'twitter' : null

class TEDxYale.Collections.Speakers extends Backbone.Collection
  model: TEDxYale.Models.Speaker
  url: '/speakers'