@Grapes([
	  @Grab(group='org.semanticweb.elk', module='elk-owlapi', version='0.4.3'),
	  @Grab(group='net.sourceforge.owlapi', module='owlapi-api', version='4.2.5'),
	  @Grab(group='net.sourceforge.owlapi', module='owlapi-apibinding', version='4.2.5'),
	  @Grab(group='net.sourceforge.owlapi', module='owlapi-impl', version='4.2.5'),
	  @Grab(group='net.sourceforge.owlapi', module='owlapi-parsers', version='4.2.5'),
	])

import org.semanticweb.owlapi.model.parameters.*
import org.semanticweb.elk.owlapi.ElkReasonerFactory;
import org.semanticweb.elk.owlapi.ElkReasonerConfiguration
import org.semanticweb.elk.reasoner.config.*
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.reasoner.*
import org.semanticweb.owlapi.reasoner.structural.StructuralReasoner
import org.semanticweb.owlapi.vocab.OWLRDFVocabulary;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.io.*;
import org.semanticweb.owlapi.owllink.*;
import org.semanticweb.owlapi.util.*;
import org.semanticweb.owlapi.search.*;
import org.semanticweb.owlapi.manchestersyntax.renderer.*;
import org.semanticweb.owlapi.reasoner.structural.*
import org.semanticweb.owlapi.model.parameters.*

OWLOntologyManager manager = OWLManager.createOWLOntologyManager()
OWLOntologyManager manager2 = OWLManager.createOWLOntologyManager()
OWLDataFactory fac = manager.getOWLDataFactory()
OWLOntology chebi = manager.loadOntologyFromOntologyDocument(new File("imports/chebi.owl"))
OWLOntology go = manager.loadOntologyFromOntologyDocument(new File("imports/go.owl"))
OWLOntology ont = manager.loadOntologyFromOntologyDocument(new File("nbo-edit.owl"))
OWLOntology ront = manager2.createOntology(IRI.create("http://purl.obolibrary.org/obo/nbo.owl"))
ConsoleProgressMonitor progressMonitor = new ConsoleProgressMonitor()
OWLReasonerConfiguration config = new SimpleConfiguration(progressMonitor)
ElkReasonerFactory f1 = new ElkReasonerFactory()
OWLReasoner reasoner = f1.createReasoner(ont,config)

new InferredClassAssertionAxiomGenerator().createAxioms(fac, reasoner).each { ax ->
  manager2.addAxiom(ront, ax)
  cc += 1
}
ont.getAxioms(Imports.EXCLUDED).each { ax ->
  manager2.addAxiom(ront, ax)
}

manager2.saveOntology(ront, IRI.create(new File("nbo-release.owl").toURI()))
