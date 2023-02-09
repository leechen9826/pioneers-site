export class Scroller
	binds = {}
	
	# -----------------------------------------------------------
	def constructor
		window.window.addEventListener "scroll", do |event| scroll!
		window.window.addEventListener "resize", do |event| scroll(true)

	# -----------------------------------------------------------
	def add name, block, options = {}
		console.log "Scroller: the block is already added {name} " if binds[name]

		binds[name] = 
			view: options..view || 'bottom'	# bottom / top the screen side 
			gap: options..gap || do 0			# pixels to move to the center of the screen from the screen side
			height: options..height || do 100	# pixels to move from the gap to the center of the screen from the gap
			edge: options..edge || 'bottom'		# the border of the html element with is monitored
			from: options..from || 0			# the starting value of the final ratio
			to: options..to || 1				# the finish value of the final ratio
			html: block
			ratio: options..from || 0
			log: options..log

	# -----------------------------------------------------------
	def scroll force = false
		for own name, bind of binds
			let calc = calculate(bind)
			if bind.enter and !bind.entered and bind.ratio in [0,1] and calc.ratio > 0 and calc.ratio < 1
				bind.enter!
				binds[name].entered = true
				binds[name].leaved = false
			elif bind.leave and !bind.leaved and bind.ratio > 0 and bind.ratio < 1 and calc.ratio in [0,1]
				bind.leave!
				binds[name].entered = false
				binds[name].leaved = true

			if calc.dirty or force
				bind.ratio = calc.ratio
				imba.commit!
			
	# -----------------------------------------------------------
	def get name
		let bind = binds[name]
		return 0 if !bind
		const ratio = bind.from > bind.to ? 1 - bind.ratio : bind.ratio
		const res = Math.min(bind.from, bind.to) + Math.abs(bind.from - bind.to) * ratio
		console.log res if bind.log
		return res

	# -----------------------------------------------------------
	def enter name, fn
		if binds[name]
			binds[name].enter = fn

	# -----------------------------------------------------------
	def leave name, fn
		if binds[name]
			binds[name].leave = fn

	# -----------------------------------------------------------
	def calculate bind
		let res = {up: 0, down: 0, line: 0, ratio: 0, dirty: false}
		if bind.edge == 'bottom'
			res.line = bind.html.getBoundingClientRect!.top + document.documentElement.scrollTop + bind.html.clientHeight
		else
			res.line = bind.html.getBoundingClientRect!.top + document.documentElement.scrollTop

		if bind.view == 'bottom'
			res.down = window.scrollY + window.innerHeight - bind.gap!
			res.up = res.down - bind.height!
		else
			res.up = window.scrollY + bind.gap!
			res.down = res.up + bind.height!
		
		const line = res.down - res.line
		if line <= 0
			return res if bind.ratio == 0
			res.ratio = 0
			res.dirty = true
			return res
		if line >= res.down - res.up
			return res if bind.ratio == 1
			res.ratio = 1
			res.dirty = true
			return res
		res.ratio = line / (res.down - res.up)
		res.dirty = true
		return res

	# -----------------------------------------------------------
	def zone name
		let bind = binds[name]
		return calculate(bind) if bind
		return {up: 0, down: 0, line: 0, ratio: 0, dirty: false}

# -----------------------------------------------------------
# -----------------------------------------------------------
# -----------------------------------------------------------
export tag Zone
	scroller
	name = ''
	ctx
	whole = false
	
	def draw
		if !name 
			console.log "Zone: no name assigned" 
			return
		if !scroller
			console.log "Zone: no scroller assigned {name}"
			return

		const data = scroller.zone(name)
		ctx.clearRect(0, 0, $zone.width, $zone.height)
		ctx.beginPath!
		ctx.lineWidth = "6";
		ctx.strokeStyle = "red";
		ctx.moveTo(0, data.line)
		ctx.lineTo($zone.width, data.line)
		ctx.stroke!
		ctx.fillStyle = 'rgba(255,50,50,0.3)'
		ctx.rect(0, data.up, $zone.width, data.down - data.up)
		ctx.fill!
		if whole
			ctx.beginPath!
			ctx.fillStyle = 'rgba(205,60,60,0.3)'
			ctx.rect(0, 0, $zone.width, $zone.height)
			ctx.fill!
		ctx.beginPath!
		ctx.fillStyle = 'rgba(255,0,0,1)'
		ctx.rect(0, data.line - 20, 58, 20)
		ctx.fill!
		ctx.beginPath!
		ctx.font = "24px serif"
		ctx.fillStyle = 'rgba(255,255,255,1)'
		ctx.fillText(" {scroller.get(name).toFixed(2)}", 0, data.line)
		ctx.fill!
		window.requestAnimationFrame(draw.bind(self))
	
	def mount
		$zone.width = window.innerWidth
		$zone.height = document.body.scrollHeight
		ctx = $zone.getContext("2d")
		draw!
		
	def render
		<self>
			<global>
				<div>
					css
						zi: 1000
						d: block
						of: hidden
						pos: absolute t: 0 l: 0 r: 0
						p: 0 m: 0
					<canvas$zone>
						css
							d: block
							p: 0 m: 0