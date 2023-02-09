import {Discord, Twitter, Bracket} from './icons.imba'
// @ts-ignore
import key from './media/access-keys.mp4'
// @ts-ignore
import key-poster from './media/access-keys.webp'
// @ts-ignore
import burn from './media/spaceship-burning.webm'
# // @ts-ignore
# import burn-poster from './media/spaceship-burning.webp'
// @ts-ignore
import spaceship-strategy from './media/spaceship-strategy.webm'
// @ts-ignore
import spaceship-strategy-poster from './media/spaceship-strategy.webp'
// @ts-ignore
import keyA from './media/access-key-a.webp'
// @ts-ignore
import keyB from './media/access-key-b.webp'
// @ts-ignore
import keyC from './media/access-key-c.webp'
// @ts-ignore
import keyD from './media/access-key-d.webp'
// @ts-ignore
import spaceship from './media/spaceship.webp'
// @ts-ignore
import capsule from './media/loot-capsule.webp'
// @ts-ignore
import astonit from './media/astonit.webp'
// @ts-ignore
import energon from './media/energon.webp'
// @ts-ignore
import prize from './media/prize-coins.mp4'
// @ts-ignore
import prize-poster from './media/prize-coins.webp'

import mask from './media/pioneer-program.svg'

import THREE from 'three'
import UAParser from 'ua-parser-js'

import {Scroller, Zone} from './scroller.imba'
import {Dust} from './dust.imba'
import {Planet} from './planet.imba'
import {Play} from './play.imba'
import {MaskSVG} from './masksvg.imba'

// @ts-ignore
import spaceship1 from './media/spaceship1.webp'
import spaceship1json from './json/spaceship1.json'
// @ts-ignore
import spaceship2 from './media/spaceship2.webp'
import spaceship2json from './json/spaceship2.json'
// @ts-ignore
import spaceship3 from './media/spaceship3.webp'
import spaceship3json from './json/spaceship3.json'
// @ts-ignore
import spaceship4 from './media/spaceship4.webp'
import spaceship4json from './json/spaceship4.json'
// @ts-ignore
import spaceship5 from './media/spaceship5.webp'
import spaceship5json from './json/spaceship5.json'
// @ts-ignore
import spaceship6 from './media/spaceship6.webp'
import spaceship6json from './json/spaceship6.json'
// @ts-ignore
import prelaunch from './media/prelaunch.webp'
import prelaunchjson from './json/prelaunch.json'
// @ts-ignore
import burning from './media/spaceship-burning.webp'
import burningjson from './json/spaceship-burning.json'

import clouds from './media/cloud10.png'

let parser = new UAParser(navigator.userAgent)
let mobile = parser.getResult!.device.type in ['mobile', 'tablet'] ? true : false
let top = 'top'
let bottom = 'bottom'

let scroller = new Scroller

window.onbeforeunload = do
	window.scrollTo(0,0)

let screen = 
	height: mobile ? window.screen.height : window.innerHeight
	width: window.innerWidth

window.addEventListener 'resize', do
	return if mobile
	screen.height = mobile ? window.screen.height : window.innerHeight
	screen.width = window.innerWidth
	imba.commit!

