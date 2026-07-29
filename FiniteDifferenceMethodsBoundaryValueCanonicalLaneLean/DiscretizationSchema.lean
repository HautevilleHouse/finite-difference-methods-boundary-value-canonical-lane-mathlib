import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure FiniteDifferenceSchema where
  spatialStep : Float
  timeStep : Float
  stencilSize : Nat
  consistencyOrder : Nat
  stabilityCriterion : Prop

structure FiniteDifferenceSchemaEvidence (S : FiniteDifferenceSchema) where
  stepSignificance : S.spatialStep > 0 ∧ S.timeStep > 0
  stencilConsistency : S.consistencyOrder ≥ 1
  stabilityVerified : S.stabilityCriterion

def FiniteDifferenceSchemaClosed (S : FiniteDifferenceSchema) : Prop :=
  (S.spatialStep > 0 ∧ S.timeStep > 0) ∧
  S.consistencyOrder ≥ 1 ∧
  S.stabilityCriterion

theorem finite_difference_schema_closed_from_evidence
    (S : FiniteDifferenceSchema) (E : FiniteDifferenceSchemaEvidence S) :
    FiniteDifferenceSchemaClosed S := by
  exact And.intro E.stepSignificance
    (And.intro E.stencilConsistency E.stabilityVerified)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse