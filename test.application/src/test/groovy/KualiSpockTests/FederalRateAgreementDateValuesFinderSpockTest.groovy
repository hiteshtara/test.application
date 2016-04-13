import spock.lang.Specification
import spock.lang.Unroll
import edu.bu.kuali.kra.award.options.FederalRateAgreementDateValuesFinder
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.kra.award.document.AwardDocument
import  edu.bu.kuali.kra.infrastructure.BUConstants
class FederalRateAgreementDateValuesFinderSpockTest extends Specification {
  ParameterService parameterService = Mock()
  FederalRateAgreementDateValuesFinder finder

  def "setup"(){
	finder = Spy()
	finder.getParameterService() >> parameterService
  }
  @Unroll
  def "test getKeyValues with parameter=#paramValues"(){
	given:
	def expectedSize = 1
	parameterService.getParameterValuesAsString(AwardDocument.class, BUConstants.FEDERAL_RATE_DATE_OVERHEAD_KEY_FIELD_MAPPINGS) >>paramValues
	when:
	def result = finder.getKeyValues()
	then:
	result != null
	result.size() == expectedSize
	result.get(0).key == "NA"
	result.get(0).value == "N/A"
	where:
	paramValues << [ []]
  }

  def "test getKeyValues with one parameter"(){
	given:
	def paramValues = ["a=a"]
	def expectedSize = 2
	parameterService.getParameterValuesAsString(AwardDocument.class, BUConstants.FEDERAL_RATE_DATE_OVERHEAD_KEY_FIELD_MAPPINGS) >>paramValues
	when:
	def result = finder.getKeyValues()
	then:
	result != null
	result.size() == expectedSize
	result.get(0).key == "NA"
	result.get(0).value == "N/A"
	result.get(1).key == "a"
	result.get(1).value == "a"
  }

  def "test getKeyValues with multiple parameters"(){
	given:
	def paramValues = ["a=a","b=b"]
	def expectedSize = 3
	parameterService.getParameterValuesAsString(AwardDocument.class, BUConstants.FEDERAL_RATE_DATE_OVERHEAD_KEY_FIELD_MAPPINGS) >>paramValues
	when:
	def result = finder.getKeyValues()
	then:
	result != null
	result.size() == expectedSize
	result.get(0).key == "NA"
	result.get(0).value == "N/A"
	result.get(1).key == "a"
	result.get(1).value == "a"
	result.get(2).key == "b"
	result.get(2).value == "b"
  }
}

