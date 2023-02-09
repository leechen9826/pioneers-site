export tag MaskSVG < canvas
	ratio = 0
	ctx = getContext('2d')
	img = new Image
	prev
	color = 'rgba(18, 5, 25, 1)'
	zoom = {max: 65, min: 1, top: 6200, left: 1700, padding: 80}
	visible

	# ----------------------------------------------------------
	def resize
		# width = window.innerWidth
		# height = window.innerHeight
		frame(true)
		
	# ----------------------------------------------------------
	def frame force = false
		window.requestAnimationFrame(frame.bind(self)) if visible
		
		return if prev == ratio and !force
		prev = ratio

		ctx.clearRect(0,0,width,height)
		# ctx.globalCompositeOperation = 'xor'
		# ctx.fillStyle = color
		# ctx.fillRect(0, 0, width, height)

		const factor = (1 - ratio) * (zoom.max - zoom.min) + zoom.min
		let left = zoom.left * (1 - ratio)
		let top = zoom.top * (1 - ratio)
		let w = factor * img.width
		let h = factor * img.height
		if window.innerWidth < img.width + zoom.padding
			w = w * window.innerWidth / img.width - zoom.padding
			h = w * img.height / img.width
			left *= w / (factor * img.width)
			top *=  h / (factor * img.height)
		
		const x = Math.round((window.innerWidth - w) / 2 + left)
		const y = Math.round((window.innerHeight - h) / 2 + top)
		# h = Math.round(h)
		# w = Math.round(w)

		ctx.drawImage(img, x, y, w, h)
		return if (height - h) / 2 + top + 1 < 0 and w > width
		ctx.fillStyle = color
		ctx.fillRect(0, 0, x, height)
		ctx.fillRect(x, 0, w, (height - h) / 2 + top + 1)
		ctx.fillRect(x, y + h - 1, w, (height - h) / 2 + 1)
		ctx.fillRect(x + w, 0, x, height)

	# ----------------------------------------------------------
	def mount
		window.addEventListener 'resize', do resize!
		img.onload = do	frame!
		img.src = data.url
		resize!
		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			window.requestAnimationFrame(frame.bind(self)) if visible
		observer.observe(self)

	# ----------------------------------------------------------
	def render
		<self [w:100% h:100vh]>				