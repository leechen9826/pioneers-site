export tag Playloop < canvas
	src = {}
	json = {}
	height=0
	width=0
	sprites = {}
	ctx = getContext('2d')
	visible
	cur = 1
	grow = true

	# ----------------------------------------------------------
	def frame
		window.requestAnimationFrame(frame.bind(self)) if visible

		ctx.clearRect(0, 0, width, height)
		if grow 
			cur++
		else
			cur--
		if cur > sprites.count
			grow = false
			cur--
		elif cur < 1
			grow = true
			cur++
		const sprite = json.frames[cur]
		ctx.drawImage(sprites.sheet, sprite.frame.x, sprite.frame.y, sprite.frame.w, sprite.frame.h, sprite.sprite.x, sprite.sprite.y, sprite.frame.w, sprite.frame.h)


	# ----------------------------------------------------------
	def mount
		sprites.image = new Image
		sprites.image.src = src.url

		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
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