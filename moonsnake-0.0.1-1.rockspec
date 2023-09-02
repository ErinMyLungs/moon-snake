package = "MoonSnake"
version = "0.0.1-1"
source = {
   url = "git+https://github.com/ErinMyLungs/moon-snake.git"
}
description = {
   summary = "Snake implemented in Moonscript!",
   detailed = [[

## Resources]],
   homepage = "https://github.com/ErinMyLungs/moon-snake",
   license = "MIT"
}
dependencies = {
   "busted 2.1.2-3",
   "moonscript 0.5.0-1",
   "lua 5.2.4"
}
build = {
   type = "builtin",
   modules = {}
}
