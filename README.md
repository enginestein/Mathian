![logo (1)](https://github.com/enginestein/Sigmath/assets/117010357/3bd5da65-738e-4627-bed8-185c0f4962d2)

# Sigmath

Introducing Sigmath: An Advanced Mathematical Framework!

Sigmath is a robust framework developed in C#, specifically designed for mathematicians. Packed with a wide range of cutting-edge mathematical functions, constants, and classes, Sigmath offers unparalleled versatility.

Whether you're working with Python, C#, C++, or C, Sigmath seamlessly integrates into your preferred programming language. One of the standout features of Sigmath is its remarkable ability to directly solve a vast array of mathematical equations, spanning from trigonometry to algebra and statistics. This unique capability sets Sigmath apart from other frameworks in the field.

With Sigmath at your disposal, mathematicians can harness the power of this comprehensive framework to simplify complex mathematical tasks, making it an indispensable tool for professionals in the field.

# Quickstart

You can visit Sigmath on [NuGet](https://www.nuget.org/packages/Sigmath)

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

# Examples

- Use in Python

``` py

# If install from pip or wheel
from Sigmath import Basic
print(Basic.add(2, 2))

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

**Documentation**: https://enginestein.github.io/Sigmath/

This project is licensed under GPL v3.0. All Copyrights Reserved @ 2023.
