import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure StabilityCondition where
  cflNumber : Float
  spectralRadius : Float
  dissipativity : Prop
  vonNeumannStability : Prop
  positivityConstraint : Float ≥ 0.0

structure StabilityEvidence (S : StabilityCondition) where
  cflBounded : S.cflNumber ≤ 1.0
  spectralRadiusBounded : S.spectralRadius ≤ 1.0
  dissipativeVerified : S.dissipativity
  vonNeumannPassed : S.vonNeumannStability
  positivityHolds : S.positivityConstraint

def StabilityClosed (S : StabilityCondition) : Prop :=
  S.cflNumber ≤ 1.0 ∧ S.spectralRadius ≤ 1.0 ∧
  S.dissipativity ∧ S.vonNeumannStability ∧ S.positivityConstraint

theorem stability_closed_from_evidence
    (S : StabilityCondition) (E : StabilityEvidence S) : StabilityClosed S := by
  exact And.intro E.cflBounded
    (And.intro E.spectralRadiusBounded
      (And.intro E.dissipativeVerified
        (And.intro E.vonNeumannPassed E.positivityHolds)))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse