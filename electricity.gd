extends GPUParticles2D

func _ready():
	# Setup the particle system settings
	self.bounce = true
	self.bounce_factor = 0.5  # Adjust the bounce amount

func _process(delta):
	pass
