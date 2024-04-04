require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Threading.Tasks, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Relations
		# Function to check if a relation is reflexive
		def Relations.IsReflexive(relation, setSize)
			i = 0
			while i < setSize
				if not Relations.RelationContainsPair(relation, i, i) then
					return false
				end
				i += 1
			end
			return true
		end

		# Function to check if a relation is symmetric
		def Relations.IsSymmetric(relation, setSize)
			i = 0
			while i < setSize
				j = 0
				while j < setSize
					if Relations.RelationContainsPair(relation, i, j) != Relations.RelationContainsPair(relation, j, i) then
						return false
					end
					j += 1
				end
				i += 1
			end
			return true
		end

		# Function to check if a relation is transitive
		def Relations.IsTransitive(relation, setSize)
			i = 0
			while i < setSize
				j = 0
				while j < setSize
					if Relations.RelationContainsPair(relation, i, j) then
						k = 0
						while k < setSize
							if Relations.RelationContainsPair(relation, j, k) and not Relations.RelationContainsPair(relation, i, k) then
								return false
							end
							k += 1
						end
					end
					j += 1
				end
				i += 1
			end
			return true
		end

		# Function to check if a relation contains a specific pair
		def Relations.RelationContainsPair(relation, element1, element2)
			return relation[element1][element2] == 1
		end

		# Function to print a relation
		def Relations.PrintRelation(relation, setSize)
			i = 0
			while i < setSize
				j = 0
				while j < setSize
					Console.Write(relation[i][j] + " ")
					j += 1
				end
				Console.WriteLine()
				i += 1
			end
		end

		def Relations.IsAntisymmetric(relation, setSize)
			i = 0
			while i < setSize
				j = 0
				while j < setSize
					if i != j and Relations.RelationContainsPair(relation, i, j) and Relations.RelationContainsPair(relation, j, i) then
						return false
					end
					j += 1
				end
				i += 1
			end
			return true
		end

		# Function to find the composition of two relations
		def Relations.Composition(relation1, relation2, setSize)
			result = Array.CreateInstance(System::Int32, setSize, setSize)
			i = 0
			while i < setSize
				j = 0
				while j < setSize
					k = 0
					while k < setSize
						if Relations.RelationContainsPair(relation1, i, k) and Relations.RelationContainsPair(relation2, k, j) then
							result[i][j] = 1
							break
						end
						k += 1
					end
					j += 1
				end
				i += 1
			end
			return result
		end

		# Function to find the closure of a relation
		def Relations.Closure(relation, setSize)
			closure = relation.Clone()
			k = 0
			while k < setSize
				i = 0
				while i < setSize
					j = 0
					while j < setSize
						if closure[i][k] == 1 and closure[k][j] == 1 then
							closure[i][j] = 1
						end
						j += 1
					end
					i += 1
				end
				k += 1
			end
			return closure
		end
	end
end