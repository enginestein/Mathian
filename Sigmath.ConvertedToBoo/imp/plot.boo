import System
import ScottPlot


internal class Plotter:

	// Function to plot an equation on a graph and save it as a PNG file
	public static def PlotEquation(equation as Func[of double, double], xMin as double, xMax as double, pointCount as int):
		x as (double) = GenerateXValues(xMin, xMax, pointCount)
		y as (double) = GenerateYValues(equation, x)
		
		// Create a new Plot object
		plt as var = ScottPlot.Plot()
		
		// Plot the equation
		plt.PlotScatter(x, y, 0, 'Equation')
		
		// Add labels and title
		plt.Title('Plot of Equation')
		plt.XLabel('X')
		plt.YLabel('Y')
		
		// Show the legend
		plt.Legend()
		
		// Save the plot as a PNG file
		plt.SaveFig('graph.png')

	
	// Function to generate X values
	private static def GenerateXValues(xMin as double, xMax as double, pointCount as int) as (double):
		x as (double) = array(double, pointCount)
		step as double = ((xMax - xMin) / (pointCount - 1))
		for i in range(0, pointCount):
		
			x[i] = (xMin + (i * step))
		
		return x

	
	// Function to generate Y values based on the equation
	private static def GenerateYValues(equation as Func[of double, double], xValues as (double)) as (double):
		yValues as (double) = array(double, xValues.Length)
		for i in range(0, xValues.Length):
		
			yValues[i] = equation(xValues[i])
		
		return yValues
	
	//static void Main()
	//{
	//PlotEquation(x => 2 * x * x - 3 * x + 1, -5, 5);
	//}