css html
	ff: 'Montserrat'
	c: #AD8EBB
	bg: rgba(18, 5, 25, 1)
	body
		pos: relative
		m: 0
		bg: rgba(18, 5, 25, 1)
		# scroll-behavior: smooth
	h2
		pos: relative
		m: 0
		c: #ffffff
		fs: 64px lh: 72px fw: 700
		!@640
			fs: 32px lh: 40px
	h3
		pos: relative
		m: 0
		fs: 64px !@640: 40px !@420: 32px
		lh: 1em fw: 400 tt: uppercase
		bg: linear-gradient(264.25deg, #FE039A 0.9%, #4E01FF 98.42%)
		background-clip: text
		text-fill-color: transparent
		-webkit-background-clip: text
		-webkit-text-fill-color: transparent
		::selection
			background: transparent
	h4
		m: 0
		fw: 600 fs: 40px lh: 40px
		tt: uppercase
		bg: linear-gradient(264.25deg, #FE039A 0.9%, #4E01FF 98.42%)
		-webkit-background-clip: text
		-webkit-text-fill-color: transparent
		background-clip: text
		text-fill-color: transparent
	h5
		m: 0
		fs: 13px fw: 800 lh: 24px ls: 0.02em tt: uppercase
		c: #FFFFFF
		text-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25)
	h6
		d: flex fld: column g: 4px
		m: 0
		ff: 'Roboto Condensed'
		fs: 16px lh: 16px fw: 500 tt: uppercase
		c: #ffffff
		white-space: nowrap
		span
			fs: 10px lh: 10px fw: 600
			c: #5C3D6D
		&.light
			c: #402151
	p
		m: 0
		# fs: max(1.4cqw, 16px)
		fs: 20px !@640: 16px
		lh: 1.6em fw: 500
		&.dark c: #53007C fw: 700
	i
		m: 0
		d: block
		fs: 16px fw: 500 lh: 1.7em
		c: #ffffff font-style: normal
		&.dark c: #53007C
		&.color
			p: 20px 24px
			fw: 600
			bd: 4px
			border-style: solid
			border-image: linear-gradient(254.07deg, #F8059E 0%, #5403FC 100%) 1 1 1 1
			bg: linear-gradient(254.07deg, #F8059E 0%, #5403FC 100%)
			-webkit-background-clip: text
			-webkit-text-fill-color: transparent
			background-clip: text
			text-fill-color: transparent
	a
		m: 0
		text-decoration: none
		&:hover i c: #8F04DB
	p, i, a
		::selection
			color: #120519
			background: #ffffff
	img
		d: block
	.animated
		o: 0
		transform: translateY(100px)
		animation: out ease 0.5s backwards
		&.in
			animation: in ease .5s forwards
		@keyframes in
			to transform: translateY(0px) o: 1
		@keyframes out
			from transform: translateY(0px) o: 1

css .content
	zi: 2
	pos: relative
	w: calc(100% - 80px) <960px
	m: auto p: 0 40px
	d: flex flw: wrap g: 80px 120px !@420: 40px 80px
	&.block
		pos: relative
		flw: wrap-reverse
		w: calc(100vw - 320px) <960px !@640: calc(100vw - 240px) !@420: calc(100vw - 120px)
		p: 120px !@640: 80px !@420: 40px
		m: 200px auto !@640: 120px auto
		bg: rgba(57, 17, 77, 0.07)
		bg: radial-gradient(ellipse farthest-side at 100% 0%, rgba(57, 17, 77, .25), rgba(18, 5, 25, 1))
		overflow: hidden
		&:before
			zi: 1
			content: ''
			pos: absolute r: -40px !@420: -30px t: -40px !@420: -30px
			s: 80px !@420: 60px
			transform: rotateZ(-45deg)
			bdl: solid 1px #39114D
			bgc: #120519
			bgi: url('./media/bracket.svg')
			bgr: no-repeat
			bgp: 4px 50%
			bgs: auto !@420: 10%
		&:after
			content: ''
			pos: absolute l: 0 r: 0 t: 0 b: 0
			bd: solid 1px #39114D
	.column
		pos: relative
		flex: 1 1 min-content
		d: flex fld: column g: 40px !@420: 24px ai: start
	.stroke
		pos: relative
		flex: 1 1 min-content
		d: flex fld: column g: 40px !@420: 24px ai: start

css .quote
	pos: relative
	d: flex g: 24px ai: start
	pt: 64px !@420: 44px
	mt: 20px
	&:before
		content: ''
		pos: absolute l: 0 t: 0
		w: 100% h: 1px
		bg: rgba(57, 17, 77, 0.55)
		bg: #39114D
	img
		d: block
		s: 48px
		m: 2px 0

tag IntroBack
	css self
		zi: 4
		pos: absolute l: 0 t: 0 b: 0 r: 0
		# w: 100%
		# object-fit: cover
		.darkness
			zi: 800
			pos: absolute l: 0 b: 0 r: 0
			w: 100% h: 30%
			bg: linear-gradient(to top, rgba(16, 5, 23, 1) 7%, rgba(16, 5, 23, 0))
		img
			d: block
			w: 100vw h: 100vh
			object-fit: cover
		.canvas
			zi: 700
			pos: absolute l: 0 t: 0 b: 0 r: 0
			w: 100%
			object-fit: cover

	def render
		<self>
			<.darkness>
			<img src='./media/intro-bg.webp' [h: {screen.height}px]>
			<Planet.canvas windowheight=screen.height>
			<Dust.canvas count=(mobile ? 50 : 100)>

tag Intro
	css self
		zi: 1000
		m: 0 p: 0 m: auto
		.content
			flw: nowrap
		.video-container
			pos: relative
			bg: #120519
			.video-sticky
				pos: sticky t: 0
				of: hidden
				h: 100vh
				.spaceship
					zi: 11
					pos: absolute
					l: 0 t: 0 b: 0 r: 0
					object-fit: cover
				.shine-box
					zi: 799
					pos: absolute l: 0 t: 0 r: 0 b: 0 m: 0 auto
					w: calc(100% - 80px) <1200px !@420: calc(100% - 80px) <100%
					h: 100vh
					img
						pos: absolute l: 0 t: 0 r: 0 b: 0
						d: block w: 100% h: auto
						visibility: hidden
					.shine
						d: none
						pos: absolute l: -50% r: 0
						o: 0.1
						w: 160px h: 90%
						transform: skewX(-35deg)
						bg: linear-gradient(to right, rgba(255,255,255,0), rgba(255,255,255,1) 20px, rgba(255,255,255,1) 140px, rgba(255,255,255,0))
						&.shines
							d: block
							animation: shine-move ease-in-out 1s forwards
						@keyframes shine-move
							from l: -50%
							to l: 150%
		.pioneers
			d: block
			w: calc(100% - 80px) <1200px
			m: auto
			mt: 40px
			>>> svg
				d: block
				s: 100%
				fill: white
		.subtext
			# zi: 1000
			# pos: absolute b: 0 l: 0 r: 0
			w: calc(100% - 80px) <960px !@420: calc(100% - 40px) <100%
			p: 0 40px !@420: 0 20px
			m: auto
			mb: 200px
			&.mobile
				pos: relative
				mt: 40px
				mb: 120px
			p
				d: block
				ta: center
				width: 100% <800px
				m: auto
		.media
			zi: 1000
			pos: absolute l: 0 t: 0 r: 0 m: auto
			# h: 500vh
			&.disable
				d: none
				visibility: hidden
			.media-box
				pos: sticky t: 0
				# b: 280px
				ai: center
				d: flex fld: column jc: space-between ai: stretch
				h: calc(100vh - 40px - 10vh) !@420: calc(100vh - 20px - 15vh)
				p: 40px !@420: 20px
				m: auto
				.logo-box
					d: flex fld: column g: 64px ai: center
					mb: 15vh !@420: 0
					.logo
						pos: relative
						s: 120px
						img
							w: 100%
							object-fit: cover
							o: 1
							mix-blend-mode: overlay
							&:last-child
								pos: absolute t: 0 l: 0
								o: 0
								mix-blend-mode: overlay
					.name
						d: flex fld: column ai: center g: 20px
						p: 0 40px
						img
							w: 100%
							min-width: 300px # @!380: 300px
							t: 48%
						.slogan
							zi: 100
							w: 100%
							d: flex jc: center
							pos: relative
							fs: 10px lh: 20px fw: 500 ls: 1em tt: uppercase ta: center
							&:before
								content: 'New world that shines'
								pos: absolute
								fs: 12px lh: 20px fw: 500 ls: 0.8em tt: uppercase ta: center
								o: .2
								filter: blur(1px)
				.more
					d: flex fld: column g: 24px ai: center
					>>> svg
						of: visible
						s: 24px
						fill: none
						stroke: #ffffff
						stroke-width: 2px
						stroke-linecap: round
						stroke-linejoin: round
						animation: arrow-blinking linear 2s infinite
					@keyframes arrow-blinking
						0% transform: translateY(-30px) o: 0
						15% transform: translateY(-19px) o: 1
						25% transform: translateY(-11px) o: 1
						40% transform: translateY(0px) o: 0
						100% transform: translateY(0px) o: 0
					i
						fs: 11px fw: 700 lh: 24px tt: uppercase ta: center
				.buttons
					zi: 100
					d: flex jc: space-between g: 16px
					visibility: hidden
					.burger
						cursor: pointer
						pos: relative
						d: flex ai: center jc: space-between
						s: 24px 32px
						p: 0 4px
						transform: rotateZ(90deg)
						&:before
							content: ''
							pos: absolute t: 0 b: 0 l: 0 r: 0 m: auto
							w: 2px h: 24px
							rd: 2px
							bg: #ffffff
							tween: ease-in-out 0.2s
						>>> svg
							d: block
							s: 4px 32px
							fill: #ffffff
						&:hover
							&:before
								h: 32px
					button
						cursor: pointer
						pos: relative
						d: flex ai: center jc: space-between
						ff: 'Montserrat' c: #ffffff
						fs: 11px fw: 700 lh: 12px ls: 0.15em tt: uppercase ta: center
						w: 100% <180px
						m: 0 p: 0
						ol: none
						bd: none
						bg: none
						tween: ease-in-out .25s
						>>> svg
							d: block
							s: 4px 32px
							fill: #ffffff
						&:hover
							ls: .4em !@420: 0.2px
	def setup
		scroller.add('introLogo',	self,	{view: top,		edge: top, 		gap: (do -screen.height), 			height: (do screen.height)})
		scroller.add('introText',	self,	{view: bottom, 	edge: bottom, 	gap: (do screen.height * 0.2),		height: (do screen.height * 0.2)})
		scroller.add('introTextMobile',	self,	{view: bottom, 	edge: bottom, 	gap: (do screen.height * 0.01),	height: (do screen.height * 0.2)})
		scroller.add('introShine',	self,	{view: bottom, 	edge: bottom, 	gap: (do screen.height * 0.15), 	height: (do 0)})
		
		scroller.add('introMask',	self,	{view: bottom, 	edge: top,		gap: (do 0),		 				height: (do screen.height * 4.6)})
		scroller.add('introMaskMobile',	$pioneers,	{view: bottom, 	edge: top,		gap: (do 0),	height: (do screen.height * 0.3)})

		scroller.add('spaceship1', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 2.0), 		height: (do screen.height * 0.5)})
		scroller.add('spaceship2', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 2.3), 		height: (do screen.height * 0.5)})
		scroller.add('spaceship3', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 2.7), 		height: (do screen.height * 0.5)})
		scroller.add('spaceship4', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 3.0), 		height: (do screen.height * 0.5)})
		scroller.add('spaceship5', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 3.3), 		height: (do screen.height * 0.5)})
		scroller.add('spaceship6', 	self,	{view: bottom, 	edge: top,		gap: (do screen.height * 3.6), 		height: (do screen.height * 0.5)})

	def render
		<self>
			<.media .disable=(scroller.get('introLogo') > .95)>
				css
					o: {1 - scroller.get('introLogo')}
					h: {2 * screen.height}px
				<.media-box>
					<.buttons>
						css
							transform: translateY({scroller.get('introLogo') * -60}px)
						<.burger>
							<Bracket>
							<Bracket[transform: scaleX(-1)]>
						<button>
							<Bracket>
							'Launch App'
							<Bracket[transform: scaleX(-1)]>
					<.logo-box>
						<.logo>
							<img src='./media/logo.webp'>
							<img src='./media/logo.webp'>
						<.name>
							<img src='./media/elysium.webp'>
							<.slogan> 'New world that shines'
					<.more>
						css
							transform: translateY({scroller.get('introLogo') * 120}px)
						<svg viewBox="0 0 24 24">
							<path d="M12,1 L12,24">
							<path d="M1,12 L1,14 L12,24 L24,14 L24,12">
						<i> 'Scroll down'
							<br>
							'to start your journey'
			<.video-container[mih: {screen.height * (mobile ? 3.6 : 4.7)}px]>
				<.video-sticky>
					if !mobile
						<MaskSVG data=mask ratio=scroller.get('introMask') width=screen.width height=screen.height zoom={max: 65, min: 1, top: 6200, left: 1700, padding: 80}>
							css
								zi: 800
								pos: absolute l: 0 t: 0 b: 0 r: 0
					<Play.spaceship src=spaceship1 json=spaceship1json width=1600 height=840 ratio=scroller.get('spaceship1')>
					<Play.spaceship src=spaceship2 json=spaceship2json width=1600 height=840 ratio=scroller.get('spaceship2')>
					<Play.spaceship src=spaceship3 json=spaceship3json width=1600 height=840 ratio=scroller.get('spaceship3')>
					<Play.spaceship src=spaceship4 json=spaceship4json width=1600 height=840 ratio=scroller.get('spaceship4')>
					<Play.spaceship src=spaceship5 json=spaceship5json width=1600 height=840 ratio=scroller.get('spaceship5')>
					<Play.spaceship src=spaceship6 json=spaceship6json width=1600 height=840 ratio=scroller.get('spaceship6')>
					<IntroBack>
					<.shine-box> if !mobile
						<.shine .shines=scroller.get('introShine')>
						<img$shineimage src=('./media/pioneer-program.svg')>
			if mobile
				<$pioneers .pioneers>
					css
						o: {scroller.get('introMaskMobile')}
						transform: translateY({(1 - scroller.get('introMaskMobile')) * 50}px)
					<svg viewBox="0 0 1200 377" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M0 4.04383V180.956H59.6075V137.486H85.1175C101.451 137.486 115.679 134.791 127.803 129.399C139.926 124.007 149.271 116.257 155.838 106.148C162.405 96.0384 165.689 84.2442 165.689 70.7652C165.689 57.2861 162.405 45.4919 155.838 35.3826C149.271 25.2733 139.926 17.5229 127.803 12.1313C115.679 6.73964 101.451 4.04383 85.1175 4.04383H0ZM0 220.497V373.503H51.6269V335.907H73.7215C87.8679 335.907 100.191 333.576 110.692 328.913C121.192 324.25 129.286 317.547 134.974 308.803C140.662 300.06 143.505 289.86 143.505 278.202C143.505 266.545 140.662 256.344 134.974 247.601C129.286 238.858 121.192 232.155 110.692 227.492C100.191 222.829 87.8679 220.497 73.7215 220.497H0ZM403.892 377H403.551C387.14 376.976 372.394 373.552 359.314 366.727C346.188 359.878 335.907 350.406 328.469 338.312C321.031 326.071 317.312 312.301 317.312 297C317.312 281.7 321.031 268.002 328.469 255.907C335.907 243.667 346.188 234.122 359.314 227.273C372.439 220.425 387.242 217 403.722 217C420.202 217 435.004 220.425 448.13 227.273C461.255 234.122 471.537 243.667 478.975 255.907C486.412 268.002 490.131 281.7 490.131 297C490.131 312.301 486.412 326.071 478.975 338.312C471.537 350.406 461.255 359.878 448.13 366.727C435.049 373.552 420.304 376.976 403.892 377ZM588.449 377H588.108C571.843 376.977 557.242 373.625 544.308 366.945C531.328 360.097 521.12 350.625 513.682 338.53C506.39 326.29 502.744 312.446 502.744 297C502.744 281.554 506.39 267.783 513.682 255.689C521.12 243.448 531.401 233.976 544.527 227.273C557.798 220.425 572.747 217 589.372 217C604.394 217 617.811 219.55 629.624 224.65C641.583 229.605 651.5 236.891 659.375 246.508L626.342 275.579C616.717 264.359 605.269 258.749 591.997 258.749C580.622 258.749 571.58 262.173 564.871 269.022C558.163 275.871 554.809 285.197 554.809 297C554.809 308.512 558.09 317.765 564.653 324.76C571.361 331.754 580.257 335.251 591.341 335.251C597.904 335.251 604.175 334.013 610.154 331.536V292.847H655V357.547C645.958 363.812 635.457 368.621 623.499 371.973C611.599 375.308 599.915 376.984 588.449 377ZM1200 180.956L1162.87 126.366C1173.65 120.806 1181.9 113.308 1187.62 103.873C1193.35 94.4377 1196.21 83.4018 1196.21 70.7652C1196.21 57.2861 1192.93 45.4919 1186.36 35.3826C1179.79 25.2733 1170.45 17.5229 1158.33 12.1313C1146.2 6.73964 1131.97 4.04383 1115.64 4.04383H1030.52V180.956H1090.13V136.476H1106.29L1136.35 180.956H1200ZM1200 373.503H1152.97L1152.53 303.776L1119.28 359.732H1096.53L1063.28 306.18V373.503H1016.24V220.497H1058.68L1108.56 302.027L1157.12 220.497H1199.56L1200 373.503ZM366.235 185C347.207 185 330.117 181.041 314.962 173.122C299.808 165.203 287.937 154.251 279.349 140.267C270.762 126.114 266.468 110.191 266.468 92.5001C266.468 74.8089 270.762 58.971 279.349 44.9865C287.937 30.8335 299.808 19.7975 314.962 11.8785C330.117 3.95959 347.207 0.00012207 366.235 0.00012207C385.262 0.00012207 402.353 3.95959 417.507 11.8785C432.662 19.7975 444.533 30.8335 453.12 44.9865C461.708 58.971 466.001 74.8089 466.001 92.5001C466.001 110.191 461.708 126.114 453.12 140.267C444.533 154.251 432.662 165.203 417.507 173.122C402.353 181.041 385.262 185 366.235 185ZM366.235 136.728C373.643 136.728 380.295 134.959 386.188 131.421C392.25 127.714 397.049 122.575 400.585 116.004C404.121 109.265 405.889 101.43 405.889 92.5001C405.889 83.5703 404.121 75.8198 400.585 69.2488C397.049 62.5092 392.25 57.3703 386.188 53.8321C380.295 50.1253 373.643 48.272 366.235 48.272C358.826 48.272 352.09 50.1253 346.029 53.8321C340.135 57.3703 335.421 62.5092 331.885 69.2488C328.349 75.8198 326.58 83.5703 326.58 92.5001C326.58 101.43 328.349 109.265 331.885 116.004C335.421 122.575 340.135 127.714 346.029 131.421C352.09 134.959 358.826 136.728 366.235 136.728ZM99.5143 86.1818C95.4731 89.7201 89.4113 91.4892 81.3289 91.4892H59.6075V50.0411H81.3289C89.4113 50.0411 95.4731 51.8945 99.5143 55.6012C103.555 59.1395 105.576 64.1941 105.576 70.7652C105.576 77.3362 103.555 82.4751 99.5143 86.1818ZM185.238 4.04383H244.845V180.956H185.238V4.04383ZM661.912 180.956V4.04383H603.82V84.4127L536.635 4.04383H487.636V180.956H545.728V100.588L612.913 180.956H661.912ZM837.631 180.956V135.97H749.23V112.719H823.992V69.7542H749.23V49.0302H834.347V4.04383H690.633V180.956H837.631ZM1007.58 180.956V135.97H919.175V112.719H993.937V69.7542H919.175V49.0302H1004.29V4.04383H860.578V180.956H1007.58ZM1130.04 55.6012C1134.08 59.1395 1136.1 64.1941 1136.1 70.7652C1136.1 77.3362 1134.08 82.4751 1130.04 86.1818C1126 89.7201 1119.93 91.4892 1111.85 91.4892H1090.13V50.0411H1111.85C1119.93 50.0411 1126 51.8945 1130.04 55.6012ZM403.722 335.251C410.139 335.251 415.899 333.721 421.004 330.661C426.254 327.455 430.41 323.011 433.473 317.328C436.535 311.499 438.067 304.723 438.067 297C438.067 289.277 436.535 282.574 433.473 276.891C430.41 271.062 426.254 266.618 421.004 263.558C415.899 260.352 410.139 258.749 403.722 258.749C397.305 258.749 391.471 260.352 386.221 263.558C381.117 266.618 377.033 271.062 373.971 276.891C370.908 282.574 369.377 289.277 369.377 297C369.377 304.723 370.908 311.499 373.971 317.328C377.033 323.011 381.117 327.455 386.221 330.661C391.471 333.721 397.305 335.251 403.722 335.251ZM70.4401 296.126C77.4404 296.126 82.6906 294.596 86.1908 291.536C89.6909 288.33 91.4409 283.885 91.4409 278.202C91.4409 272.519 89.6909 268.148 86.1908 265.088C82.6906 261.882 77.4404 260.279 70.4401 260.279H51.6269V296.126H70.4401ZM212.064 335.033H226.064L252.097 373.503H307.224L275.066 326.29C284.4 321.481 291.546 314.996 296.505 306.836C301.463 298.676 303.942 289.131 303.942 278.202C303.942 266.545 301.098 256.344 295.411 247.601C289.723 238.858 281.629 232.155 271.129 227.492C260.628 222.829 248.305 220.497 234.158 220.497H160.437V373.503H212.064V335.033ZM246.628 265.088C250.128 268.148 251.878 272.519 251.878 278.202C251.878 283.885 250.128 288.33 246.628 291.536C243.128 294.596 237.877 296.126 230.877 296.126H212.064V260.279H230.877C237.877 260.279 243.128 261.882 246.628 265.088ZM742.624 335.033H728.624V373.503H676.997V220.497H750.718C764.865 220.497 777.188 222.829 787.689 227.492C798.189 232.155 806.283 238.858 811.971 247.601C817.659 256.344 820.502 266.545 820.502 278.202C820.502 289.131 818.023 298.676 813.065 306.836C808.106 314.996 800.96 321.481 791.626 326.29L823.784 373.503H768.657L742.624 335.033ZM768.438 278.202C768.438 272.519 766.688 268.148 763.188 265.088C759.688 261.882 754.437 260.279 747.437 260.279H728.624V296.126H747.437C754.437 296.126 759.688 294.596 763.188 291.536C766.688 288.33 768.438 283.885 768.438 278.202ZM890.155 346.836L879.874 373.503H827.372L894.312 220.497H945.064L1012 373.503H958.627L948.345 346.836H890.155ZM934.126 309.678L919.25 271.208L904.375 309.678H934.126Z" fill="url(#paint0_linear_2523_1567)"/>
						<defs>
							<linearGradient id="paint0_linear_2523_1567" x1="1200" y1="35.1328" x2="31.3936" y2="409.747" gradientUnits="userSpaceOnUse">
								<stop stop-color="#FE039A"/>
								<stop offset="1" stop-color="#4E01FF"/>
				<.subtext .mobile>
					<p> "Take part in the space race and, after reaching the finish line, become the initial validator of Elysium, who will receive a significant share of the unique blockchain's capitalization."
					css
						o: {scroller.get('introTextMobile')}
						transform: translateY({(1 - scroller.get('introTextMobile')) * 50}px)
			if !mobile
				<$subtext .subtext>
					css
						zi: 1000
						mt: {-(window.innerHeight - $shineimage.clientHeight) / 2 + 40}px
					<p> "Take part in the space race and, after reaching the finish line, become the initial validator of Elysium, who will receive a significant share of the unique blockchain's capitalization."
						css
							o: {scroller.get('introText')}
							transform: translateY({(1 - scroller.get('introText')) * 50}px)

tag Spaceship
	css self
		zi: 1000
		pos: relative
		d: flex fld: column g: 40px !@420: 24px
		bg: none
		of: hidden
		# pb: 50vh
		&:before
			content: ''
			pos: absolute l: 0 t: 0 r: 0 b: 0
			# bg: red
			# bg: rgba(18, 5, 25, 1)
		.content
			g: 80px !@420: 40px
			flw: wrap ai: start
			# bg: rgba(18, 5, 25, 1)
			.left
				# fl: 1 1 min-content
				d: flex ai: start fld: column g: 40px !@420: 24px jc: center
				w: 100% <488px
				.background
					pos: fixed l: 0 t: 0 b: 0 r: 0
					h: 100vh w: 100%
					object-fit: cover
				.cloud-box
					pos: relative
					w: 100% <488px
					.img-box
						zi: 1
						pos: absolute t: 0 l: 0 r: 0 b: 0 m: auto
						d: flex jc: center ai: center
						-webkit-mask-image: url('./media/spaceship-mask.png')
						mask-image: url('./media/spaceship-mask.png')
						-webkit-mask-repeat: no-repeat
						mask-repeat: no-repeat
						-webkit-mask-position: 50% 50%
						mask-position: 50% 50%
						-webkit-mask-size: 100% 100%
						mask-size: 100% 100%
						img w: 75% <400px h: auto
					.clouds
						w: 100% <512px
						-webkit-mask-image: url('./media/cloud.png')
						mask-image: url('./media/cloud.png')
						-webkit-mask-repeat: no-repeat
						mask-repeat: no-repeat
						-webkit-mask-size: cover
			.right
				pos: relative
				fl: 1 1 min-content
				d: flex flw: wrap g: 40px jc: start ac: center
				mb: 0px !@814: 0
				.param
					fl: 1 1 min-content
					.top-border
						d: flex jc: space-between ai: start
					.bottom-border
						d: flex jc: space-between ai: end
					>>> svg
						d: block w: 100% h: 1px
						stroke-width: 1px stroke: #39114D
					.param-content
						d: flex flw: wrap ai: start g: 24px
						p: 0 40px 0 40px !@420: 0 24px 8px 24px
						mt: 0 !@420: -16px
						bdl: 1px solid #39114D
						bdr: 1px solid #39114D
						img
							s: 48px
							fl: 0 1 min-content
							mt: 4px
						i fl: 1 1 180px

	params = [
		{icon: "./icons/engine.svg", text: 'Engine Efficiency determines the fuel consumption of your ship.'},
		{icon: "./icons/inertia.svg", text: 'Inertia Retention determines how long the ship will fly without fuel.'}
	]
	
	def mount
		scroller.add('spaceshipTitle',		$spaceshipTitle,	{view: bottom, gap: (do 0), 	height: (do 200), edge: bottom})
		scroller.add('spaceshipText1',		$spaceshipText1,	{view: bottom, gap: (do 0), 	height: (do 200), edge: bottom})
		scroller.add('spaceshipText2',		$spaceshipText2,	{view: bottom, gap: (do 100), 	height: (do 200), edge: bottom})
		scroller.add('spaceshipParam1',		$spaceshipText2,	{view: bottom, gap: (do 300), 	height: (do 200), edge: bottom})
		scroller.add('spaceshipParam2',		$spaceshipText2,	{view: bottom, gap: (do 300), 	height: (do 200), edge: bottom})
		scroller.add('spaceshipCloud',		$clouds,			{view: bottom, gap: (do 100), 	height: (do 400), edge: top})
		scroller.add('spaceshipSpaceship',	$clouds,			{view: bottom, gap: (do 200), 	height: (do 400), edge: top})

	def render
		<self>
			<.content>
				<h3$spaceshipTitle> 'Spaceship'
					css
						o: {scroller.get('spaceshipTitle')}
						transform: translateY({(1 - scroller.get('spaceshipTitle')) * 50}px)
			<.content>
				<.left>
					<p$spaceshipText1> "Get your spaceship NFT to take part in the race. The ship's parameters will significantly impact your place on the leaderboard and, as a result, your share of Elysium's capitalization."
						css
							o: {scroller.get('spaceshipText1')}
							transform: translateY({(1 - scroller.get('spaceshipText1')) * 75}px)
					<.cloud-box>
						<.img-box>
							<img src="./media/spaceship.webp">
								css
									transform: translateX({(1 - scroller.get('spaceshipSpaceship')) * 400}px) translateY({(1 - scroller.get('spaceshipSpaceship')) * -300}px)
						<$clouds .clouds>
							css
								o: {scroller.get('spaceshipCloud')}
								h: {$clouds.clientWidth}px
							<IntroBack.background>
				<.right>
					<p$spaceshipText2> 'Each Spaceship has two parameters: Engine Efficiency and Inertia Retention.'
						css
							w: 100% <420px
							o: {scroller.get('spaceshipText2')}
							transform: translateY({(1 - scroller.get('spaceshipText2')) * 75}px)
					for param, idx in params
						<.param>
							css
								transform: translateY({(1 - scroller.get("spaceshipParam{idx + 1}")) * (50 + idx * 50)}px)
								o: {scroller.get("spaceshipParam{idx + 1}")}
							<.top-border>
								<img src="./media/spaceship-left-top.svg">
								<svg>
									<line x1="0%" x2="100%" y1="0.5" y2="0.5">
								<img src="./media/spaceship-right-top.svg">
							<.param-content>
								<img src=param.icon>
								<i> param.text
							<.bottom-border>
								<img src="./media/spaceship-left-bottom.svg">
								<svg>
									<line x1="0%" x2="100%" y1="0.5" y2="0.5">
								<img src="./media/spaceship-right-bottom.svg">

tag SpaceDust < canvas

	context
	blured = false
	particles = []
	particlesNumber = mobile ? 50 : 150
	parent

	def mount
		width = parent.clientWidth
		height = parent.clientHeight * 2
		for i in [0 ... particlesNumber]
			particles.push createPart!
		draw!

	def createPart
		return
			x: Math.random! * width
			y: Math.random! * height
			r: Math.random! * 2
			o: Math.random!
			b: Math.floor(Math.random! * 1.5) + 1

	def draw
		for particle in particles
			context.beginPath!
			context.fillStyle = '#905AAB'
			context.globalAlpha = particle.o
			context.filter = "blur({particle.b}px)" if blured
			context.arc(particle.x, particle.y, particle.r, 0, Math.PI * 2)
			context.fill!

	def setup
		context = getContext('2d')

	def render
		<self>
			css
				pos: absolute t: 0 l: 0 r: 0

tag Resources
	css self
		zi: 1
		pos: relative
		.content
			m: 200px auto !@640: 120px auto
			ai: center
			jc: space-between
			.column
				zi: 1
				pos: relative
				w: 100% <520px
				jc: start
		.particles
			zi: 1000
			pos: absolute t: 0 l: 0 r: 0 b: 0
		.assets
			zi: 0
			as: start
			# w: >392px 100%
			fl: 1 1 min-content
			w: >320px 100% h: 100%
			d: flex jc: end ai: start
			pos: relative
			img
				d: block
				w: 100% <240px h: auto
				&.energon
					pos: absolute r: 50% t: 70%
				&.astonit
					zi: 0
					pos: absolute r: -10% t: 100%
					filter: blur(4px)
					o: .5

	def setup
		scroller.add('resourceTag',			self,				{view: bottom, gap: (do 0), height: (do screen.height * 1.5), 				edge: top})
		scroller.add('resourceTitle',		$resourceTitle,		{view: bottom, gap: (do 0), height: (do 200), 								edge: bottom})
		scroller.add('resourceText',		$resourceText,		{view: bottom, gap: (do 0), height: (do 200), 								edge: bottom})
		scroller.add('resourceQuote',		$resourceQuote,		{view: bottom, gap: (do 0), height: (do 200), 								edge: bottom})
		scroller.add('resourceParticles',	self, 				{view: bottom, gap: (do 0), height: (do screen.height * (mobile ? 3 : 2)), 	edge: top})
		scroller.add('resourceAsset',		self, 				{view: bottom, gap: (do 0), height: (do screen.height * 1.5), 				edge: top})

	def render
		<self>
			css
				transform: translateY({(0.5 - scroller.get('resourceTag')) * 200}px)
			<$resourcesContent .content.block>
				<.column>
					<h3$resourceTitle> 'Resources'
						css
							ml: -5px
							o: {scroller.get('resourceTitle')}
							transform: translateY({(1 - scroller.get('resourceTitle')) * 50}px)
					<p$resourceText> 'To fly, your ship needs fuel - Energons. You can get it by recycling Astonite, which you will need to get in daily events. Note that the amount of Astonite will decrease over time.'
						css
							o: {scroller.get('resourceText')}
							transform: translateY({(1 - scroller.get('resourceText')) * 75}px)
					<$resourceQuote .quote>
						css
							o: {scroller.get('resourceQuote')}
							transform: translateY({(1 - scroller.get('resourceQuote')) * 50}px)
						<img src="../public/icons/gem.svg">
						<i> 'As part of the space race, we totally recreated Elysium Duonomics to test how it would work in real life. Thus, Astonite is SKY, and Energon is RAY.'
							css
								mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('resourceQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('resourceQuote') * 150}%)
								-webkit-mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('resourceQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('resourceQuote') * 150}%)
				<.assets>
					<img src=astonit>
						css
							transform: translateY({(0.5 - scroller.get('resourceAsset')) * (self.clientHeight / 2)}px)
					<img.energon src=energon>
						css
							transform: scale(0.75) translateY({(0.5 - scroller.get('resourceAsset')) * (self.clientHeight)}px)
					<img.astonit src="./media/astonit-small.webp">
						css
							transform: scale(.35) translateY({(0.5 - scroller.get('resourceAsset')) * (self.clientHeight * 1.5)}px)
				<.particles>
					for layer, idx in [0 ... 3]
						<SpaceDust blured=(idx == 2 ? true : false) parent=$resourcesContent>
							css
								w: {$resourcesContent.clientWidth}px
								h: {$resourcesContent.clientHeight * 2}px
								t: {-500 - idx * 250}pxx
								transform: translateY({(1 - scroller.get('resourceParticles')) * (100 + (idx * 750))}px)

tag Rewards
	css self
		pos: relative
		w: 100%
		m: -500px auto
		p: 500px 0
		of: hidden
		.content
			flw: wrap
		.left
			ai: center jc: center
			pos: relative
			w: >300px 100% h: 300px
			mb: 40px
			.capsule
				zi: 20
				as: center
				w: 300px m: auto
				pos: absolute l: 0 t: 0 r: 0 b: 0
				d: flex ai: center jc: center
				img
					d: block
					zi: 10
					&:first-child
						zi: 11
						pos: absolute
						w: 356px h: auto
			>>> svg
				zi: 0
				pos: absolute
				filter: blur(1px)
				transform-origin: 50% 50%

				&.pink fill: #FF00AC
				&.purple fill: #6A02F0
				
				&.first l: -160px t: 70px s: 480px 2px
				&.second l: 30px b: 80px s: 400px 2px
				&.third l: -180px t: 60px s: 400px 2px
				&.fourth r: -30px b: 0px s: 160px 2px
				&.fifth r: -85px b: 60px s: 240px 2px zi: 11
				&.sixth l: -20px t: 40px s: 180px 2px zi: 11
				&.seventh l: 0px t: 70px s: 400px 4px
				&.eighth b: 60px r: 0px s: 400px 4px

	def setup
		scroller.add('rewardsTitle',	$rewardsTitle,		{view: bottom, gap: (do 0), height: (do 200), edge: bottom})
		scroller.add('rewardsText',		$rewardsText,		{view: bottom, gap: (do 0), height: (do 200), edge: bottom})
		scroller.add('rewardsQuote',	$rewardsQuote,		{view: bottom, gap: (do 0), height: (do 200), edge: bottom})
		scroller.add('rewardsCard',		$rewardsContent,	{view: bottom, gap: (do 0), height: (do screen.height * 1.5), edge: top})
		scroller.add('rewardsLine',		$rewardsContent,	{view: bottom, gap: (do 0), height: (do screen.height / 2), edge: top})

	def render
		<self>
			<$rewardsContent.content>
				<.column.left>
					<.capsule>
						css
							transform: translateY({(0.5 - scroller.get('rewardsCard')) * (screen.height / 10)}px)
						<img src="./media/loot-capsule.webp">
							css
								transform: translateY({(0.5 - scroller.get('rewardsCard')) * (screen.height / 5)}px)
						<img src="./media/rewards-card.svg">
						<svg.pink.first>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * -200}px) translateY({(1 - scroller.get('rewardsLine')) * 200}px) rotateZ(-45deg)
							<path d="M0,1 L240,0 L480,1 L240,2 Z">
						<svg.pink.second>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * -200}px) translateY({(1 - scroller.get('rewardsLine')) * 200}px) rotateZ(-45deg)
							<path d="M0,1 L200,0 L400,1 L200,2 Z">
						<svg.purple.third>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * 200}px) translateY({(1 - scroller.get('rewardsLine')) * -200}px) rotateZ(-45deg)
							<path d="M0,1 L200,0 L400,1 L200,2 Z">
						<svg.purple.fourth>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * 200}px) translateY({(1 - scroller.get('rewardsLine')) * -200}px) rotateZ(-45deg)
							<path d="M0,1 L80,0 L160,1 L80,2 Z">
						<svg.purple.fifth>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * 200}px) translateY({(1 - scroller.get('rewardsLine')) * -200}px) rotateZ(-45deg)
							<path d="M0,1 L120,0 L240,1 L120,2 Z">
						<svg.pink.sixth>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * -200}px) translateY({(1 - scroller.get('rewardsLine')) * 200}px) rotateZ(-45deg)
							<path d="M0,1 L90,0 L180,1 L90,2 Z">
						<svg.purple.seventh>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * 200}px) translateY({(1 - scroller.get('rewardsLine')) * -200}px) rotateZ(-45deg)
							<path d="M0,2 L200,0 L400,2 L200,4 Z">
						<svg.pink.eighth>
							css
								o: {scroller.get('rewardsLine')}
								transform: translateX({(1 - scroller.get('rewardsLine')) * -200}px) translateY({(1 - scroller.get('rewardsLine')) * 200}px) rotateZ(-45deg)
							<path d="M0,2 L200,0 L400,2 L200,4 Z">
				<.column>
					<h3$rewardsTitle> 'Rewards'
						css
							ml: -5px
							o: {scroller.get('rewardsTitle')}
							transform: translateY({(1 - scroller.get('rewardsTitle')) * 50}px)
					<p$rewardsText> 'Get NFT Loot Capsules containing a variety of in-game boosters as a reward for your engagement in the project, or buy them from the Team to support Elysium development and have a short-time advantage over other players.'
						css
							o: {scroller.get('rewardsText')}
							transform: translateY({(1 - scroller.get('rewardsText')) * 75}px)
					<$rewardsQuote .quote>
						css
							o: {scroller.get('rewardsQuote')}
							transform: translateY({(1 - scroller.get('rewardsQuote')) * 50}px)
						<img src="../public/icons/rewards.svg">
						<i> 'The loot capsule is an NFT token, but its contents are in-game assets and cannot be sold on the secondary market.'
							css
								mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('rewardsQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('rewardsQuote') * 150}%)
								-webkit-mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('rewardsQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('rewardsQuote') * 150}%)

tag Strategy

	css self
		zi: 1
		pos: relative
		# h: calc(150vh + 160px)
		.content
			flw: wrap-reverse
			jc: center
			&.block
				bg: none
				# bg: #120519
				# bg: radial-gradient(ellipse farthest-side at 0% 0%, rgba(57, 17, 77, .25), rgba(18, 5, 25, 0))
				&:before
					zi: 1000
					pos: absolute l: -40px !@420: -30px t: -40px !@420: -30px
					transform: rotateZ(-135deg)
				&:after
					bdt: solid 1px rgba(57, 17, 77, 0.55)
					bdl: solid 1px rgba(57, 17, 77, 0.55)
			.column
				zi: 1
				pos: relative
				# w: 100% <480px
			.spaceship-box
				w: 100%
				d: flex jc: end
				fl: 1 1 350px
			.spaceship
				pos: relative
				d: flex ai: center jc: center
				w: 100% <350px !@420: 100% <280px
				m: auto
				>>> svg
					fill: none
					stroke-width: 1px
					stroke: rgba(57, 17, 77, .5)
					&.circles
						zi: -1
						pos: absolute
						overflow: visible
						w: 100% h: 100%
				.grad-mask
					pos: absolute s: 1600px
					mask-image: radial-gradient(circle closest-side at 50% 50%, rgba(255,255,255,1), rgba(255,255,255,0))
					-webkit-mask-image: radial-gradient(circle closest-side at 50% 50%, rgba(255,255,255,1), rgba(255,255,255,0))
					mix-blend-mode: overlay
				.grad
					pos: absolute s: 1600px
					bg: conic-gradient(from 45deg at 50% 50%, rgba(45, 16, 61, .5) 0deg, rgba(45, 16, 61, 0) 360deg)
					animation: radar linear 10s infinite
					@keyframes radar
						from transform: rotateZ(360deg)
						to transform: rotateZ(0deg)
				video
					zi: 101 w: 100% h: auto
				img
					zi: 100
					pos: absolute
					o: .15

	circles = 0

	def setup
		scroller.add('strategyTag',			self,				{view: bottom, gap: (do 0), height: (do screen.height * 1.5), edge: top})
		scroller.add('strategyTitle',		$strategyTitle,		{view: bottom, gap: (do 0), height: (do 200), edge: top})
		scroller.add('strategyText',		$strategyText,		{view: bottom, gap: (do 0), height: (do 200), edge: top})
		scroller.add('strategyQuote',		$strategyQuote,		{view: bottom, gap: (do 0), height: (do 200), edge: bottom})
		scroller.add('strategyCircles',		self,				{view: bottom, gap: (do 0), height: (do screen.height / 2), edge: top})
		scroller.add('strategyVideo',		self, 				{view: bottom, gap: (do 0), height: (do screen.height * 1.5), edge: top})

	def render
		<self>
			css
				transform: translateY({(0.5 - scroller.get('strategyTag')) * 200}px)
			<.content.block>
				<.column>
					<h3$strategyTitle> 'Strategy'
						css
							o: {scroller.get('strategyTitle')}
							transform: translateY({(1 - scroller.get('strategyTitle')) * 50}px)
					<p$strategyText> "Develop your own strategy by focusing on the ship's engine power, its ability to maintain inertia, or in-game boosters and personal skills in a mini-game."
						css
							o: {scroller.get('strategyText')}
							transform: translateY({(1 - scroller.get('strategyText')) * 50}px)
					<$strategyQuote .quote>
						css
							o: {scroller.get('strategyQuote')}
							transform: translateY({(1 - scroller.get('strategyQuote')) * 50}px)
						<img src="../public/icons/radar.svg">
						<i> 'There is no single winning strategy in the space race. There are many factors that influence your performance, and the most important factor is the timeliness of your decisions.'
							css
								mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('strategyQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('strategyQuote') * 150}%)
								-webkit-mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('strategyQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('strategyQuote') * 150}%)
				<.spaceship-box>
					<.spaceship>
						<video src=spaceship-strategy poster=spaceship-strategy-poster autoplay muted loop preload="auto">
							css
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 2)}px)
						<svg.circles>
							css
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 10)}px)
							for circle, id in [0 ... 20]
								<circle cx="50%" cy="50%" r="{36 + (id + 1) * scroller.get('strategyCircles') * 40}px" opacity="{1 * (1 - id * 0.05)}">
						<.grad-mask>
							css
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 4)}px)
							<.grad>
						<img src="./media/smallship.svg">
							css
								l: -40px t: -6px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 10)}px)
						<img src="./media/smallship.svg">
							css
								l: 95px t: 60px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 8)}px)
						<img src="./media/smallship.svg">
							css
								l: 270px t: -56px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 10)}px)
						<img src="./media/smallship.svg">
							css
								r: 40px t: 70px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 6)}px)
						<img src="./media/smallship.svg">
							css
								r: -30px b: 68px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 8)}px)
						<img src="./media/smallship.svg">
							css
								l: 72px b: -32px
								transform: translateY({(0.5 - scroller.get('strategyVideo')) * (self.clientHeight / 6)}px)

