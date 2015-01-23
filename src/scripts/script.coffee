canvas = document.querySelector 'canvas'
ctx = canvas.getContext '2d'

window.addEventListener 'DOMContentLoaded', ->

  circleNum = 111
  circles = []
  circles.push new Circle() for i in [0...circleNum]

  (draw = ->
    ctx.clearRect 0, 0, canvas.width, canvas.height

    c.draw() for c in circles

    requestAnimationFrame draw
  )()


class Circle

  constructor: ->
    @xmax = 5
    @ymax = 5
    @rmax = 7

    @x = canvas.width * Math.random()
    @y = canvas.height * Math.random()
    @r = @rmax * Math.random()

    @dx = (Math.random() * @xmax) * (Math.random() < 0.5 ? -1 : 1)
    @dy = (Math.random() * @ymax) * (Math.random() < 0.5 ? -1 : 1)

    @hl = 300 * (@r / @rmax)
    @rt = Math.random() * @hl
    @newo = 1 - @rt / @hl

  draw: ->
    ctx.beginPath()
    ctx.arc @x, @y, @r, 0, Math.PI * 2, true
    ctx.closePath()

    g = ctx.createRadialGradient @x, @y, 0, @x, @y, 1
    g.addColorStop 0.0, 'rgba(255,255,255,0.9)'
    g.addColorStop 0.6, 'rgba(255,255,255,0.7)'
    g.addColorStop 1.0, 'rgba(255,255,255,0.1)'

    ctx.fillStyle = g
    ctx.fill()

    @move()

  move: ->
    @x += (@rt / @hl) * @dx
    @y += (@rt / @hl) * @dy

    @dx *= -1 if @x > canvas.width || @x < 0
    @dy *= -1 if @y > canvas.height || @y < 0
