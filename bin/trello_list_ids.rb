#!/usr/bin/env ruby
# coding: UTF-8

# bin/trello_list_ids.rb
# 
# show list ids and names for given board id
# 
# created on : 2014.01.07
# last update: 2014.02.17
# 
# by meinside@gmail.com

require_relative '../lib/trello_helper'

if __FILE__ == $0
  begin
    config = TrelloHelper.config
  rescue
    puts "* config file does not exist: copy config/trello_config.yml.sample and edit it"
    exit 1
  end

  if ARGV.count <= 0
    puts "* usage: #{__FILE__} [YOUR_BOARD_ID]"
  else
    app_key = config["app_key"]
    user_token = config["user_token"]

    trello = TrelloHelper.authenticate(app_key, user_token)

    board_id = ARGV.first
    trello.lists(board_id).each{|x|
      puts "#{x.name}: #{x.id}"
    }
  end
end

