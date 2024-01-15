Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks
Imports OxyPlot
Imports OxyPlot.Axes
Imports OxyPlot.Series
Imports OxyPlot.WindowsForms

Class Plot3D
	Public Shared Sub Plot(equation As Func(Of Double, Double, Double), xMin As Double, xMax As Double, yMin As Double, yMax As Double, Optional pointCount As Integer = 100)
		Dim plotModel = New OxyPlot.PlotModel()
		plotModel.Axes.Add(New OxyPlot.Axes.LinearAxis() With { _
			Key .Position = OxyPlot.Axes.AxisPosition.Bottom _
		})
		plotModel.Axes.Add(New OxyPlot.Axes.LinearAxis() With { _
			Key .Position = OxyPlot.Axes.AxisPosition.Left _
		})
		plotModel.Axes.Add(New OxyPlot.Axes.LinearColorAxis() With { _
			Key .Position = OxyPlot.Axes.AxisPosition.Right _
		})

		Dim xValues = GenerateValues(xMin, xMax, pointCount)
		Dim yValues = GenerateValues(yMin, yMax, pointCount)

		Dim series = New OxyPlot.Series.HeatMapSeries() With { _
			Key .X0 = xMin, _
			Key .X1 = xMax, _
			Key .Y0 = yMin, _
			Key .Y1 = yMax, _
			Key .Data = GenerateHeatMapData(equation, xValues, yValues, pointCount) _
		}

		plotModel.Series.Add(series)

		Dim plotView = New OxyPlot.WindowsForms.PlotView() With { _
			Key .Model = plotModel, _
			Key .Width = 800, _
			Key .Height = 600 _
		}

		Dim form = New System.Windows.Forms.Form()
		form.Controls.Add(plotView)

		' Show the plot
		form.ShowDialog()
	End Sub

	Private Shared Function GenerateValues(min As Double, max As Double, pointCount As Integer) As Double()
		Dim values As Double() = New Double(pointCount - 1) {}
		Dim [step] As Double = (max - min) / (pointCount - 1)

		For i As Integer = 0 To pointCount - 1
			values(i) = min + i * [step]
		Next

		Return values
	End Function

	Private Shared Function GenerateHeatMapData(equation As Func(Of Double, Double, Double), xValues As Double(), yValues As Double(), pointCount As Integer) As Double(,)
		Dim data As Double(,) = New Double(pointCount - 1, pointCount - 1) {}

		For i As Integer = 0 To pointCount - 1
			For j As Integer = 0 To pointCount - 1
				data(i, j) = equation(xValues(i), yValues(j))
			Next
		Next

		Return data
	End Function

	' Example usage
	'static void Main()
	'{
	' Example: Plotting the 3D equation z = (sin(4*x) - cos(5*y))/5
	'Plot((x, y) => (Math.Sin(4 * x) - Math.Cos(5 * y)) / 5, -5, 5, -5, 5);
	'}
End Class
