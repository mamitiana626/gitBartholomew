require 'watir'
require 'pry'
require 'selenium-webdriver'
require 'httparty'

browser = Watir::Browser.new(:firefox)
browser.goto 'mbasic.facebook.com'
#login
adress = browser.text_field(id: 'm_login_email')
adress.set("vatexrova@yahoo.fr")
mdp = browser.text_field(class: 'bl bm bo bp')
mdp.set("rovanandrianina")
connexion = browser.button(type:'submit')
connexion.click
browser.driver.manage.timeouts.implicit_wait = 3

#friends
browser.goto 'https://mbasic.facebook.com/rvatex/friends?lst=100002991265576%3A100002991265576%3A1598430319&refid=17&ref=dbl'
friends = browser.div(class: "x cg").a(class: "ch").each {|friend| puts friend.text}

json = File.open("friends.json", "w") {|f| f.write(friends.text)}




binding.pry