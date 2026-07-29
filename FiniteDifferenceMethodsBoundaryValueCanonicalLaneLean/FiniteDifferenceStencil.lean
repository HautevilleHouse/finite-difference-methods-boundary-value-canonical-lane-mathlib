import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure FiniteDifferenceStencilPackage where
  stencilPoints : Nat
  accuracyOrder : Nat
  coefficients : List Float
  consistency : Prop
  stability : Prop
  convergence : Prop

structure FiniteDifferenceStencilEvidence (S : FiniteDifferenceStencilPackage) where
  consistencyClosed : S.consistency
  stabilityClosed : S.stability
  convergenceClosed : S.convergence

def FiniteDifferenceStencilClosed (S : FiniteDifferenceStencilPackage) : Prop :=
  S.consistency ∧ S.stability ∧ S.convergence

theorem finite_difference_stencil_closed_from_evidence
    (S : FiniteDifferenceStencilPackage) (E : FiniteDifferenceStencilEvidence S) :
    FiniteDifferenceStencilClosed S := by
  exact And.intro E.consistencyClosed
    (And.intro E.stabilityClosed E.convergenceClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse