import sys
from slacker import Slacker

token = sys.argv[1]
channel = sys.argv[2]
message = sys.argv[3]

slack = Slacker(token)

slack.chat.post_message(channel, message)
