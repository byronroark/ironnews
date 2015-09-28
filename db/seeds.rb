require_relative '../ironnews'

author = Author.create(name: "Zed Shaw", email: "help@learncodethehardway.org")
author.stories.create(title: "Learn Ruby the Hard Way", link: "http://learnrubythehardway.org/book/")
author = Author.create(name: "Peter Cooper", email: "peter.cooper@gmail.com")
author.stories.create(title: "What Ruby's ||= (Double Pipe / Or Equals) Really Does", link: "http://www.rubyinside.com/what-rubys-double-pipe-or-equals-really-does-5488.html")
author = Author.create(name: "Jim Weirich", email: "contact@neo.com")
author.stories.create(title: "Learn Ruby with the Neo Ruby Koans", link: "http://rubykoans.com/")
