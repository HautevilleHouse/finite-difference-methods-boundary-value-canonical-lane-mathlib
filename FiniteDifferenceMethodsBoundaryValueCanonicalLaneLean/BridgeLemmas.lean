import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FiniteDifferenceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse