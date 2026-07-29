import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure PoissonEquationPackage where
  domainDimension : Nat
  sourceTerm : Type u
  boundaryCondition : Type v
  solutionSpace : Type w
  pdeFormulation : Prop
  weakFormulation : Prop
  discreteScheme : Prop

structure PoissonEquationEvidence (P : PoissonEquationPackage) where
  pdeFormulationClosed : P.pdeFormulation
  weakFormulationClosed : P.weakFormulation
  discreteSchemeClosed : P.discreteScheme

def PoissonEquationClosed (P : PoissonEquationPackage) : Prop :=
  P.pdeFormulation ∧ P.weakFormulation ∧ P.discreteScheme

theorem poisson_equation_closed_from_evidence (P : PoissonEquationPackage)
    (E : PoissonEquationEvidence P) : PoissonEquationClosed P := by
  exact And.intro E.pdeFormulationClosed
    (And.intro E.weakFormulationClosed E.discreteSchemeClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse