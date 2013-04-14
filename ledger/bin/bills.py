#!/usr/bin/env python

from subprocess import Popen, PIPE, check_call
from tempfile import mkstemp
from string import rjust, ljust
from smtplib import SMTP
from time import strftime
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import os
import sys
import re


bin = sys.argv.pop(0)
from_addr = sys.argv.pop(0)
to_addr = sys.argv.pop(0)

def strip_line(line):
    line = line.strip()
    line = line.replace("Assets:Receivable:Emily", "")
    parts = re.split(r'\s\s+', line)
    if len(parts) == 3:
        return "".join([ljust(parts[0], 30), rjust(parts[1], 10), rjust(parts[2], 12)])
    else:
        return ""
    
ledger = Popen("ledger reg emily", stdout=PIPE, shell=True)
output = ledger.communicate()[0]


lines = []

for line in output.split("\n"):
    if line[-2:] == " 0":
        lines = []
    lines.append(strip_line(line))

lines.insert(0, 52 * "-")
lines.insert(0, "".join([ljust("Date      Payee", 30), rjust("Amount", 10), rjust("Total", 12)]))

amount = lines[-2][40:].replace(' ', '').replace('$', '')

tempname = mkstemp()[1]

with open(tempname, 'w+') as f:
    for line in lines:
        if line == "":
            continue
        f.write("# %s\n" % line)
    f.write("\n")
    f.write("\n")
    f.write("\n")
    f.write("# Lines starting with # will be ignored\n")
    f.write("\n")

check_call([os.environ['EDITOR'], '+%d' % (len(lines) + 1), tempname])

subject = "Bills as of %s" % (strftime("%Y/%m/%d"))
message = ""
with open(tempname) as f:

    message_lines = []
    for line in f.readlines():
        if line.startswith("#"):
            continue
        message_lines.append(line.strip())

    message = "\n".join(message_lines)
    message = message.strip()

    print ""
    print "From: %s" % from_addr
    print "To: %s" % to_addr
    print "Subject: %s" % subject
    print ""
    print "\n".join(lines)
    print ""
    print message
    print ""

raw_input("Press ENTER to send this or ctrl-c to quit")

username = ""
password = ""

with open("/Users/peter/.bills_credentials") as f:
    username = f.readline().strip()
    password = f.readline().strip()

msg = MIMEMultipart('alternative')
msg['Subject'] = subject
msg['From'] = from_addr
msg['To'] = to_addr

text = """
%s

%s
""" % ("\n".join(lines), message)
html = """
<html>
<head></head>
<body>
<pre>
%s
</pre>
<p>%s</p>
</body>
</html>
""" % ("\n".join(lines), message.replace("\n", "<br>"))
msg.attach(MIMEText(text, 'text'))
msg.attach(MIMEText(html, 'html'))

s = SMTP('smtp.mandrillapp.com', 587)
s.ehlo()
s.starttls()
s.ehlo()
s.login(username, password)
s.sendmail(from_addr, [to_addr, 'pete@bugsplat.info'], msg.as_string())

s.quit()

print "Sent!"
