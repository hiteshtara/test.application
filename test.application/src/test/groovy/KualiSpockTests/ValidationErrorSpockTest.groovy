

import spock.lang.*
import edu.bu.kuali.kra.award.sapintegration.ValidationError

class ValidationErrorSpockTest extends spock.lang.Specification{
	
	def "test constructor throws IllegalArgumentException"(){
    when:
    new ValidationError(errorKey, null)
    then:
    thrown(IllegalArgumentException)
    where:
    errorKey << ["", "     ", null]
  }
	@Unroll
	def "test constructionOK. errorKey=#errorKey errorParams=#errorParams"(){
	  when:
	  def result = new ValidationError(errorKey, errorParams)
	  then:
	  result.errorKey == errorKey
	  result.errorParams != null
	  result.errorParams.size() == errorParams.size()
	  where:
	  errorKey | errorParams
	  "key"    | ["1", "2"]
	  "key"    | []
	}
	def "test possible NPE"(){
		given:
		def errorParams = null
		def errorKey = "key"
		when:
		def result = new ValidationError(errorKey, errorParams)
		then:
		thrown(NullPointerException.class)
	  }
	def "test validationError errors params should be unmodifiable"(){
		given:
		def errorParams = ["1", "2"]
		def errorKey = "key"
		when:
		def result = new ValidationError(errorKey, errorParams)
		def resultErrorParams = result.getErrorParams()
		resultErrorParams.add("cannot add this string")
		then:
		thrown(UnsupportedOperationException.class)
	  }
	
	
  

}
