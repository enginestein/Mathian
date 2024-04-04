require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Threading.Tasks, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "OxyPlot, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "OxyPlot.Axes, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "OxyPlot.Series, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "OxyPlot.WindowsForms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Plot3D
		def Plot3D.Plot(equation, xMin, xMax, yMin, yMax, pointCount)
			plotModel = OxyPlot.PlotModel.new()
			plotModel.Axes.Add(OxyPlot.Axes.LinearAxis.new(Position = OxyPlot.Axes.AxisPosition.Bottom))
			plotModel.Axes.Add(OxyPlot.Axes.LinearAxis.new(Position = OxyPlot.Axes.AxisPosition.Left))
			plotModel.Axes.Add(OxyPlot.Axes.LinearColorAxis.new(Position = OxyPlot.Axes.AxisPosition.Right))
			xValues = Plot3D.GenerateValues(xMin, xMax, pointCount)
			yValues = Plot3D.GenerateValues(yMin, yMax, pointCount)
			series = OxyPlot.Series.HeatMapSeries.new(X0 = xMin, X1 = xMax, Y0 = yMin, Y1 = yMax, Data = Plot3D.GenerateHeatMapData(equation, xValues, yValues, pointCount))
			plotModel.Series.Add(series)
			plotView = OxyPlot.WindowsForms.PlotView.new(Model = plotModel, Width = 800, Height = 600)
			form = System.Windows.Forms.Form.new()
			form.Controls.Add(plotView)
			# Show the plot
			form.ShowDialog()
		end

		def Plot3D.GenerateValues(min, max, pointCount)
			values = Array.CreateInstance(System::Double, pointCount)
			step = (max - min) / (pointCount - 1)
			i = 0
			while i < pointCount
				values[i] = min + i * step
				i += 1
			end
			return values
		end

		def Plot3D.GenerateHeatMapData(equation, xValues, yValues, pointCount)
			data = Array.CreateInstance(System::Double, pointCount, pointCount)
			i = 0
			while i < pointCount
				j = 0
				while j < pointCount
					data[i][j] = Plot3D.equation(xValues[i], yValues[j])
					j += 1
				end
				i += 1
			end
			return data
		end
	end
end