tag Profit
	css self
		zi: 1
		pos: relative
		.graph
			js: end
			as: start
			# fl: 0 1 min-content
			pos: relative
			mb: 40px
			img
				d: block
				w: 100%
			.candles
				pos: absolute t: 38px l: 0 r: 0 m: auto
			.buttons
				pos: absolute b: 44px !@420: 0px r: -24px !@420: -12px
				d: flex fld: column g: 16px ai: start
				.btn
					d: flex
					pos: relative
					backdrop-filter: blur(2px)
					.shine
						pos: absolute
						s: 84px 1px
						bg: linear-gradient(to right, rgba(37, 11, 51, 0), rgba(133, 72, 166, 1), rgba(37, 11, 51, 0))
						&:before
							content: ''
							pos: absolute l: 0 t: 0 r: 0 b: 0
							bg: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.25), rgba(255, 255, 255, 0))
						&:after
							o: .5
							content: ''
							pos: absolute l: 15px t: 0 r: 15px b: 0 h: 2px
							bg: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.25), rgba(255, 255, 255, 0))
						&.buy
							t: 0 r: 0
							animation: buy-shine ease 4s infinite
							@keyframes buy-shine
								0% r: 86px o: 0
								25% o: 1
								50% r: 0 o: 0
								100% r: 0 o: 0
						&.sell
							b: 0 l: 86px
							o: 0
							animation: sell-shine ease 4s infinite
							animation-delay: 1s
							@keyframes sell-shine
								0% l: 86px o: 0
								25% o: 1
								50% l: 0 o: 0
								100% l: 0 o: 0
		.assets
			pos: relative
			d: flex flw: wrap g: 16px
			w: 100%
			.asset
				fl: 0 1 min-content
				pos: relative
				o: 0
				transform: translateY(100px)
				animation: move-down ease 0.5s backwards
				&.asset-in
					animation: move-up ease .5s forwards
				@keyframes move-up
					to transform: translateY(0px) o: 1
				@keyframes move-down
					from transform: translateY(0px) o: 1
				img
					d: block
					&.nft
						pos: absolute l: 12px t: 12px
						s: 56px
				.standart
					pos: absolute b: 4px l: 6px
					ff: 'Montserrat'
					fs: 9px lh: 12px fw: 700 tt: uppercase
					c: #6A3983

	assets = [
		{standart: 'erc-721', nft: spaceship}
		{standart: 'erc-721', nft: keyA}
		{standart: 'erc-1055', nft: capsule}
		{standart: 'erc-20', nft: astonit}
		{standart: 'erc-20', nft: energon}
	]

	def setup
		scroller.add('profitTitle',		$profitTitle,		{view: bottom, gap: (do 0), 	height: (do 200), 					edge: top})
		scroller.add('profitText',		$profitText,		{view: bottom, gap: (do 0), 	height: (do 200), 					edge: top})
		scroller.add('profitGraph',		self,				{view: bottom, gap: (do 0), 	height: (do screen.height), 		edge: top})
		scroller.add('profitGraphAdd',	self,				{view: bottom, gap: (do 0), 	height: (do screen.height * 1.5), 	edge: top})
		scroller.add('profitAsset0',	$profitAsset,		{view: bottom, gap: (do 0), 	height: (do 100), 					edge: bottom})
		scroller.add('profitAsset1',	$profitAsset,		{view: bottom, gap: (do 25), 	height: (do 100), 					edge: bottom})
		scroller.add('profitAsset2',	$profitAsset,		{view: bottom, gap: (do 50), 	height: (do 100), 					edge: bottom})
		scroller.add('profitAsset3',	$profitAsset,		{view: bottom, gap: (do 75), 	height: (do 100), 					edge: bottom})
		scroller.add('profitAsset4',	$profitAsset,		{view: bottom, gap: (do 100), 	height: (do 100), 					edge: bottom})

	def render
		<self>
			<.content>
				<.graph>
					css
						transform: translateY({(1 - scroller.get('profitGraph')) * 100}px)
					<.buttons>
						css
							transform: translateY({(0.75 - scroller.get('profitGraphAdd')) * 200}px)
						<.btn>
							<.shine.buy>
							<img src='./media/profit-buy.svg'>
						<.btn>
							css
								transform: translateY({(.75 - scroller.get('profitGraphAdd')) * 50}px)
							<.shine.sell>
							<img src='./media/profit-sell.svg'>
					<img.candles src='./media/profit-candles.svg'>
						css
							transform: translateY({(0.75 - scroller.get('profitGraphAdd')) * 150}px)
					<img src='./media/profit-grid.svg'>
				<.column>
					<h3$profitTitle> 'Profit'
						css
							ml: -5px
							o: {scroller.get('profitTitle')}
							transform: translateY({(1 - scroller.get('profitTitle')) * 50}px)
					<p$profitText> 'Depending on the chosen strategy, you may not just become one of the first validators of the network but also earn money while traveling to Elysium. Mine resources, earn rewards, and sell or buy them on DEX and NFT marketplaces.'
						css
							o: {scroller.get('profitText')}
							transform: translateY({(1 - scroller.get('profitText')) * 75}px)
					<$profitAsset .assets>
						for asset, idx in assets
							<.asset>
								css
									o: {scroller.get("profitAsset{idx}")}
									transform: translateY({(1 - scroller.get("profitAsset{idx}")) * (50 + 10 * idx)}px)
								<.standart> asset.standart
								<img.nft src=asset.nft>
								<img src='./media/profit-asset.svg'>

