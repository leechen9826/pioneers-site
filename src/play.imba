export tag Play < canvas
	ratio = 0
	src = {}
	json = {}
	height=0
	width=0
	sprites = {}
	ctx = getContext('2d')
	visible
	prev = 0
	first = false
	started = false

	# ----------------------------------------------------------
	def frame
		window.requestAnimationFrame(frame.bind(self)) if visible
		return if prev == ratio or !sprites.sheet
		prev = ratio

		ctx.clearRect(0, 0, width, height)
		return if ratio == 0 and !first
		let frame = sprites.count * ratio
		frame = 1 if ratio == 0 and first
		const sprite = json.frames[Math.ceil(frame)]
		ctx.drawImage(sprites.sheet, sprite.frame.x, sprite.frame.y, sprite.frame.w, sprite.frame.h, sprite.sprite.x, sprite.sprite.y, sprite.frame.w, sprite.frame.h)


	# ----------------------------------------------------------
	def mount
		sprites.image = new Image
		sprites.image.src = src.url

		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			if !started
				started = true
				prev = -1
			window.requestAnimationFrame(frame.bind(self)) if visible

		sprites.image.addEventListener 'load', do
			sprites.count = Object.keys(json.frames).length
			window.createImageBitmap(sprites.image).then do |bitmap| 
				sprites.sheet = bitmap
				observer.observe(self)
					
	# ----------------------------------------------------------
	def render
		<self>
			css
				w: 100% h: 100vh