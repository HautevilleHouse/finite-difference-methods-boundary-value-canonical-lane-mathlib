import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure ConvergenceOrderPackage where
  theoreticalOrder : Nat
  numericalOrder : Nat
  errorBound : Prop
  stabilityEnsured : Prop
  consistencyEnsured : Prop

structure ConvergenceOrderEvidence (C : ConvergenceOrderPackage) where
  errorBoundClosed : C.errorBound
  stabilityEnsuredClosed : C.stabilityEnsured
  consistencyEnsuredClosed : C.consistencyEnsured

def ConvergenceOrderClosed (C : ConvergenceOrderPackage) : Prop := 
  C.errorBound ∧ C.stabilityEnsured ∧ C.consistencyEnsured

theorem convergence_order_closed_from_evidence (C : ConvergenceOrderPackage)
    (E : ConvergenceOrderEvidence C) : ConvergenceOrderClosed C := by
  exact And.intro E.errorBoundClosed (And.intro E.stabilityEnsuredClosed E.consistencyEnsuredClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse