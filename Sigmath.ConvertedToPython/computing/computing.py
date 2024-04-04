class Computing(object):
	def Floor(x):
		return (x if x >= 0 else x - 0.999999999999999)

	Floor = staticmethod(Floor)

	def Ceil(x):
		return (x + 0.999999999999999 if x >= 0 else x)

	Ceil = staticmethod(Ceil)

	def Round(x):
		return (x + 0.5 if x >= 0 else x - 0.5)

	Round = staticmethod(Round)