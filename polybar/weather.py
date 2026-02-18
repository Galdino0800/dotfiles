#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:filetype=python

import urllib.request, json

city = "Juazeiro do Norte"
api_key = "9491e96f1dde971960f9b326cd257f11"
units = "metric"
unit_key = "C"

weather = eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}&units={}".format(city, api_key, units)).read())[2:-1])

info = weather["weather"][0]["description"].capitalize()
temp = int(float(weather["main"]["temp"]))

print("%s, %i°%s" % (info, temp, unit_key))