export tag Dust < canvas
	count = 100
	speed = 6
	opacity = 0.5
	size = 12
	life = 5
	color ='#930C9B'
	# -------------
	particles = []
	context
	images = []
	last = 0
	visible

	# -----------------------------------------------------
	def particle first = false
		return
			image: Math.floor(Math.random! * 3)
			size: Math.ceil(Math.random! * 2 * size / 3 + size / 3)
			X: Math.random! * width
			Y: Math.random! * height
			speedX: (first ? Math.random! * speed / 50 - speed / 100 : 0)
			speedY: (first ?  Math.random! * speed / 50 - speed / 100 : 0)
			halflife: Math.random! * life * 1000 / speed  + life * 1000 / speed
			lived: first ? Math.floor(Math.random! * life * 2000 / speed) : 0
			opacity: 0

	# -----------------------------------------------------
	def image blur
		const canvas = document.createElement("canvas")
		const ctx = canvas.getContext('2d')
		
		let box = size + 10
		if blur
			canvas.width = box
			canvas.height = box
			ctx.filter = "blur({blur}px)" 
		else
			canvas.width = box
			canvas.height = box
			ctx.filter = ""	

		ctx.beginPath!
		ctx.fillStyle = color
		ctx.arc(canvas.width / 2, canvas.width / 2, size / 2, 0, 2 * Math.PI)
		ctx.fill!
		
		let img = new Image
		img.src = canvas.toDataURL("image/png")
		return img

	# -----------------------------------------------------
	def generate
		images[0] = image(2)
		images[1] = image(0)
		images[2] = image(4)
		for i in [0 .. count]
			particles.push particle(true)

	# -----------------------------------------------------
	def frame
		context.clearRect(0, 0, width, height)
		
		for prt, idx in particles
			prt.lived++
			if prt.lived > 2 * prt.halflife
				particles[idx] = particle!
			else
				prt.speedX += Math.abs(prt.speedX) > speed ? speed : Math.random! * speed / 500 - speed / 1000
				prt.speedY += Math.abs(prt.speedY) > speed ? speed : Math.random! * speed / 500 - speed / 1000
				prt.X += prt.speedX
				prt.Y += prt.speedY
				if prt.lived <= prt.halflife
					prt.opacity = opacity * prt.lived / prt.halflife
				else
					prt.opacity = opacity * (2 * prt.halflife - prt.lived) / prt.halflife
		
			context.globalAlpha = prt.opacity
			context.drawImage(images[prt.image], prt.X, prt.Y, prt.size, prt.size)

		window.requestAnimationFrame(frame.bind(self)) if visible

	# -----------------------------------------------------
	def resize
		width = window.innerWidth
		height = window.innerHeight

	# -----------------------------------------------------
	def mount
		context = getContext("2d")
		resize!
		window.addEventListener 'resize', do |event| resize!
		await generate!

		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			window.requestAnimationFrame(frame.bind(self)) if visible
		observer.observe(self)

	# -----------------------------------------------------
	def render
		<self [w:100% h:100vh]>