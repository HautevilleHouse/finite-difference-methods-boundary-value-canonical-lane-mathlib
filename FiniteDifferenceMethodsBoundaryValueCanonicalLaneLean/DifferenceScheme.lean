import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure DifferenceSchemePackage where
  schemeOrder : Nat
  consistencyCondition : Prop
  stabilityCondition : Prop
  convergenceCondition : Prop
  laxEquivalence : Prop

structure DifferenceSchemeEvidence (D : DifferenceSchemePackage) where
  consistencyConditionClosed : D.consistencyCondition
  stabilityConditionClosed : D.stabilityCondition
  convergenceConditionClosed : D.convergenceCondition
  laxEquivalenceClosed : D.laxEquivalence

def DifferenceSchemeClosed (D : DifferenceSchemePackage) : Prop :=
  D.consistencyCondition ∧ D.stabilityCondition ∧ D.convergenceCondition ∧ D.laxEquivalence

theorem difference_scheme_closed_from_evidence (D : DifferenceSchemePackage) (E : DifferenceSchemeEvidence D) :
    DifferenceSchemeClosed D := by
  exact And.intro E.consistencyConditionClosed
    (And.intro E.stabilityConditionClosed
      (And.intro E.convergenceConditionClosed E.laxEquivalenceClosed))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
