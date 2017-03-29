/*******************************************************************************
 * Copyright (c) 2016 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtend.core.tests.validation

import javax.inject.Inject
import org.eclipse.xtend.core.tests.AbstractXtendTestCase
import org.eclipse.xtend.core.xtend.XtendFile
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.Test

/**
 * @author Stephane Galland - Initial contribution and API
 */
class ValidationIssue191Test extends AbstractXtendTestCase {

	@Inject extension ValidationTestHelper
	@Inject extension ParseHelper<XtendFile>

	@Test	
	def void testIssue191() {
		val file = '''
			import java.util.Set
			import java.util.AbstractCollection
			class XXX<T> extends AbstractCollection<T> implements Set<T> {
			  def Iterator<T> iterator() {
			    null
			  }
			  def int size() {
			    0
			  }
			}
		'''.parse
		file.assertNoErrors()
	}

}
