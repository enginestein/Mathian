require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "ScottPlot, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

class Plotter
	# Function to plot an equation on a graph and save it as a PNG file
	def Plotter.PlotEquation(equation, xMin, xMax, pointCount)
		x = Plotter.GenerateXValues(xMin, xMax, pointCount)
		y = Plotter.GenerateYValues(equation, x)
		# Create a new Plot object
		plt = ScottPlot.Plot.new()
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
	end

	# Function to generate X values
	def Plotter.GenerateXValues(xMin, xMax, pointCount)
		x = Array.CreateInstance(System::Double, pointCount)
		step = (xMax - xMin) / (pointCount - 1)
		i = 0
		while i < pointCount
			x[i] = xMin + i * step
			i += 1
		end
		return x
	end

	# Function to generate Y values based on the equation
	def Plotter.GenerateYValues(equation, xValues)
		yValues = Array.CreateInstance(System::Double, xValues.Length)
		i = 0
		while i < xValues.Length
			yValues[i] = Plotter.equation(xValues[i])
			i += 1
		end
		return yValues
	end
end