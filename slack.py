import sys
from slacker import Slacker

token = sys.argv[1]
channel = sys.argv[2]
slug = sys.argv[3]
branch = sys.argv[4]

slack = Slacker(token)

slack.chat.post_message(channel, 'Check out updated branch ' + branch + ' at http://' + slug + '.docker.kunstmaan.com')
