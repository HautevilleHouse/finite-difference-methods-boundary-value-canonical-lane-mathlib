import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure DiscretizationPackage where
  grid : Type u
  stencil : grid → grid → Prop
  truncationError : grid → Prop
  consistency : Prop
  stability : Prop
  convergence : Prop

structure DiscretizationEvidence (D : DiscretizationPackage) where
  truncationErrorClosed : D.truncationError D.grid
  consistencyClosed : D.consistency
  stabilityClosed : D.stability
  convergenceClosed : D.convergence

def DiscretizationClosed (D : DiscretizationPackage) : Prop :=
  D.consistency ∧ D.stability ∧ D.convergence

theorem discretization_closed_from_evidence (D : DiscretizationPackage) (E : DiscretizationEvidence D) :
    DiscretizationClosed D := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed E.convergenceClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse