_ = require 'underscore'
Spine._ = require 'underscore'
$      = Spine.$

Cards = require './cards'

class Home extends Cards
  className: 'app-home'

  build: ->
    super

    @gameConsoles = []

    if @settings.romsPath()
      @gameConsoles.push new App.GameConsole(prefix: "arcade", extensions: ["zip"], name: "Arcade")
      @gameConsoles.push new App.GameConsole(prefix: "nes", extensions: ["nes", "zip"], name: "Nintendo Entertainment System")
      @gameConsoles.push new App.GameConsole(prefix: "snes", extensions: ["smc", "zip"], name: "Super Nintendo")
      @gameConsoles.push new App.GameConsole(prefix: "n64", extensions: ["z64", "zip"], name: "Nintendo 64")
      @gameConsoles.push new App.GameConsole(prefix: "gb", extensions: ["gb", "gbc", "zip"], name: "GameBoy")
      @gameConsoles.push new App.GameConsole(prefix: "gba", extensions: ["gba", "zip"], name: "GameBoy Advance")
      @gameConsoles.push new App.GameConsole(prefix: "megadrive", extensions: ["bin", "zip"], name: "Sega Genesis")
      @gameConsoles.push new App.GameConsole(prefix: "psx", extensions: ["cue", "img"], name: "Sony Playstation")

      @gameConsoles = _.filter @gameConsoles, (gameConsole) ->
        gameConsole.imageExists()

  render: ->
    super()
    @prepend('<div class="head">d<p class="settings-button btn">Settings</p></div>')

  showGames: (gameConsole) ->
    app.showGames(gameConsole)

  numberOfItems: ->
    @gameConsoles.length

  didPickCardAt: (index) ->
    @showGames(@gameConsoles[index])

  cardFor: (index) ->
    gameConsole = @gameConsoles[index]
    data = {"imagePath": gameConsole.imagePath(), "title": gameConsole.name}
    @view 'main/_card', data

module.exports = Home