tag Prize
	visible

	def scrollPlay
		$prizeVideo.currentTime = $prizeVideo.duration * scroller.get('prizeVideo')
		window.requestAnimationFrame(scrollPlay.bind(self)) if visible

	def setup
		scroller.add('prizeTag',		self,			{view: bottom, gap: (do 0),							height: (do screen.height), 			edge: top})
		scroller.add('prizeTitle',		$prizeTitle,	{view: bottom, gap: (do 0), 						height: (do 200), 					edge: top})
		scroller.add('prizeText',		$prizeText,		{view: bottom, gap: (do 0), 						height: (do 200), 					edge: top})
		scroller.add('prizeQuote',		$prizeQuote,	{view: bottom, gap: (do 0), 						height: (do 200), 					edge: bottom})

		scroller.add('prizeLine1',		self,			{view: bottom, gap: (do 0), 						height: (do screen.height / 2), edge: top})
		scroller.add('prizeLine2',		self,			{view: bottom, gap: (do screen.height * .5), 		height: (do screen.height / 2), edge: top})
		scroller.add('prizeLine3',		self,			{view: bottom, gap: (do screen.height), 			height: (do screen.height / 2), edge: top})
		scroller.add('prizeLine4',		self,			{view: bottom, gap: (do screen.height * 1.5), 		height: (do screen.height / 2), edge: top})

		scroller.add('prizeVideo',		self,			{view: bottom, gap: (do screen.height * .9), 		height: (do screen.height * 1.5), edge: top})

		scroller.enter 'prizeVideo', do
			visible = true
			window.requestAnimationFrame(scrollPlay.bind(self))

		scroller.leave 'prizeVideo', do
			visible = false

	css self
		zi: 1000
		pos: relative
		.video-container
			zi: 0
			d: flex jc: end
			pos: absolute b: 0 l: 0 r: 0
			w: 100%
			bg: #120519
			mix-blend-mode: lighten
			video
				d: block
				w: 100% h: auto
				object-fit: cover
				mix-blend-mode: lighten
		.section
			pos: sticky t: 40px !@640: 40px !@420: 20px
			of: hidden
			w: calc(100vw - 320px) <960px !@640: calc(100vw - 240px) !@420: calc(100vw - 120px)
			min-height: calc(100vh - 320px) !@640: calc(100vh - 240px) !@420: calc(100vh - 120px)
			p: 120px !@640: 80px !@420: 40px
			m: auto
			mt: 200px !@640: 120px !@420: 80px
			.content
				w: 100% <500px
				m: 0 p: 0
		.border-box
			zi: 1
			pos: absolute l: 0 r: 0 b: 0 t: 0
		>>> svg
			# of: visible
			&.border
				w: 100% h: 100%
				stroke-width: 8px
				fill: none

	def render
		<self>
			css
				h: {screen.height * 2}px
				transform: translateY({(1 - scroller.get('prizeTag')) * 200}px)
			<.section>
				<.video-container>
					<video$prizeVideo src=prize preload="auto" @oncanplay=(do $prizeVideo.currentTime = 0)> # poster=prize-poster playsInline muted 
				<.content>
					<.column>
						<h3$prizeTitle> 'Prize'
							css
								ml: -5px
								o: {scroller.get('prizeTitle')}
								transform: translateY({(1 - scroller.get('prizeTitle')) * 50}px)
						<p$prizeText> 'Complete the Space Race and become one of the first Elysium validators without additional investments. The higher your place in the space race leaderboard, the greater your share of validator rewards will be.'
							css
								o: {scroller.get('prizeText')}
								transform: translateY({(1 - scroller.get('prizeText')) * 75}px)
						<$prizeQuote .quote>
							css
								o: {scroller.get('prizeQuote')}
								transform: translateY({(1 - scroller.get('prizeQuote')) * 50}px)
							<img src="../public/icons/chartpie.svg">
							<i> '10 000 000 SKY will be mined by the first Elysium validators during the first year after Elysium launch.'
								css
									mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('prizeQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('prizeQuote') * 150}%)
									-webkit-mask-image: linear-gradient(to right, rgba(255,255,255,1) {scroller.get('prizeQuote') * 150 - 50}%, rgba(255,255,255,0) {scroller.get('prizeQuote') * 150}%)
				<.border-box>
					<svg .border>
						<linearGradient id="outbrake-gradient" x1="0%" y1="100%" x2="100%" y2="0%" gradientUnits="userSpaceOnUse">
							<stop stop-color="#4F02FF">
							<stop offset="1" stop-color="#FB049C">
						<g stroke="url(#outbrake-gradient)">
							<line x1="0" x2="{scroller.get('prizeLine1') * 100}%" y1="0" y2="0">
							<line x1="100%" x2="100%" y1="0" y2="{scroller.get('prizeLine2') * 100}%">
							<line x1="100%" x2="{(1 - scroller.get('prizeLine3')) * 100}%" y1="100%" y2="100%">
							<line x1="0" x2="0" y1="100%" y2="{(1 - scroller.get('prizeLine4')) * 100}%">

tag PioneerAccess
	css self
		zi: 105
		pos: relative
		w: calc(100% - 320px) <820px !@640: calc(100% - 160px) !@420: calc(100% - 80px)
		m: auto
		mix-blend-mode: screen
		-webkit-mix-blend-mode: screen
		.section
			zi: 100
			pos: relative
			bg: black
			mix-blend-mode: screen
			-webkit-mix-blend-mode: screen
		.content
			zi: 103
			d: block
			pos: relative
			p: 0
			w: 100%
			bg: black
			mix-blend-mode: screen
			-webkit-mix-blend-mode: screen
		.gradient-text
			zi: 1
			d: block
			p: 0 2px
			h2
				zi: 1
				d: block
				pos: sticky t: 0
		.gradient-bg
			zi: 2
			d: block
			pos: absolute l: 0 r: 0 b: 0 t: 0
			mix-blend-mode: darken
			-webkit-mix-blend-mode: darken
			.start-grad
				bg: linear-gradient(to bottom, #13061A, #FE039A)
			.center-grad
				bg: linear-gradient(to bottom, #FE039A, #4E01FF)
			.end-grad
				bg: linear-gradient(to bottom, #4E01FF, #13061A)

	def mount
		scroller.add('accessStart',		$accessContent,		{view: bottom, gap: (do (screen.height + $accessText.clientHeight) / 2), 	height: (do $accessText.clientHeight), edge: top})
		scroller.add('accessEnd',		$accessContent,		{view: bottom, gap: (do -$accessText.clientHeight / 2),						height: (do $accessText.clientHeight), edge: bottom})

	def render
		<self>
			<.section>
				css
					o: {scroller.get('accessStart')}
				<$accessContent .content>
					css
						o: {1 - scroller.get('accessEnd')}
						h: {$accessText.clientHeight * 6}px
					<.gradient-text>
						css
							h: 100%
						<h2$accessText> 'One of the 9000 Access Key NFTs is required to gain access to the Pioneer Program. It will allow you to create a FREE Spaceship NFT for your journey to Elysium.'
							css
								t: {(window.innerHeight - $accessText.clientHeight)/2}px
					<.gradient-bg>
						<.start-grad>
							css
								h: {2.5 / 6 * 100}% # {$accessText.clientHeight * 2.5}px
						<.center-grad>
							css
								h: {1 / 6 * 100}% # {$accessText.clientHeight}px
						<.end-grad>
							css
								h: {2.5 / 6 * 100}% # {$accessText.clientHeight * 2.5}px

tag KeyCard
	css self
		flex: 1 1 254px
		d: flex flw: wrap
		pos: relative
		w: 100%
		bd: solid 1px #240A32
		o: 0
		transform: translateY(200px)
		animation: key-out ease 0.75s backwards
		&.key-in
			animation: key-in ease 0.75s forwards
		@keyframes key-in
			to transform: translateY(0px) o: 1
		@keyframes key-out
			from transform: translateY(0px) o: 1
		.key-base
			w: 100%
			flex: 1 1 220px
			.type
				overflow: hidden
				pos: relative
				d: flex jc: center
				ff: 'Roboto Condensed'
				fs: 20px lh: 24px fw: 500 tt: uppercase
				c: #ffffff
				m: 4px p: 10px 0
				bg: rgba(57, 17, 77, 0.5)
				&:before
					content: ''
					pos: absolute l: -6px t: -6px
					s: 12px
					bg: #120519
					transform: rotateZ(45deg)
			.params
				d: flex fld: column g: 32px m: 40px 36px
				.param
					d: flex fld: column g: 16px
					.info
						d: flex g: 12px ai: center
						img s: 32px
						.title
							d: flex ai: start jc: space-between
							w: 100%
					.progress-bar
						s: 100% 4px
						rd: 4px
						bg: #240A32
						.bar
							s: 50% 100% rd: 4px
							bg: #EC04A5
		.stat-list
			flex: 1 1 160px
			d: flex fld: column g: 16px jc: space-between
			p: 40px
			m: -1px
			bd: solid 1px #240A32
			.stat
				d: flex jc: space-between g: 4px ai: end
				h6 lh: 20px
				.wl
					pos: relative
					fs: 12px lh: 20px
					p: 0 8px
					bg: linear-gradient(to left bottom, #FE039A 0%, #4E01FF 100%)
					&:before
						content: ''
						pos: absolute l: -3px t: -3px
						s: 6px
						bg: rgba(18, 5, 25, 1)
						transform: rotateZ(-45deg)
				>>> svg
					d: block
					h: 7px w: 100%
					pos: relative
					line
						stroke: rgba(57, 17, 77, 0.5)
						stroke-linecap: round
						stroke-width: 2px
						stroke-dasharray: 0px 4px
		>>> svg
			h: 100% w: 100%
			zi: 2
			pos: absolute l: 0 t: 0
			rect
				fill: none
				# stroke: #fff
				stroke-width: 2px

	def render
		<self>
			if data.engine == 27
				<svg>
					<linearGradient id="outbrake-gradient" x1="0%" y1="100%" x2="100%" y2="0%" gradientUnits="userSpaceOnUse">
						<stop stop-color="#4F02FF">
						<stop offset="1" stop-color="#FB049C">
					<g stroke="url(#outbrake-gradient)">
						<rect x="0" y="0" width="100%" height="100%">
						<path d="M0,0 L8,0 L0,8 Z" stroke-width="8">
			<.key-base>
				<.type> 'Type ' + data.type
				<.params>
					<.param>
						<.info>
							<img src="../public/icons/engine.svg">
							<.title>
								<h6> 'Engine'
									<span> 'efficiency'
								<h6> data.engine
						<.progress-bar> <.bar[w: {data.engine / 27 * 100}%]>
					<.param>
						<.info>
							<img src="../public/icons/inertia.svg">
							<.title>
								<h6> 'Inertia'
									<span> 'Retention'
								<h6.light> data.inertia
						<.progress-bar>
			<.stat-list>
				<.stat>
					<h6.light> 'Supply'
					<svg><line x1="0" x2="100%" y1="1" y2="1">
					<h6> data.supply
				<.stat>
					<h6.light> 'Marketing Reserve'
					<svg><line x1="0" x2="100%" y1="1" y2="1">
					<h6> data.reserve
				<.stat>
					<h6.light> 'Private Sale'
					<svg><line x1="0" x2="100%" y1="1" y2="1">
					<h6> data.sale
				<.stat>
					<h6.light> 'Price'
					<svg><line x1="0" x2="100%" y1="1" y2="1">
					<h6> '$ ' + data.price
				<.stat>
					<h6.light> 'Required'
					<svg><line x1="0" x2="100%" y1="1" y2="1">
					<h6.wl> 'Wl type ' + data.type

tag AccessKey
	
	keys = {
		A: {type: 'a', engine: 27, inertia: 0, supply: 600, reserve: 100, sale: 500, price: 400, group: 0}
		B: {type: 'b', engine: 9, inertia: 0, supply: 1200, reserve: 200, sale: 1000, price: 200, group: 0}
		C: {type: 'c', engine: 3, inertia: 0, supply: 2400, reserve: 400, sale: 2000, price: 100, group: 1}
		D: {type: 'd', engine: 1, inertia: 0, supply: 4800, reserve: 800, sale: 4000, price: 50, group: 1}
	}

	css self
		zi: 105
		pos: relative
		d: flex fld: column g: 80px !@420: 40px ai: center
		mix-blend-mode: lighten
		-webkit-mix-blend-mode: lighten
		bg: #120519
		.video-container
			pos: relative
			d: flex jc: center ai: start
			bg: rgba(18, 6, 25, 1)
			w: 100% h: 200vh
			mt: -75vh !@420: -50vh
			mb: -30vh
			&:before
				zi: 100
				content: ''
				pos: absolute l: 0 t: -1px r: 0 h: 400px
				bg: linear-gradient(to bottom, rgba(18, 5, 25, 1), rgba(18, 5, 25, 0))
			video
				d: block
				pos: sticky t: 0
				w: 100vw h: 100vh
				# @!640: >1200px 100vw
				object-fit: cover
				mix-blend-mode: lighten
				-webkit-mix-blend-mode: lighten
		.content
			pos: relative
			w: calc(100% - 80px) <800px
			d: flex fld: column g: 40px ai: center
			ta: center
		.keys
			zi: 1
			pos: relative
			d: flex g: 24px flw: wrap
			w: calc(100% - 80px) <1200px !@420: calc(100% - 40px) <100%
			m: 0 auto
			.key-group
				flex: 1 1 535px
				d: flex gap: 24px flw: wrap
				w: 100%
		.button-container
			pos: relative
			w: 100%
			d: flex jc: center
			of: hidden
			mt: -40px
			.mint-button
				pos: relative
				d: flex ai: center jc: center
				w: 588px h: auto
				p: 40px 0
				mask-image: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, #FFFFFF 25%, #FFFFFF 75%, rgba(255, 255, 255, 0) 100%)
				-webkit-mask-image: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, #FFFFFF 35%, #FFFFFF 65%, rgba(255, 255, 255, 0) 100%)
				h5
					# cursor: pointer
					zi: 100
					pos: absolute
					p: 16px 64px
					o: 0
					animation: btn-opacity-out ease-in .25s backwards
					&.in
						animation: btn-opacity-in ease-in-out .5s forwards
						animation-delay: .25s
				>>> svg
					.center
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					.left
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					.right
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					.back-center
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					.back-left
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					.back-right
						o: 0
						animation: btn-opacity-out ease-in .25s backwards
					&.in
						.center
							animation: btn-opacity-in ease-out 1s forwards
						.left
							transform: translateX(80px)
							animation: btn-transform-in ease-in-out .5s forwards
						.right
							transform: translateX(-80px)
							animation: btn-transform-in ease-in-out .5s forwards
						.back-center
							animation: btn-opacity-in 0.25s forwards
							animation-delay: .25s
						.back-left
							transform: translateX(80px)
							animation: btn-transform-in ease-in-out .5s forwards
						.back-right
							transform: translateX(-80px)
							animation: btn-transform-in ease-in-out .5s forwards
				.blur-mask
					pos: absolute l: 0 t: 0 r: 0 b: 0
					mask-image: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, #FFFFFF 50%, rgba(255, 255, 255, 0) 100%)
					-webkit-mask-image: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, #FFFFFF 50%, rgba(255, 255, 255, 0) 100%)
					o: 0
					animation: btn-opacity-out ease-in .25s backwards
					&.in
						animation: btn-opacity-in ease-in-out .5s forwards
						animation-delay: .25s
					.blur
						pos: relative
						s: 100%
						bg: red
						background: linear-gradient(to left, rgba(254, 3, 154, 0.5) 0%, rgba(78, 1, 255, 0.5) 100%)
						filter: blur(25px)
						o: 0.25
				@keyframes btn-opacity-in
					to o: 1
				@keyframes btn-transform-in
					to transform: translateX(0px) o: 1
				@keyframes btn-opacity-out
					from o: 1

	visible
	play = 'true'
	def scrollPlay
		$key.currentTime = $key.duration * scroller.get('keyVideo')
		window.requestAnimationFrame(scrollPlay.bind(self)) if visible

	def setup
		scroller.add('keyVideo',	self, 			{view: bottom, gap: (do screen.height / 6), height: (do screen.height), edge: top})
		scroller.add('keyTitle',	$keyTitle,		{view: bottom, gap: (do 0), height: (do 200), edge: top})
		scroller.add('keyText',		$keyText,		{view: bottom, gap: (do 0), height: (do 200), edge: top})
		scroller.add('keyA',		$keyA,			{view: bottom, gap: (do 0), height: (do 0), edge: top})
		scroller.add('keyB',		$keyB,			{view: bottom, gap: (do 50), height: (do 0), edge: top})
		scroller.add('keyC',		$keyC,			{view: bottom, gap: (do 100), height: (do 0), edge: top})
		scroller.add('keyD',		$keyD,			{view: bottom, gap: (do 150), height: (do 0), edge: top})
		scroller.add('keyButton',	$keyButton,		{view: bottom, gap: (do 0), height: (do 0), edge: bottom})

		scroller.enter 'keyVideo', do
			visible = true
			window.requestAnimationFrame(scrollPlay.bind(self))

		scroller.leave 'keyVideo', do
			visible = false
		

	def render
		<self>
			
			<.video-container>
				<video$key src=key preload="auto" muted autoplay=play @oncanplaythrough=(do $key.autoplay=false)> # poster=key-poster muted $key.currentTime = 0
			<.content>
				<h3$keyTitle> 'Access Key'
					css
						o: {scroller.get('keyTitle')}
						transform: translateY({(1 - scroller.get('keyTitle')) * 50}px)
				<p$keyText> 'Your ticket to Elysium. The Access Key allows you to create a Spaceship needed to become a Space Race participant.'
					css
						o: {scroller.get('keyText')}
						transform: translateY({(1 - scroller.get('keyText')) * 75}px)
			<.keys>
				<.key-group>
					<KeyCard$keyA data=keys.A .key-in=scroller.get('keyA')>
					<KeyCard$keyB data=keys.B .key-in=scroller.get('keyB')>
				<.key-group>
					<KeyCard$keyC data=keys.C .key-in=scroller.get('keyC')>
					<KeyCard$keyD data=keys.D .key-in=scroller.get('keyD')>
			<$keyButton .button-container>
				<.mint-button>
					<h5 .in=scroller.get('keyButton')> 'Minting Soon'
					<svg .in=scroller.get('keyButton') width="588" height="64" viewBox="0 0 588 64" fill="none">
						<g fill="url(#btn-grad)" fill-rule="evenodd" clip-rule="evenodd">
							<path .center d="M408 62L430.5 32L408 2H178L155.5 32L178 62H408ZM177 64H409L433 32L409 0H177L153 32L177 64Z">
							<path .left d="M181.498 4L160.5 31.9975L181.502 60H179.002L158.752 33H0L-1 32L0 31H158.748L178.998 4H181.498Z">
							<path .right d="M404.502 4L425.5 31.9975L404.498 60H406.998L427.248 33H586L587 32L586 31H427.252L407.002 4H404.502Z">
						<path .back-left d="M95.75 29H153.75L160.5 20H102.5L95.75 29ZM153.75 35L160.5 44H102.5L95.75 35H153.75ZM92.75 29H88.75L92.5 24H96.5L92.75 29ZM85.75 35H81.75L85.5 40H89.5L85.75 35ZM81.75 29H85.75L89.5 24H85.5L81.75 29ZM78.75 29H74.75L78.5 24H82.5L78.75 29ZM71.75 35H67.75L71.5 40H75.5L71.75 35ZM71.75 29L75.5 24H71.5L67.75 29H71.75ZM78.75 35H74.75L78.5 40H82.5L78.75 35ZM92.75 35H88.75L92.5 40H96.5L92.75 35Z" fill="#39114D" fill-opacity="0.5">
						<path .back-right d="M492.5 35H434.5L427.75 44H485.75L492.5 35ZM485.75 20L492.5 29H434.5L427.75 20H485.75ZM495.5 35L491.75 40H495.75L499.5 35H495.5ZM499.5 29H495.5L491.75 24H495.75L499.5 29ZM502.5 35L498.75 40H502.75L506.5 35H502.5ZM506.5 29H502.5L498.75 24H502.75L506.5 29ZM509.5 35L505.75 40H509.75L513.5 35H509.5ZM513.5 29H509.5L505.75 24H509.75L513.5 29ZM516.5 35L512.75 40H516.75L520.5 35H516.5ZM520.5 29H516.5L512.75 24H516.75L520.5 29Z" fill="#39114D" fill-opacity="0.5">
						<path .back-center d="M164 32L185 4H242L246 8H286L288 6H300L302 8H342L346 4H403L424 32L403 60H346L342 56H302L300 58H288L286 56H246L242 60H185L164 32Z" fill="#39114D" fill-opacity="0.35"/>
						<defs>
							<linearGradient id="btn-grad" x1="320" y1="-4" x2="116" y2="72" gradientUnits="userSpaceOnUse">
								<stop stop-color="#FE039A">
								<stop offset="1" stop-color="#4E01FF">
					<.blur-mask .in=scroller.get('keyButton')>
						<.blur>

tag KeyBurning
	keys = [
		{type: 'b', engine: 9, inertia: 5, image: keyB, posX: -1, posY: -1},
		{type: 'd', engine: 1, inertia: 0, image: keyD, posX: 1, posY: -1},
		{type: 'd', engine: 1, inertia: 3, image: keyD, posX: -1, posY: 1},
		{type: 'c', engine: 3, inertia: 1, image: keyC, posX: 1, posY: 1}
	]

	def mount
		svg-path-size = ($keys-block-height.clientHeight - 128 * 2) / 2 - 40

	def setup
		scroller.add('burnMoveVideo',	self, 			{view: bottom, gap: (do 0),						height: (do screen.height), 		edge: top})
		scroller.add('burnPlayVideo',	self, 			{view: bottom, gap: (do screen.height * 1.6), 	height: (do screen.height / 2), 	edge: top})
		scroller.add('burnKeysScale',	self,			{view: bottom, gap: (do screen.height), 		height: (do 0), 					edge: top})
		scroller.add('burnKeysBurn',	self,			{view: bottom, gap: (do screen.height * 1.1), 	height: (do screen.height / 2), 	edge: top})
		scroller.add('burnTitle',		$burnTitle,		{view: bottom, gap: (do 0), 					height: (do 200), 					edge: top})
		scroller.add('burnText',		$burnText,		{view: bottom, gap: (do 0), 					height: (do 200), 					edge: top})
		scroller.add('burnSymb',		$burnText,		{view: bottom, gap: (do 200), 					height: (do 0), 					edge: bottom})
		scroller.add('burnSubText',		$burnText,		{view: bottom, gap: (do 200), 					height: (do 200), 					edge: bottom})

	css self
		zi: 1000
		pos: relative
		d: flex fld: column g: 80px ai: center
		.furnance-sticky
			pos: relative
			h: 240vh # 135vh
			w: 100%
		.furnace-group
			pos: sticky t: 0
			d: flex ai: center jc: center
			of: hidden
			.video-container
				zi: 1000
				pos: absolute t: 0 l: 0 r: 0 b: 0 m: auto
				d: flex jc: center ai: center
				.spaceship
					d: block
					w: 100% <360px !@420: 100% <260px
					h: 100% <360px !@420: 100% <260px
					transform: translateY(24px)

			.keys
				zi: 1
				pos: absolute l: 0 r: 0 t: 40px b: 40px
				w: calc(100% - 80px) <960px !@420: calc(100% - 40px)
				h: calc(100% - 80px) <652px !@420: calc(100% - 40px) <100%
				m: auto
				.key
					pos: absolute
					d: grid gtc: 84px auto ai: center g: 4px 12px
					p: 3px
					bd: 1px solid #240A32
					bg: rgba(18, 5, 25, 0.8)
					bxs: 0 12px 24px 0 rgba(0,0,0,.15)
					o: 0
					transform: scale(0.5)
					animation: key-out ease-in-out 0.25s backwards
					&.in
						animation: key-in ease-in-out 0.3s forwards
					@keyframes key-in
						80% transform: scale(1.1) o: 1
						100%  transform: scale(1) o: 1
					@keyframes key-out
						from transform: scale(1) o: 1
					.key-path
						zi: 1
						pos: absolute
						>>> svg
							# s: 100px
							d: block
							fill: none
							stroke-width: 2px
							stroke: #2E0C41
							of: visible
							# mask-image: linear-gradient(to bottom, rgba(255,255,255,.75) 25%, rgba(255,255,255,0) 65%)
							# -webkit-mask-image: linear-gradient(to bottom, rgba(255,255,255,.75) 25%, rgba(255,255,255,0) 65%)
							&.burn-key
								zi: 1
								pos: absolute l: 0 t: 0
								stroke: #FE039A
								stroke-linecap: round
								stroke-dasharray: 20 320
					&:nth-child(1)
						t: 0 l: 0
						.key-path
							t: 100% l: 50% mt: 8px
					&:nth-child(2)
						t: 0 r: 0
						.key-path
							t: 100% r: 50% mt: 8px
							transform: scaleX(-1)
					&:nth-child(3)
						b: 0 l: 0
						.key-path
							b: 100% l: 50% mb: 8px
							transform: scaleY(-1)
					&:nth-child(4)
						b: 0 r: 0
						.key-path
							b: 100% r: 50% mb: 8px
							transform: scaleX(-1) scaleY(-1)
					.key-image
						pos: relative
						s: 60px
						m: 12px
						img d: block s: 60px
						.corner
							pos: absolute
							s: 4px
							bd: solid 1px rgba(36, 10, 50, 1)
							box-sizing: border-box
							&:nth-child(1) l: 0 t: 0 bdr: none bdb: none
							&:nth-child(2) r: 0 t: 0 bdl: none bdb: none
							&:nth-child(3) l: 0 b: 0 bdt: none bdr: none
							&:nth-child(4) r: 0 b: 0 bdt: none bdl: none
					.params
						d: flex fld: column g: 16px mr: 12px
						.param
							d: flex g: 8px ai: center
							img
								s: 20px
					.type
						gc: 1 / 3
						pos: relative
						bg: #240A32
						h6 fs: 12px lh: 32px ta: center
						of: hidden
						&:before
							content: ''
							pos: absolute l: -6px b: -6px
							s: 12px
							bg: #120519
							transform: rotateZ(45deg)
			.furnace-cont
				zi: 10
				pos: absolute t: 0 l: 0 r: 0 b: 0 m: auto
				d: flex ai: center jc: center
				w: 100% <512px h: auto
				.params
					zi: 10
					pos: absolute
					w: calc(100% - 72px) !@420: calc(100% - 68px)
					d: flex jc: space-between
					p: 0 22px
					.param
						d: flex fld: column g: 16px !@420: 12px ai: center
						img s: 32px !@420: 20px
						h6 fs: 24px !@420: 16px
						&.boom
							animation: boom ease-in-out .25s
						@keyframes boom
							0% transform: scale(1)
							75% transform: scale(1.3)
							100% transform: scale(1)
		.content
			zi: 100
			pos: relative
			d: flex fld: column g: 40px ai: center
			mt: -25vh !@420: -40px
			w: calc(100% - 80px) <960px # !@420: calc(100% - 40px) <100%
			ta: center
			.key-types-box
				w: 100%
				bg: #120519
				d: flex fld: column g: 16px ai: center
				i
					w: 100% <560px
				.key-types
					pos: relative
					d: flex g: 16px !@640: 8px ai: center jc: center
					m: 24px 0 !@420: 16px 0
					w: 100%
					bg: #120519
					-webkit-mask-image: linear-gradient(-90deg, rgba(255,255,255,0), rgba(255,255,255,1), rgba(255,255,255,1), rgba(255,255,255,0)) !@420: linear-gradient(-90deg, rgba(255,255,255,1), rgba(255,255,255,1))
					-webkit-mask-repeat: no-repeat
					mix-blend-mode: lighten
					-webkit-mix-blend-mode: lighten
					.gradient
						zi: 10
						pos: absolute l: 0 t: 0 r: 0 b: 0
						bg: linear-gradient(-90deg, #FE039A, #4E01FF)
						mix-blend-mode: darken
						-webkit-mix-blend-mode: darken
					.line
						h: 2px w: 100%
						bg: white
						o: 0
						transform: scale(0)
						animation: scale-out ease-in .35s backwards
						&.in
							animation: scale-in ease-out .35s forwards
					img
						origin: 50% 50%
						o: 0
						transform: scale(.5)
						animation: scale-out ease-in .35s backwards
						&.in
							animation: scale-in ease-out .35s forwards
					@keyframes scale-in
						to transform: scale(1) o: 1
					@keyframes scale-out
						from transform: scale(1) o: 1
		.bg-container
			pos: relative
			d: flex jc: center ai: center
			w: 100% h: 100vh
			# of: hidden
		>>> svg
			d: block
			pos: relative
			overflow: visible
			&.furnace
				w: calc(100% - 40px) h: auto
				circle
					fill: none
					stroke-width: 4px
					stroke-linecap: round
					&.engine
						stroke-dasharray: 380 1500
						origin: 50% 50%
						transform: rotateZ(100deg)
					&.inertia
						stroke-dasharray: 245 1500
						origin: 50% 50%
						transform: rotateZ(80deg) rotateX(180deg)
			&.furnace-bg
				h: 100% <1200px w: auto
				stroke: rgba(57, 17, 77, .5)
				stroke-width: 2px
				mask-image: radial-gradient(circle closest-side at 50% 50%, rgba(255,255,255,1), rgba(255,255,255,0))
				mask-repeat: no-repeat
				mask-position: 50% 50%
				-webkit-mask-image: radial-gradient(circle closest-side at 50% 50%, rgba(255,255,255,0) 25%, rgba(255,255,255,1), rgba(255,255,255,0))
				-webkit-mask-repeat: no-repeat
				-webkit-mask-position: 50% 50%
			&.plus
				s: 8px 8px
				fill: none
				stroke: #ffffff
				stroke-width: 2px
				stroke-linecap: round
				o: 0
				transform: scale(.5)
				animation: scale-out ease-in .15s backwards
				&.in
					animation: scale-in ease-out .15s forwards
				@keyframes scale-in
					to transform: scale(1) o: 1
				@keyframes scale-out
					from transform: scale(1) o: 1
			&.mask
				pos: absolute l: 0 t: 0 b: 0 r: 0 m: auto
				w: calc(100% - 40px) h: auto
				filter: blur(25px)
				transform: scale(1.35)
				origin: 50% 50%

	def render
		<self>
			<.furnance-sticky>
				<.furnace-group>
					<.video-container>
						css
							origin: 50% 50%
							transform: translateY({(1 - scroller.get('burnMoveVideo')) * -35}vh) scale({-0.2 * scroller.get('burnMoveVideo') + 1.2})
						<Play .spaceship src=burning json=burningjson width=400 height=400 first=true ratio=scroller.get('burnPlayVideo')>
					<$keys-block-height .keys>
						for key, idx in keys
							<.key .in=scroller.get('burnKeysScale') id="key-height{idx}">
								<.key-path>
									<svg.burn-key viewBox="0 0 {svg-path-size || 0} {svg-path-size || 0}">
										css
											s: {svg-path-size || 0}px
											stroke-dashoffset: {scroller.get('burnKeysBurn') * -320}
										<path d="M0,4 L0,{svg-path-size || 0} L{svg-path-size || 0},{svg-path-size || 0}">
									<svg viewBox="0 0 {svg-path-size || 0} {svg-path-size || 0}">
										css
											s: {svg-path-size || 0}px
										<path d="M0,4 L0,{svg-path-size || 0} L{svg-path-size || 0},{svg-path-size || 0}">
								<.key-image>
									<.corner>
									<.corner>
									<.corner>
									<.corner>
									<img.nft src=key.image>
								<.params>
									<.param>
										<img src='../public/icons/engine.svg'>
										<h6> key.engine
									<.param>
										<img src='../public/icons/inertia.svg'>
										<h6> key.inertia
								<.type><h6> 'Type ' + key.type
					<.bg-container[transform: scale({scroller.get('burnKeysBurn')})]>
						<svg.furnace-bg viewBox="0 0 1200 1200">
							for i in [0...72]
								<line x1="600" x2="600" y1="0" y2="1200">
									css
										origin: 50% 50%
										transform: rotateZ({i * 2.5}deg)
					<.furnace-cont>
						<svg.mask viewBox="0 0 512 392">
							<path d="M433.566 278.214L433.39 278.289L433.309 278.462C402.206 345.225 334.507 391.5 256 391.5C177.493 391.5 109.794 345.225 78.6907 278.462L78.61 278.289L78.4344 278.214L5.6455 247.018C2.23203 230.268 0.499992 213.177 0.5 196C0.500008 178.823 2.23205 161.732 5.6455 144.982L78.4345 113.786L78.6101 113.711L78.6907 113.538C109.794 46.7745 177.493 0.5 256 0.5C334.507 0.5 402.206 46.7745 433.309 113.538L433.39 113.711L433.566 113.786L506.354 144.982C509.768 161.732 511.5 178.823 511.5 196C511.5 213.177 509.768 230.268 506.354 247.018L433.566 278.214Z" fill="#120519">
						<svg.furnace viewBox="0 0 512 392">
							<defs>
								<linearGradient id="progress-gradient" x1="0" y1="100%" x2="100%" y2="0" gradientUnits="userSpaceOnUse">
									<stop stop-color="#FB049C">
									<stop offset="1" stop-color="#4F02FF">
							<path d="M426.74 296.259L437.415 291.255C438.332 289.518 439.224 287.766 440.092 286L429.823 290.814C431.753 287.275 433.577 283.675 435.291 280.018L466.454 266.662C464.837 271.48 463.052 276.248 461.101 280.956C455.464 294.567 448.5 307.548 440.329 319.721L386.391 345.005C389.691 342.117 392.898 339.117 396.007 336.008C396.83 335.185 397.645 334.355 398.452 333.519L414.13 326.17C415.855 324.082 417.54 321.959 419.183 319.802L404.92 326.487C406.811 324.329 408.654 322.132 410.447 319.897L423.65 313.708C425.012 311.775 426.343 309.819 427.639 307.838L415.265 313.638C416.722 311.665 418.142 309.666 419.525 307.641L431.228 302.156C432.337 300.334 433.418 298.494 434.472 296.635L423.326 301.86C424.495 300.012 425.633 298.145 426.74 296.259Z" fill="#180622">
							<path d="M113.547 333.518C114.355 334.354 115.17 335.184 115.993 336.007C119.102 339.116 122.31 342.116 125.609 345.004L71.6711 319.72C63.5006 307.547 56.5363 294.566 50.8988 280.955C48.9484 276.247 47.1636 271.479 45.5459 266.661L76.7095 280.017C78.4232 283.674 80.2467 287.274 82.177 290.813L71.9083 285.999C72.7763 287.766 73.6689 289.517 74.5858 291.254L85.2596 296.258C86.367 298.144 87.5054 300.011 88.6743 301.858L77.5292 296.634C78.5825 298.493 79.664 300.333 80.7731 302.155L92.4751 307.64C93.8574 309.665 95.2775 311.664 96.7344 313.637L84.3614 307.837C85.6581 309.818 86.9882 311.775 88.3509 313.707L101.553 319.895C103.346 322.131 105.189 324.328 107.079 326.486L92.8181 319.801C94.4608 321.958 96.1453 324.081 97.8704 326.169L113.547 333.518Z" fill="#180622">
							<path d="M397.918 57.93C397.286 57.28 396.649 56.6343 396.007 55.9927C392.898 52.8834 389.69 49.8829 386.39 46.9951L440.329 72.2789C448.499 84.452 455.464 97.4338 461.101 111.044C463.051 115.752 464.836 120.519 466.453 125.336L435.289 111.98C433.511 108.184 431.613 104.45 429.601 100.782L440.092 105.699C439.224 103.933 438.332 102.181 437.415 100.444L426.495 95.3257C425.379 93.4353 424.232 91.564 423.054 89.7124L434.471 95.0644C433.418 93.2059 432.337 91.3655 431.227 89.5438L419.221 83.9159C417.826 81.8848 416.394 79.8796 414.924 77.9014L427.639 83.8618C426.342 81.881 425.012 79.9241 423.65 77.9917L410.058 71.6204C408.245 69.3749 406.382 67.168 404.47 65.0013L419.182 71.8977C417.54 69.741 415.855 67.6179 414.13 65.5295L397.918 57.93Z" fill="#180622">
							<path d="M85.5045 95.326L74.5859 100.444C73.6691 102.181 72.7765 103.933 71.9085 105.699L82.3985 100.782C80.3866 104.45 78.4896 108.184 76.7109 111.98L45.5469 125.336C47.1643 120.519 48.949 115.752 50.899 111.044C56.5366 97.4337 63.5008 84.4519 71.6714 72.2788L125.61 46.9951C122.31 49.8828 119.102 52.8833 115.993 55.9925C115.351 56.6343 114.714 57.2803 114.082 57.9304L97.8705 65.5294C96.1455 67.6178 94.461 69.7409 92.8183 71.8976L107.53 65.0017C105.618 67.1684 103.755 69.3753 101.942 71.6208L88.3511 77.9916C86.9884 79.924 85.6583 81.8809 84.3616 83.8617L97.0761 77.9018C95.6061 79.8799 94.1734 81.8851 92.7787 83.9162L80.7733 89.5437C79.6642 91.3654 78.5827 93.2058 77.5294 95.0643L88.9462 89.7127C87.7681 91.5643 86.6207 93.4356 85.5045 95.326Z" fill="#180622">
							<path d="M433.566 278.214L433.39 278.289L433.309 278.462C402.206 345.225 334.507 391.5 256 391.5C177.493 391.5 109.794 345.225 78.6907 278.462L78.61 278.289L78.4344 278.214L5.6455 247.018C2.23203 230.268 0.499992 213.177 0.5 196C0.500008 178.823 2.23205 161.732 5.6455 144.982L78.4345 113.786L78.6101 113.711L78.6907 113.538C109.794 46.7745 177.493 0.5 256 0.5C334.507 0.5 402.206 46.7745 433.309 113.538L433.39 113.711L433.566 113.786L506.354 144.982C509.768 161.732 511.5 178.823 511.5 196C511.5 213.177 509.768 230.268 506.354 247.018L433.566 278.214Z">
								css
									fill: #120519
									stroke: #240A32
									stroke-width: 2px
							<path d="M270.148 48.576C278.105 38.4833 287.69 29.4512 298.787 21.9038C327.649 28.8059 353.795 42.6989 375.336 61.6929C361.89 63.0651 349.037 66.4402 337.08 71.5151C317.462 58.8691 294.663 50.734 270.148 48.576ZM265.359 48.2321C273.163 37.9079 282.58 28.6022 293.5 20.7241C281.716 18.2828 269.508 17 257 17C239.863 17 223.289 19.4082 207.597 23.9046C201.707 35.9252 197.856 48.4789 195.933 61.1463C214.55 52.7021 235.226 48 257 48C259.805 48 262.592 48.078 265.359 48.2321ZM191.602 63.1961C193.28 50.4014 196.854 37.691 202.431 25.47C174.39 34.4357 149.354 50.1263 129.223 70.6448C130.004 84.0241 132.826 96.8559 137.379 108.834C151.439 89.5725 170.038 73.8355 191.602 63.1961ZM134.617 112.75C129.788 100.784 126.649 87.9557 125.495 74.5595C105.972 95.6903 91.4778 121.537 83.9136 150.197C91.1915 161.564 99.9916 171.427 109.89 179.675C112.593 155.043 121.34 132.229 134.617 112.75ZM109.442 184.473C99.3043 176.375 90.2224 166.673 82.6063 155.477C79.5928 168.498 78 182.063 78 196C78 212.067 80.1168 227.639 84.0868 242.454C96.088 248.831 108.676 253.123 121.422 255.445C113.434 237.252 109 217.144 109 196C109 192.121 109.149 188.277 109.442 184.473ZM123.444 259.851C110.56 257.783 97.8016 253.776 85.5853 247.719C94.2651 276.527 110.008 302.273 130.802 322.945C144.483 322.549 157.63 320.022 169.924 315.686C150.162 301.284 134.103 282.107 123.444 259.851ZM173.908 318.491C161.627 323.121 148.479 325.986 134.775 326.776C156.292 346.894 182.777 361.764 212.19 369.345C223.936 362.122 234.132 353.296 242.659 343.314C217.335 340.879 193.876 332.062 173.908 318.491ZM247.547 343.703C239.182 353.939 229.16 363.065 217.597 370.649C230.275 373.497 243.462 375 257 375C274.117 375 290.673 372.597 306.349 368.111C312.85 355.928 317.199 343.136 319.516 330.187C300.525 339.05 279.34 344 257 344C253.825 344 250.673 343.9 247.547 343.703ZM323.934 328.035C321.886 341.124 317.841 354.089 311.68 366.494C340.657 357.209 366.419 340.741 386.871 319.185C386.261 305.434 383.498 292.242 378.911 279.939C364.932 300.204 346.03 316.811 323.934 328.035ZM381.627 275.859C386.514 288.143 389.623 301.326 390.636 315.092C410.219 293.134 424.47 266.318 431.358 236.678C423.849 225.211 414.778 215.305 404.592 207.079C402.726 232.288 394.546 255.74 381.627 275.859ZM404.872 202.203C415.304 210.262 424.666 219.988 432.527 231.264C434.805 219.863 436 208.071 436 196C436 177.791 433.281 160.217 428.227 143.661C416.029 137.668 403.281 133.776 390.421 131.868C399.764 151.27 405 173.024 405 196C405 198.078 404.957 200.146 404.872 202.203ZM388.243 127.529C401.232 129.177 414.14 132.775 426.543 138.437C416.983 110.27 400.601 85.2528 379.364 65.3541C365.927 66.3463 353.064 69.3965 341.086 74.1908C360.813 87.8342 377.064 106.146 388.243 127.529Z">
								css
									fill: #180622
									origin: 50% 50%
									transform: rotateZ({scroller.get('burnPlayVideo') * 180}deg)
							<path d="M255 58.0146C250.262 58.082 245.582 58.388 240.971 58.9214L255 165.482V58.0146ZM240.94 58.9349C216.192 61.8089 193.514 71.1854 174.582 85.3048L240.011 170.575L186.268 77.4882L189.732 75.4882L243.476 168.576L202.342 69.2703L206.038 67.7396L247.17 167.042L219.351 63.2198L223.215 62.1845L251.035 166.01L237.005 59.4417L240.94 58.9349ZM171.932 87.331C172.685 86.7407 173.444 86.1581 174.209 85.5832L171.932 87.331ZM171.41 87.7421C167.731 90.6543 164.205 93.7501 160.844 97.0155L236.838 173.01L171.41 87.7421ZM158.015 99.8439C154.75 103.205 151.654 106.731 148.742 110.41L234.007 175.836L158.015 99.8439ZM146.617 113.164C147.169 112.429 147.729 111.7 148.295 110.977L146.617 113.164ZM146.305 113.581C132.157 132.552 122.771 155.282 119.917 180.002L120.422 176.14L227.233 190.094L123.185 162.215L124.22 158.351L228.046 186.171L128.74 145.037L130.27 141.342L229.573 182.474L136.489 128.732L138.489 125.268L231.575 179.011L146.305 113.581ZM119.905 180.106C119.382 184.673 119.081 189.308 119.014 194H226.251L119.905 180.106ZM119.014 198C119.081 202.738 119.388 207.419 119.921 212.03L226.486 198H119.014ZM119.927 212.086C122.793 236.772 132.174 259.471 146.305 278.419L231.581 212.985L138.489 266.732L136.489 263.268L229.569 209.528L130.271 250.658L128.74 246.963L228.048 205.828L124.22 233.649L123.185 229.785L227.007 201.966L120.442 215.996L119.927 212.086ZM148.325 281.061C147.738 280.313 147.159 279.559 146.588 278.798L148.325 281.061ZM148.742 281.591C151.654 285.269 154.75 288.796 158.015 292.157L234.005 216.167L148.742 281.591ZM159.609 293.771C159.482 293.645 159.356 293.518 159.229 293.391L159.609 293.771ZM160.843 294.985C164.204 298.25 167.731 301.346 171.41 304.259L236.838 218.991L160.843 294.985ZM174.223 306.428C173.448 305.846 172.68 305.257 171.918 304.659L174.223 306.428ZM174.581 306.696C193.552 320.844 216.283 330.23 241.003 333.083L237.139 332.578L251.094 225.77L223.215 329.815L219.351 328.78L247.17 224.959L206.038 324.261L202.342 322.73L243.475 223.428L189.733 316.512L186.268 314.512L240.013 221.424L174.581 306.696ZM241.106 333.095C245.673 333.619 250.308 333.92 255 333.986V226.747L241.106 333.095ZM256.679 334C256.786 334 256.893 334 257 334C257.107 334 257.214 334 257.321 334H256.679ZM259 333.986C263.738 333.919 268.419 333.613 273.03 333.079L259 226.51V333.986ZM273.099 333.071C297.78 330.204 320.474 320.824 339.419 306.696L273.99 221.427L327.732 314.511L324.268 316.511L270.526 223.428L311.659 322.73L307.963 324.261L266.829 224.955L294.649 328.78L290.785 329.815L262.967 225.994L276.996 332.558L273.099 333.071ZM341.999 304.724C341.292 305.278 340.579 305.824 339.862 306.364L341.999 304.724ZM342.591 304.258C346.269 301.346 349.796 298.25 353.156 294.985L277.163 218.992L342.591 304.258ZM354.769 293.392C354.644 293.518 354.518 293.644 354.392 293.77L354.769 293.392ZM355.985 292.157C359.25 288.796 362.346 285.269 365.259 281.59L279.989 216.161L355.985 292.157ZM367.399 278.815C366.836 279.564 366.266 280.308 365.688 281.045L367.399 278.815ZM367.696 278.419C381.843 259.448 391.229 236.718 394.083 211.999L393.578 215.861L286.774 201.907L390.815 229.785L389.78 233.649L285.959 205.83L385.261 246.962L383.73 250.658L284.425 209.524L377.512 263.268L375.512 266.732L282.427 212.989L367.696 278.419ZM394.095 211.895C394.618 207.327 394.919 202.692 394.986 198H287.744L394.095 211.895ZM394.986 194C394.918 189.262 394.612 184.582 394.079 179.971L287.514 194H394.986ZM394.064 179.842C391.188 155.184 381.813 132.512 367.696 113.582L282.433 179.007L375.512 125.268L377.512 128.732L284.421 182.478L383.731 141.342L385.261 145.038L285.961 186.169L389.78 158.351L390.816 162.215L286.991 190.034L393.559 176.005L394.064 179.842ZM365.718 110.994C366.275 111.706 366.826 112.424 367.37 113.147L365.718 110.994ZM365.258 110.41C362.346 106.732 359.25 103.205 355.985 99.8439L279.987 175.842L365.258 110.41ZM353.156 97.0155C349.795 93.7501 346.269 90.6544 342.59 87.7422L277.163 173.009L353.156 97.0155ZM339.876 85.6476C340.584 86.1801 341.287 86.7192 341.984 87.2649L339.876 85.6476ZM339.419 85.3049C320.449 71.1577 297.719 61.772 273 58.918L276.861 59.4224L262.907 166.229L290.785 62.1846L294.649 63.2198L266.829 167.045L307.963 67.739L311.658 69.2698L270.525 168.576L324.268 75.4886L327.733 77.4886L273.991 170.572L339.419 85.3049ZM272.894 58.9059C268.327 58.3821 263.692 58.0813 259 58.0146V165.254L272.894 58.9059Z">
								css
									fill: #180622
									origin: 50% 50%
									transform: rotateZ({scroller.get('burnPlayVideo') * -180}deg)
							<g stroke="url(#progress-gradient)">
								<circle.inertia cx="50%" cy="50%" r="188">
									css
										stroke-dashoffset: {(1 - scroller.get('burnPlayVideo')) * 257}
								<circle.engine cx="50%" cy="50%" r="188">
									css
										stroke-dashoffset: {(1 - scroller.get('burnPlayVideo')) * 350}
						<.params>
							<.param .boom=(scroller.get('burnPlayVideo') == 1)>
								<img src="../public/icons/engine.svg">
								<h6> 1 + Math.round(scroller.get('burnPlayVideo') * 13)
							<.param .boom=(scroller.get('burnPlayVideo') == 1)>
								<img src="../public/icons/inertia.svg">
								<h6> Math.round(scroller.get('burnPlayVideo') * 9)
			<.content>
				<h3$burnTitle> 'Key Burning'
					css
						o: {scroller.get('burnTitle')}
						transform: translateY({(1 - scroller.get('burnTitle')) * 50}px)
				<p$burnText> 'Burn Access Keys of any type and combine their characteristics to get a more powerful Spaceship that increases your chances of winning the Space Race.'
					css
						o: {scroller.get('burnText')}
						transform: translateY({(1 - scroller.get('burnText')) * 75}px)
				<.key-types-box>
					<.key-types>
						<.line .in=scroller.get('burnSymb')>
							css
								origin: 100% 50%
								animation-delay: .4s
						<img .in=scroller.get('burnSymb') src="./media/type-a.svg">
							css
								animation-delay: .2s
						<svg.plus .in=scroller.get('burnSymb') viewBox="0 0 8 8">
							css
								animation-delay: .15s
							<line x1="1" x2="7" y1="4" y2="4">
							<line x1="4" x2="4" y1="1" y2="7">
						<img .in=scroller.get('burnSymb') src="./media/type-b.svg">
						<svg.plus .in=scroller.get('burnSymb') viewBox="0 0 8 8">
							<line x1="1" x2="7" y1="4" y2="4">
							<line x1="4" x2="4" y1="1" y2="7">
						<img .in=scroller.get('burnSymb') src="./media/type-c.svg">
						<svg.plus .in=scroller.get('burnSymb') viewBox="0 0 8 8">
							css
								animation-delay: .15s
							<line x1="1" x2="7" y1="4" y2="4">
							<line x1="4" x2="4" y1="1" y2="7">
						<img .in=scroller.get('burnSymb') src="./media/type-d.svg">
							css
								animation-delay: .2s
						<.line .in=scroller.get('burnSymb')>
							css
								origin: 0% 50%
								animation-delay: .4s
						<.gradient>
					<i> "Burn four keys, one of each type, to receive a 20-point special bonus for each of your Spaceship's parameters."
						css
							o: {scroller.get('burnSubText')}
							transform: translateY({(1 - scroller.get('burnSubText')) * 75}px)

tag Clouds
	videoduration = 0
	visible

	prop webgl = false
	prop camera
	prop scene
	prop renderer

	prop mesh
	prop geometry
	prop material

	prop mouseX = 0
	prop mouseY = 0
	prop start_time = Date.now!

	prop windowHalfX = window.innerWidth / 2
	prop windowHalfY = window.innerHeight / 2

	def mount
		try 
			webgl = !!window.WebGLRenderingContext && !!document.createElement( 'canvas' ).getContext( 'experimental-webgl' )
		catch e 
			webgl = false

		camera = new THREE.PerspectiveCamera(30, $cloudcanvas.width / $cloudcanvas.height, 1, 3000)
		camera.position.z = 6000

		scene = new THREE.Scene!
		// @ts-ignore
		geometry = new THREE.Geometry!

		let texture = THREE.ImageUtils.loadTexture(clouds.url, nil, anim.bind(self))
		let fog = new THREE.Fog(0x9D2FBF, - 100, 3000)
		let vertexShader = 
			`varying vec2 vUv;
			void main() \{
				vUv = uv;
				gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
			}` 
		let fragmentShader = 
			`uniform sampler2D map;
			uniform vec3 fogColor;
			uniform float fogNear;
			uniform float fogFar;
			varying vec2 vUv;
			void main() \{
				float fogFactor = smoothstep(fogNear, fogFar, gl_FragCoord.z / gl_FragCoord.w);
				gl_FragColor = texture2D(map, vUv);
				gl_FragColor.w *= pow(gl_FragCoord.z, 20.0);
				gl_FragColor = mix(gl_FragColor, vec4(fogColor, gl_FragColor.w), fogFactor);
			}`
		let uniform = 
			map: {type: "t", value: texture}
			fogColor: {type: "c", value: fog.color}
			fogNear: {type: "f", value: fog.near}
			fogFar: {type: "f", value: fog.far}
		
		material = new THREE.ShaderMaterial
			uniforms: uniform
			vertexShader: vertexShader
			fragmentShader: fragmentShader
			depthWrite: false
			depthTest: false
			transparent: true

		let plane = new THREE.Mesh(new THREE.PlaneGeometry(64, 64))
		for i in [0 ... 8000]
			plane.position.x = Math.random! * 1200 - 600
			plane.position.y = - Math.random! * Math.random! * 200 - 15
			plane.position.z = i
			plane.rotation.z = Math.random! * Math.PI
			plane.scale.y = Math.random! * Math.random! * 1.5 + 0.5
			plane.scale.x = plane.scale.y
			
			THREE.GeometryUtils.merge(geometry, plane)

		mesh = new THREE.Mesh(geometry, material)
		scene.add(mesh)
		mesh = new THREE.Mesh(geometry, material)
		mesh.position.z = - 8000
		scene.add(mesh)

		renderer = new THREE.WebGLRenderer({antialias: false, canvas: $cloudcanvas})
		renderer.setSize($cloudcanvas.width, $cloudcanvas.height)

		# document.addEventListener('mousemove', onDocumentMouseMove.bind(self))
		window.addEventListener('resize', onWindowResize.bind(self))

	def onDocumentMouseMove  event
		mouseX = ( event.clientX - windowHalfX ) * 0.25
		mouseY = ( event.clientY - windowHalfY ) * 0.15

	def onWindowResize event
		camera.aspect = $cloudcanvas.width / $cloudcanvas.height
		camera.updateProjectionMatrix!
		renderer.setSize($cloudcanvas.width, $cloudcanvas.height)

	def anim
		window.requestAnimationFrame(anim.bind(self)) if visible
		# camera.position.x += (mouseX - camera.position.x) * 0.01
		# camera.position.y += (-mouseY - camera.position.y) * 0.01
		camera.position.z = -((Date.now() - start_time) * 0.05) % 8000 + 8000
		camera.position.y = 100 - scroller.get('cloudsCamera') * 125
		renderer.render(scene, camera)

	def setup
		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			window.requestAnimationFrame(anim.bind(self)) if visible
		observer.observe(self)

		scroller.add('cloudsSpaceship1',	self, 	{view: top, gap: (do screen.height * .5),	height: (do screen.height), 	edge: bottom})
		scroller.add('cloudsSpaceship2',	self, 	{view: top, gap: (do screen.height * 0.35),	height: (do screen.height), 	edge: bottom})
		scroller.add('cloudsSpaceship3',	self, 	{view: top, gap: (do screen.height * 0.2),	height: (do screen.height), 	edge: bottom})
		scroller.add('cloudsCamera',		self, 	{view: top, gap: (do screen.height * 0.4),	height: (do screen.height), 	edge: bottom})
		scroller.add('cloudsText',			self, 	{view: top, gap: (do screen.height * 0.8),	height: (do screen.height), 	edge: bottom})

	css self
		.extra
			zi: 0
			pos: relative
			bg: radial-gradient(200% 100% at 50% -5%, #120519 15%, #FE039A 44.82%, #4E01FF 120%)
			&:before
				# zi: 0
				content: ''
				pos: absolute l: 0 t: 0 r: 0
				h: 100vh
				bg: linear-gradient(180deg, #120519 15%, rgba(18, 5, 25, 0))
			&:after
				content: ''
				pos: absolute l: 0 t: 100% r: 0
				h: 50vh
				bg: #4E01FF
			.content
				zi: 0
				pos: relative
				h: 150vh
				d: flex ai: start
				.content-box
					pos: sticky
					w: 100%
					d: flex fld: column ai: start g: 4px
					p
						c: #FE039A
						fs: 16px fw: 800 tt: uppercase ls: 1px
					>>> svg
						w: 100%
						d: block
						text
							o: .8
							fill: #120519
							font-size: 15.3px
							fw: 900 lh: 1em tt: uppercase ta: center
		.clouds-container
			zi: 10
			pos: relative
			h: 100vh
			mt: -100vh
			of: hidden
		.video-container
			zi: 11
			pos: sticky !@420: static t: 0
			d: flex jc: center
			of: hidden
			# bg: rgba(18, 6, 25, 1)
			# bg: #4E01FF
			.spaceships
				zi: 1000
				h: 100vh w: 100%
				d: block
				mb: 20vh
				.spaceship
					zi: 11
					pos: absolute
					l: 0 t: 0 b: 0 r: 0
					object-fit: cover
					&:nth-child(2)
						l: -15vw !@640: -25vw r: auto # t: 20vh
					&:nth-child(3)
						r: -15vw !@640: -25vw l: auto # t: 75vh 
			.clouds
				zi: 10
				d: block
				pos: absolute l: 0 r: 0 b: 0
				&:before
					content: ''
					pos: absolute
					l: 0 r: 0 b: 0
					h: 50vh
					bg: linear-gradient(to top, rgba(255,255,255,1), rgba(255,255,255,0))

	def render
		<self>
			<.extra>
				<.content>
					<$content-box .content-box [t: calc(50vh - {$svgprelaunch.clientHeight}px / 2)]>
						<p$supertext> 'Elysium Pioneer Programm'
							css
								o: {0.75 * scroller.get('cloudsText')}
								transform: translateX({(1 - scroller.get('cloudsText')) * ($content-box.clientWidth - $supertext.clientWidth)}px)
						<svg$svgprelaunch viewBox="0 0 100 13">
							<text>
								<tspan x="-1" y="12"> 'Prelaunch'
			<.clouds-container>
				<.video-container>
					<.spaceships>
						<Play .spaceship src=prelaunch json=prelaunchjson width=1280 height=1280 ratio=scroller.get('cloudsSpaceship1')>
						<Play .spaceship src=prelaunch json=prelaunchjson width=1280 height=1280 ratio=scroller.get('cloudsSpaceship2')>
						<Play .spaceship src=prelaunch json=prelaunchjson width=1280 height=1280 ratio=scroller.get('cloudsSpaceship3')>
					<$cloudcontainer .clouds>
						<canvas$cloudcanvas width="{window.innerWidth}" height=screen.height style="object-fit:cover;">

tag Prelaunch
	css self
		zi: 100
		pos: relative
		pb: 200px !@640: 80px
		bg: #ffffff
		# bg: linear-gradient(to bottom, rgba(255,255,255,0), rgba(255,255,255,1) 200px)
		# pt: 15vh
		&:before
			content: ''
			pos: absolute
			l: 0 r: 0 b: 100%
			h: 20vh
			bg: linear-gradient(to top, rgba(255,255,255,1), rgba(255,255,255,0))
		.content
			g: 16px
			mb: 80px
			&.grid
				m: 0 auto
				d: grid g: 40px 80px
				gtc: repeat(auto-fill, minmax(300px, 1fr))
		.hidden-box
			w: 100%
			of: hidden
		.mask-box
			pos: relative
			w: 100%
			# of: hidden
			mask-image: url('./media/prelaunch-mask.webp')
			-webkit-mask-image: url('./media/prelaunch-mask.webp')
			mask-size: 100% auto
			-webkit-mask-size: 100% auto
			mask-repeat: no-repeat
			-webkit-mask-repeat: no-repeat
			p
				o: .75
				fs: 16px fw: 800 tt: uppercase ls: 1px
			img
				pos: absolute l: 0 r: 0
				w: 100% h: auto
				transform: scaleY(-1)
			>>> svg
				w: 100%
				text
					font-size: 15.3px
					fw: 900 lh: 1em tt: uppercase ta: center
		.feature-block
			pos: relative
			d: flex fld: column g: 40px ai: start
		.feature
			d: flex fld: column g: 12px
		.inertia
			as: center js: center
			pos: relative
			h: auto
			w: 100% <380px
			# mt: -75px !@760: 0
			# mb: 40px !@760: 20px
			img
				zi: 5
				w: 100%
				pos: absolute
				&:last-child zi: 3 pos: relative
				&:nth-child(2) zi: 2

	def setup
		scroller.add('prelaunchCloudMask',			self,					{view: bottom, 	gap: (do screen.height / 10), 		height: (do screen.height / 2), 	edge: top})
		scroller.add('prelaunchSubText',			$prelaunchContent,		{view: bottom, 	gap: (do screen.height / 3.5), 		height: (do 100), 	edge: top})

		scroller.add('prelaunchStakingTitle',		$prelaunchStaking,		{view: bottom, 	gap: (do 150), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchStakingSubTitle',	$prelaunchStaking,		{view: bottom, 	gap: (do 250), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchStakingText1',		$prelaunchStaking,		{view: bottom, 	gap: (do 350), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchStakingText2',		$prelaunchStaking,		{view: bottom, 	gap: (do 450), 						height: (do 100), 	edge: top})

		scroller.add('prelaunchBurningTitle',		$prelaunchBurning,		{view: bottom, 	gap: (do 150), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchBurningSubTitle',	$prelaunchBurning,		{view: bottom, 	gap: (do 250), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchBurningText1',		$prelaunchBurning,		{view: bottom, 	gap: (do 350), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchBurningText2',		$prelaunchBurning,		{view: bottom, 	gap: (do 450), 						height: (do 100), 	edge: top})

		scroller.add('prelaunchImages',				$prelaunchImages,		{view: bottom, 	gap: (do 0), 						height: (do 500), 	edge: top})

		scroller.add('prelaunchInertiaSubTitle',	$prelaunchInertia,		{view: bottom, 	gap: (do 150), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchInertiaSubText',		$prelaunchInertia,		{view: bottom, 	gap: (do 250), 						height: (do 100), 	edge: top})
		scroller.add('prelaunchInertiaNote',		$prelaunchInertia,		{view: bottom, 	gap: (do 350), 						height: (do 200), 	edge: top})

	def render
		<self>
			<$prelaunchContent.content>
				<.mask-box>
					css
						-webkit-mask-position: 0% {(scroller.get('prelaunchCloudMask') - .5) * 200}%
						mask-position: 0% {(scroller.get('prelaunchCloudMask') - .5) * 200}%
					<p> 'Elysium Pioneer Program'
					<svg viewBox="0 0 100 13">
						<linearGradient id="text-rainbow" x1="0" x2="100%" y1="100%" y2="0">
							<stop stop-color="#4E01FF">
							<stop stop-color="#FE039A" offset="1"> 
						<text fill="url(#text-rainbow)">
							<tspan x="-1" y="12"> 'Prelaunch'
					# <img src='./media/prelaunch-mask.png'>
					# 	css
					# 		b: {(scroller.get('prelaunchCloudMask') - .5) * 200}%
				<.hidden-box>
					<p.dark> "During the Prelaunch stage, you can stake or burn your Access Keys."
						css
							w: 100% <440px
							o: {scroller.get('prelaunchSubText')}
							transform: translateX({(1 - scroller.get('prelaunchSubText')) * 50}px)
			<.content.grid>
				<$prelaunchStaking .feature-block>
					<h4> 'Key Staking'
						css
							o: {scroller.get('prelaunchStakingTitle')}
							transform: translateY({(1 - scroller.get('prelaunchStakingTitle')) * 50}px)
					<.feature>
						<p.dark> 'Inertia Retention'
							css
								o: {scroller.get('prelaunchStakingSubTitle')}
								transform: translateY({(1 - scroller.get('prelaunchStakingSubTitle')) * 50}px)
						<i.dark> "The Inertia Retention parameter of an Access Key can be upgraded by one point every 30 days of staking. The Inertia Retention limit per key is 12 points. In other words, a key could not be in staking for more than 360 days."
							css
								o: {scroller.get('prelaunchStakingText1')}
								transform: translateY({(1 - scroller.get('prelaunchStakingText1')) * 50}px)
						<i.dark> "When the user unstakes the key, the days that have passed since the last added point are nulled."
							css
								o: {scroller.get('prelaunchStakingText2')}
								transform: translateY({(1 - scroller.get('prelaunchStakingText2')) * 50}px)
				<$prelaunchBurning.feature-block>
					<h4> 'Key Burning'
						css
							o: {scroller.get('prelaunchBurningTitle')}
							transform: translateY({(1 - scroller.get('prelaunchBurningTitle')) * 50}px)
					<.feature>
						<p.dark> 'Forced Launch'
							css
								o: {scroller.get('prelaunchBurningSubTitle')}
								transform: translateY({(1 - scroller.get('prelaunchBurningSubTitle')) * 50}px)
						<i.dark> "The electromagnetic catapult launches all spaceships from the Earth. Catapulting allows a ship to acquire a non-zero base speed at which it will move if no artificial inertia is left."
							css
								o: {scroller.get('prelaunchBurningText1')}
								transform: translateY({(1 - scroller.get('prelaunchBurningText1')) * 50}px)
						<i.dark> "The catapult's power decreases with each launch. So during the prelaunch phase, there is a queue for catapulting. Burning the keys allows you to advance in this queue."
							css
								o: {scroller.get('prelaunchBurningText2')}
								transform: translateY({(1 - scroller.get('prelaunchBurningText2')) * 50}px)
			<.content.grid[mt: 40px]>
				<$prelaunchImages .inertia>
					<img src='./media/inertia-plus3.webp'>
						css
							transform: translateY({(1 - scroller.get('prelaunchImages')) * 250}px)
					<img src='./media/inertia-plus2.webp'>
						css
							transform: translateY({(1 - scroller.get('prelaunchImages')) * 150}px)
					<img src='./media/inertia-plus1.webp'>
						css
							transform: translateY({(1 - scroller.get('prelaunchImages')) * 350}px)
					<img src='./media/inertia.webp'>
						css
							transform: translateY({(1 - scroller.get('prelaunchImages')) * 200}px)
				<$prelaunchInertia .feature-block[g: 24px]>
					<.feature>
						<p.dark> 'Inertia Retention'
							css
								o: {scroller.get('prelaunchInertiaSubTitle')}
								transform: translateY({(1 - scroller.get('prelaunchInertiaSubTitle')) * 50}px)
						<i.dark> "It is more advantageous to burn keys than to stake them in terms of the Inertia Retention parameter. Until the official race starts, all acquired ships will increase their Inertia Retention parameter depending on the number of keys burned without any limits. Each burned key cuts the reward period by 15%."
							css
								o: {scroller.get('prelaunchInertiaSubText')}
								transform: translateY({(1 - scroller.get('prelaunchInertiaSubText')) * 50}px)
					<i.color> "For example, if you are staking three keys for 30 days, each will get +1 Inertia Retention. If you burn a key to obtain a ship and then burn two more keys (three in total), your spaceship will receive a point every 6.14 days, or it will get almost +5 Inertia Retention points in 30 days."
						css
							o: {scroller.get('prelaunchInertiaNote')}
							transform: translateY({(1 - scroller.get('prelaunchInertiaNote')) * 50}px)

tag Soon
	css self
		pos: relative
		p: 80px 0
		bg: linear-gradient(254deg, #F8059E, #5403FC)
		&:before
			content: ''
			pos: absolute l: 0 r: 0 b: 100% h: 110px
			bg: #ffffff
		p
			c: #ffffff
			ta: center
		.content
			pos: relative
			fld: column flw: nowrap
			ai: center g: 0px
			.soon-box
				d: flex jc: center
				w: 100% <800px
				of: hidden
				mask-image: linear-gradient(to top, rgba(255,255,255,0), rgba(255,255,255,1) 40px)
				mask-repeat: no-repeat
				-webkit-mask-image: linear-gradient(to top, rgba(255,255,255,0), rgba(255,255,255,1) 40px)
				-webkit-mask-repeat: no-repeat
				pb: 40px
				>>> svg
					d: block w: 100% h: auto
					text
						fill: #ffffff
						font-size: 12.7px
						fw: 900 lh: 1em tt: uppercase ta: center
				.coming-soon
					ff: 'Montserrat'
					fs: 7.5cqw
					fw: 900 lh: 1em
					c: #ffffff
					tt: uppercase
					ta: center
			i
				ta: center
				w: 100% <440px
			.social
				d: flex fld: column ai: center g: 24px
			.social-icons
				d: flex ai: center jc: center g: 32px
				>>> svg
					d: block
					stroke: none
					stroke-linejoin: round
					m: 0
					p: 0
					cursor: pointer
					w: 32px
					fill: #ffffff
					tween: ease 0.2s
					&:hover
						fill: #fff

	def mount
		scroller.add('soonTag',			self,	{view: bottom, 	gap: (do 0), 						height: (do self.clientHeight), 		edge: top})
		scroller.add('soonTitle',		self,	{view: bottom, 	gap: (do self.clientHeight / 2), 	height: (do self.clientHeight / 2), 	edge: top})
		scroller.add('soonText',		self,	{view: bottom, 	gap: (do 0), 						height: (do self.clientHeight), 		edge: top})
		scroller.add('soonSocialText',	self,	{view: bottom, 	gap: (do self.clientHeight / 2), 	height: (do self.clientHeight), 		edge: top})
		scroller.add('soonSocialIcon',	self,	{view: bottom, 	gap: (do self.clientHeight), 		height: (do self.clientHeight * 0.15), 	edge: top})

	def render
		<self>
			css
				transform: translateY({(1 - scroller.get('soonTag')) * 100}px)
			<.content[mix-blend-mode: soft-light mb: 4px]>
				<p> 'Prelaunch will start with Access Key minting'
					css
						transform: translateY({(1 - scroller.get('soonText')) * 50}px) o: {scroller.get('soonText')}
			<.content>
				<.soon-box>
					<svg viewBox="0 0 100 12">
						css
							o: {scroller.get('soonTitle')}
							transform: translateY({(1 - scroller.get('soonTitle')) * 50}px)
						<text fill="#ffffff">
							<tspan x="0" y="11"> 'Coming Soon'
				<.social>
					<i> "Follow us on social media so you don't miss the start of the incredible journey to Elysium:"
						css
							o: {scroller.get('soonSocialText')}
							transform: translateY({(1 - scroller.get('soonSocialText')) * 50}px)
					<.social-icons>
						<a href="https://twitter.com/elysium_chain" target="_blank" title="Elysium Twitter">
							<Twitter>
								css
									o: {scroller.get('soonSocialIcon')}
									transform: scale({scroller.get('soonSocialIcon')})
						<a href="https://discord.gg/elysiumchain" target="_blank" title="Elysium Discord">
							<Discord>
								css
									o: {scroller.get('soonSocialIcon')}
									transform: scale({scroller.get('soonSocialIcon')})

tag Footer
	css self
		p: 40px 0
		bg: #ffffff
		.content
			jc: space-between !@617: center
			g: 24px 64px flw: wrap-reverse
			.links
				d: flex g: 40px

	def render
		<self>
			<.content>
				<i.dark> '© 2023. Elysium Team.'
				<.links>
					<a href="https://www.elysium-chain.com" target="_blank"><i.dark> 'Elysium Main Site'
					<a href="https://docs.elysium-chain.com/en/join/pioneers-program" target="_blank"><i.dark><i.dark> 'Elysium Docs'

tag Page
	def render
		<self .mobile=mobile>
			# <Zone scroller=scroller name='introText'>
			<Intro>
			<Spaceship>
			<Resources>
			<Rewards>
			<Strategy>
			<Profit>
			<Prize>
			<PioneerAccess>
			<AccessKey>
			<KeyBurning>
			<Clouds>
			<Prelaunch>
			<Soon>
			<Footer>

imba.mount <Page>

# Webm with opacity
# Downloads/123/ffmpeg -i ~/Downloads/123/PrelaunchAlpha.mov -c:v libvpx-vp9 -crf 5 -g 1 -pix_fmt yuva420p ~/Downloads/123/prelaunch-alpha.webm

# MP4
# Downloads/123/ffmpeg -i ~/Downloads/123/Prelaunch.mov  -movflags faststart -vcodec libx264 -crf 15 -g 1 -pix_fmt yuv420p ~/Downloads/123/prelaunch.mp4