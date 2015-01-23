canvas = document.querySelector 'canvas'
ctx = canvas.getContext '2d'

window.addEventListener 'DOMContentLoaded', ->
  circleNum = 30
  circles = []
  ctx.clearRect 0, 0, canvas.width, canvas.height

  circles.push new Circle() for i in [0...circleNum]
  c.draw() for c in circles

class Circle

  constructor: ->
    @x = canvas.width * Math.random()
    @y = canvas.height * Math.random()
    @r = 5 * Math.random()
    @alpah = Math.random()

  draw: ->
    ctx.beginPath()
    ctx.arc @x, @y, @r, 0, Math.PI * 2, true
    ctx.closePath()

    ctx.fillStyle = 'rgba(255,255,255,' + @alpah + ')'
    ctx.fill()
