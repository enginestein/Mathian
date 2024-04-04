from System import *

class Matrix(object):
	def get_Rows(self):

	Rows = property(fget=get_Rows)

	def get_Cols(self):

	Cols = property(fget=get_Cols)

	def __init__(self, data):
		self.Rows = data.GetLength(0)
		self.Cols = data.GetLength(1)
		self.__data = data

	def __init__(self, data):
		self.Rows = data.GetLength(0)
		self.Cols = data.GetLength(1)
		self.__data = data

	def get_Item(self):

	Item = property(fget=get_Item)