from PIL import Image

radius = 14

im = Image.open("./map.png").convert('1')

im2 = im.rotate(0)
print im.size
for x in xrange(im.size[0]):
	for y in xrange(im.size[1]):
		if im.getpixel((x, y)) == 0:
			for x_fill in xrange(-radius, radius):
				for y_fill in xrange(-radius, radius):
					if x_fill ** 2 + y_fill ** 2 < radius ** 2:
						if (x_fill + x >= 0 and y_fill + y >= 0 and
							x_fill + x < im.size[0] and y_fill + y < im.size[1]):
							im2.putpixel((x + x_fill, y + y_fill), 0)
im2.show()