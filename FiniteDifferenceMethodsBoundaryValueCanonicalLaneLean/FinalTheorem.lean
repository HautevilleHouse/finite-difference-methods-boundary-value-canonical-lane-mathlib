import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

def ConstrainedFDMClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fdm_endgame (A : AdmissibleClass) :
    ConstrainedFDMClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse