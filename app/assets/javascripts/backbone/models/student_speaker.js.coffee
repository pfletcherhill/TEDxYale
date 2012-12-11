class TEDxYale.Models.StudentSpeaker extends Backbone.Model
  paramRoot: 'student_speaker'

  defaults:
    'name' : null
    'talk' : null

class TEDxYale.Collections.StudentSpeakers extends Backbone.Collection
  model: TEDxYale.Models.StudentSpeaker
  url: '/student_speakers'
