from System import *
from System.Collections.Generic import *
from System.Linq import *
from System.Text import *
from System.Threading.Tasks import *
from OxyPlot import *
from OxyPlot.Axes import *
from OxyPlot.Series import *
from OxyPlot.WindowsForms import *

class Plot3D(object):
	def Plot(equation, xMin, xMax, yMin, yMax, pointCount):
		plotModel = OxyPlot.PlotModel()
		plotModel.Axes.Add(OxyPlot.Axes.LinearAxis(Position = OxyPlot.Axes.AxisPosition.Bottom))
		plotModel.Axes.Add(OxyPlot.Axes.LinearAxis(Position = OxyPlot.Axes.AxisPosition.Left))
		plotModel.Axes.Add(OxyPlot.Axes.LinearColorAxis(Position = OxyPlot.Axes.AxisPosition.Right))
		xValues = Plot3D.GenerateValues(xMin, xMax, pointCount)
		yValues = Plot3D.GenerateValues(yMin, yMax, pointCount)
		series = OxyPlot.Series.HeatMapSeries(X0 = xMin, X1 = xMax, Y0 = yMin, Y1 = yMax, Data = Plot3D.GenerateHeatMapData(equation, xValues, yValues, pointCount))
		plotModel.Series.Add(series)
		plotView = OxyPlot.WindowsForms.PlotView(Model = plotModel, Width = 800, Height = 600)
		form = System.Windows.Forms.Form()
		form.Controls.Add(plotView)
		# Show the plot
		form.ShowDialog()

	Plot = staticmethod(Plot)

	def GenerateValues(min, max, pointCount):
		values = Array.CreateInstance(Double, pointCount)
		step = (max - min) / (pointCount - 1)
		i = 0
		while i < pointCount:
			values[i] = min + i * step
			i += 1
		return values

	GenerateValues = staticmethod(GenerateValues)

	def GenerateHeatMapData(equation, xValues, yValues, pointCount):
		data = Array.CreateInstance(Double, pointCount, pointCount)
		i = 0
		while i < pointCount:
			j = 0
			while j < pointCount:
				data[i][j] = Plot3D.equation(xValues[i], yValues[j])
				j += 1
			i += 1
		return data

	GenerateHeatMapData = staticmethod(GenerateHeatMapData)