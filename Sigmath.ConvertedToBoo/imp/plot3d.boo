
namespace Sigmath

import System
import System.Collections.Generic
import System.Linq
import System.Text
import System.Threading.Tasks
import OxyPlot
import OxyPlot.Axes
import OxyPlot.Series
import OxyPlot.WindowsForms

internal class Plot3D:

	public static def Plot(equation as Func[of double, double, double], xMin as double, xMax as double, yMin as double, yMax as double, pointCount as int):
		plotModel as var = OxyPlot.PlotModel()
		plotModel.Axes.Add(OxyPlot.Axes.LinearAxis())
		plotModel.Axes.Add(OxyPlot.Axes.LinearAxis())
		plotModel.Axes.Add(OxyPlot.Axes.LinearColorAxis())
		
		xValues as var = GenerateValues(xMin, xMax, pointCount)
		yValues as var = GenerateValues(yMin, yMax, pointCount)
		
		series as var = OxyPlot.Series.HeatMapSeries()
		
		plotModel.Series.Add(series)
		
		plotView as var = OxyPlot.WindowsForms.PlotView()
		
		form as var = System.Windows.Forms.Form()
		form.Controls.Add(plotView)
		
		// Show the plot
		form.ShowDialog()

	
	private static def GenerateValues(min as double, max as double, pointCount as int) as (double):
		values as (double) = array(double, pointCount)
		step as double = ((max - min) / (pointCount - 1))
		for i in range(0, pointCount):
		
			values[i] = (min + (i * step))
		
		return values

	
	private static def GenerateHeatMapData(equation as Func[of double, double, double], xValues as (double), yValues as (double), pointCount as int) as (double, 2):
		data as (double, 2) = matrix(double, pointCount, pointCount)
		for i in range(0, pointCount):
		
			for j in range(0, pointCount):
				data[i, j] = equation(xValues[i], yValues[j])
		
		return data
	
	// Example usage
	//static void Main()
	//{
	// Example: Plotting the 3D equation z = (sin(4*x) - cos(5*y))/5
	//Plot((x, y) => (Math.Sin(4 * x) - Math.Cos(5 * y)) / 5, -5, 5, -5, 5);
	//}

