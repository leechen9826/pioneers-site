import UAParser from 'ua-parser-js'

let parser = new UAParser(navigator.userAgent)
let macFirefox = (parser.getResult!.browser.name == 'Firefox' and parser.getResult!.os.name == 'Mac OS') or parser.getResult!.device.type in ['mobile', 'tablet']

export tag Planet < canvas
	ctx
	layers = []
	count = 50
	speed = 5
	planet = {loaded: false}
	shine = {loaded: false}
	opacity-speed = .005
	visible
	last = 0
	windowheight = window.innerHeight
	
	# --------------------------------------------------------
	def frame current
		window.requestAnimationFrame(frame.bind(self)) if visible
		return if current < last + 100

		last = current
		if shine.loaded and planet.loaded
			if !macFirefox
				ctx.clearRect(0, 0, width, height)
				for layer, idx in layers
					layer.shift += 0.025 * speed * Math.random! * (idx % 2 == 0 ? 1 : -1)
					layer.opacity += Math.random! * opacity-speed * 2 - opacity-speed
					layer.opacity -= opacity-speed if layer.opacity >= .8
					layer.opacity += opacity-speed if layer.opacity <= .2
					
					ctx.save!
					ctx.translate(width / 2, planet.center)
					ctx.rotate((Math.PI / 180) * layer.shift)
					ctx.globalAlpha = layer.opacity
					ctx.drawImage($shine, - layer.size / 2, - layer.size / 2, layer.size, layer.size)
					ctx.restore!
			ctx.drawImage($planet, window.innerWidth / 2 - planet.width / 2, windowheight - planet.height, planet.width, planet.height)
		
	# --------------------------------------------------------
	def resize
		width = window.innerWidth
		height = windowheight
		planet.height = windowheight * 0.35
		planet.width = planet.height * $planet.width / $planet.height
		planet.center = 1.35 * windowheight
		shine.min = 2 * (planet.center - windowheight + planet.height) + 150
		shine.max = 1.4 * shine.min
		
		for layer in layers
			layer.size = Math.random! * (shine.max - shine.min) + shine.min
	
	# --------------------------------------------------------
	def mount
		window.addEventListener 'resize', do resize!
		ctx = getContext('2d')
		ctx.imageSmoothingEnabled = false
		for i in [0 ... count]
			layers.push
				shift: i * (30 / count)
				grow: Math.random! >= 0.5
				opacity: Math.random! * .45 + .45
		
		$shine.addEventListener 'load', do shine.loaded = true
		$planet.addEventListener 'load', do	planet.loaded = true; resize!

		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			window.requestAnimationFrame(frame.bind(self)) if visible
		observer.observe(self)
	
	# --------------------------------------------------------
	def render
		<self [w:100% h:100vh]>
			<img$shine src='./media/intro-shine.webp' [d: none]>
			<img$planet src='./media/intro-planet.webp' [d: none]>