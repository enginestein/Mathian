# Sigmath

A framework for mathematicians!

Sigmath is a framework written in C#. Sigmath contains many advanced mathematical functions, constants, classes. Sigmath can be used in Python, C#, C++, C.

# Quickstart

``` sh
# Python
pip install Sigmath

# C/C#/C++
nuget install Sigmath

```

.DLL version of Sigmath is most stable, you can add reference in your Visual Studio project. Get Sigmath.dll from releases tab.

# Build from source

- Clone the repository
- Go to Sigmath/Sigmath folder
- Open Sigmath.sln in visual studio
- Build the solution

**Documentation**: https://enginestein.github.io/Sigmath/

# Examples

- Use in Python

``` py

# If install from pip or wheel
from Sigmath import Basic
print(Basic.add(2, 2)

# If using Sigmath.dll directly in python
import clr # pip install pythonnet
clr.AddReference('path/to/Sigmath.dll')
from Sigmath import Basic
print(Basic.Add(2, 2))

# Note that function names in .DLL and .WHL are different. Read documentation for that.

```

- Use in C#

``` c#

using Sigmath;
namespace Something {
    public static void Main(string args[]) {
        Console.WriteLine(Sigmath.Basic.Add(2, 2))
    }
}

```

You can use Sigmath in C and C++ from NuGet package or DLL.
