extends CPUParticles2D

func _ready():
	# Setup the particle system settings
	self.bounce = true
	self.bounce_factor = 0.5  # Adjust the bounce amount

func _process(delta):
	# Loop through all particles
	for i in range(amount):
		var particle = get_particle(i)  # Get the i-th particle data
		if particle.position.y >= 270:  # Replace with your floor position
			# Simulate bounce by reversing the Y velocity and applying bounce factor
			particle.velocity.y *= -self.bounce_factor
			particle.position.y = 270  # Ensure the particle stays at or above the floor
			set_particle(i, particle)  # Set the modified particle data
