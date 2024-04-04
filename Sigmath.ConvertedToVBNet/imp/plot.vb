Imports ScottPlot

Class Plotter
	' Function to plot an equation on a graph and save it as a PNG file
	Public Shared Sub PlotEquation(equation As Func(Of Double, Double), xMin As Double, xMax As Double, Optional pointCount As Integer = 1000)
		Dim x As Double() = GenerateXValues(xMin, xMax, pointCount)
		Dim y As Double() = GenerateYValues(equation, x)

		' Create a new Plot object
		Dim plt = New ScottPlot.Plot()

		' Plot the equation
		plt.PlotScatter(x, y, markerSize := 0, label := "Equation")

		' Add labels and title
		plt.Title("Plot of Equation")
		plt.XLabel("X")
		plt.YLabel("Y")

		' Show the legend
		plt.Legend()

		' Save the plot as a PNG file
		plt.SaveFig("graph.png")
	End Sub

	' Function to generate X values
	Private Shared Function GenerateXValues(xMin As Double, xMax As Double, pointCount As Integer) As Double()
		Dim x As Double() = New Double(pointCount - 1) {}
		Dim [step] As Double = (xMax - xMin) / (pointCount - 1)

		For i As Integer = 0 To pointCount - 1
			x(i) = xMin + i * [step]
		Next

		Return x
	End Function

	' Function to generate Y values based on the equation
	Private Shared Function GenerateYValues(equation As Func(Of Double, Double), xValues As Double()) As Double()
		Dim yValues As Double() = New Double(xValues.Length - 1) {}

		For i As Integer = 0 To xValues.Length - 1
			yValues(i) = equation(xValues(i))
		Next

		Return yValues
	End Function

	'static void Main()
	'{
	'PlotEquation(x => 2 * x * x - 3 * x + 1, -5, 5);
	'}
End Class
