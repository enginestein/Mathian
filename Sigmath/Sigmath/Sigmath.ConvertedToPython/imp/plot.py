from System import *
from ScottPlot import *

class Plotter(object):
	# Function to plot an equation on a graph and save it as a PNG file
	def PlotEquation(equation, xMin, xMax, pointCount):
		x = Plotter.GenerateXValues(xMin, xMax, pointCount)
		y = Plotter.GenerateYValues(equation, x)
		# Create a new Plot object
		plt = ScottPlot.Plot()
		# Plot the equation
		plt.PlotScatter(x, y, markerSize = 0, label = "Equation")
		# Add labels and title
		plt.Title("Plot of Equation")
		plt.XLabel("X")
		plt.YLabel("Y")
		# Show the legend
		plt.Legend()
		# Save the plot as a PNG file
		plt.SaveFig("graph.png")

	PlotEquation = staticmethod(PlotEquation)

	# Function to generate X values
	def GenerateXValues(xMin, xMax, pointCount):
		x = Array.CreateInstance(Double, pointCount)
		step = (xMax - xMin) / (pointCount - 1)
		i = 0
		while i < pointCount:
			x[i] = xMin + i * step
			i += 1
		return x

	GenerateXValues = staticmethod(GenerateXValues)

	# Function to generate Y values based on the equation
	def GenerateYValues(equation, xValues):
		yValues = Array.CreateInstance(Double, xValues.Length)
		i = 0
		while i < xValues.Length:
			yValues[i] = Plotter.equation(xValues[i])
			i += 1
		return yValues

	GenerateYValues = staticmethod(GenerateYValues)