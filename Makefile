# Generated by Assemblage v39045a.

# Run `make help' to get the list of targets.

.PHONY: all clean lib bin test doc distclean js help bin-ocaml-dumpast

# 
# Main project configuration
# 

BUILDIR     ?= _build
CAMLP4O     ?= camlp4o
JS_OF_OCAML ?= js_of_ocaml
LIBDIR      ?= $(LIBDIR)
LN          ?= ln -sf
MKDIR       ?= mkdir -p
OCAMLMKLIB  ?= ocamlmklib
ROOTDIR     = $(shell pwd)
ifeq ($(HAS_NATIVE:1=),)
OCAMLC      ?= ocamlc.opt
OCAMLDEP    ?= ocamldep.opt
OCAMLDOC    ?= ocamldoc.opt
OCAMLOPT    ?= ocamlopt.opt
else
OCAMLC      ?= ocamlc
OCAMLDEP    ?= ocamldep
OCAMLDOC    ?= ocamldoc
OCAMLOPT    ?= ocamlopt
endif

HAS_ANNOT          ?= 1
HAS_BYTE           ?= 1
HAS_DEBUG          ?= 1
HAS_DOC            ?= 0
HAS_JS             ?= 0
HAS_NATIVE         ?= 1
HAS_NATIVE_DYNLINK ?= 1
HAS_TEST           ?= 0
HAS_WARN_ERROR     ?= 0

# 
# Global variables
# 

all            := lib bin
compile-byte   := 
compile-native := 
link-byte      := 
link-native    := 
ifeq ($(HAS_WARN_ERROR:1=),)
compile-byte   += -warn-error A-44-4-48 -w A-44-4-48
endif
ifeq ($(HAS_DEBUG:1=),)
compile-byte   += -g
compile-native += -g
link-byte      += -g
link-native    += -g
endif
ifeq ($(HAS_ANNOT:1=),)
compile-byte   += -bin-annot
endif

# 
# Component configuration.
# 
# Each component has variables associated to the different phases of the build.
# <NAME>.<PHASE> controls the compilation options for the component <NAME>,
# during the phase <PHASE>.
# 

lib := 

bin := bin-ocaml-dumpast

js := 

# Binary: ocaml-dumpast
bin-ocaml-dumpast := 
ifeq ($(HAS_BYTE:1=),)
bin-ocaml-dumpast += $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.byte
endif
ifeq ($(HAS_NATIVE:1=),)
bin-ocaml-dumpast += $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.native
endif
bin-ocaml-dumpast.compile-byte ?= $(compile-byte)
bin-ocaml-dumpast.compile-native ?= $(compile-native)
bin-ocaml-dumpast.dep ?=  \
    $(dep) \
    -I $(BUILDIR)/bin-ocaml-dumpast
bin-ocaml-dumpast.link-byte ?=  \
    $(link-byte) \
    $(shell ocamlfind query -predicates byte -format "%d/%a" unix) \
    $(shell ocamlfind query -predicates byte -format "%d/%a" compiler-libs) \
    $(shell ocamlfind query -predicates byte -format "%d/%a" compiler-libs.common) \
    $(shell ocamlfind query -predicates byte -format "%d/%a" compiler-libs.bytecomp) \
    $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmo
bin-ocaml-dumpast.link-js ?= $(link-js)
bin-ocaml-dumpast.link-native ?=  \
    $(link-native) \
    $(shell ocamlfind query -predicates native -format "%d/%a" unix) \
    $(shell ocamlfind query -predicates native -format "%d/%a" compiler-libs) \
    $(shell ocamlfind query -predicates native -format "%d/%a" compiler-libs.common) \
    $(shell ocamlfind query -predicates native -format "%d/%a" compiler-libs.bytecomp) \
    $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmx
bin-ocaml-dumpast.pp-byte ?= $(pp-byte)
bin-ocaml-dumpast.pp-native ?= $(pp-native)

test := 

doc := 

# Compilation unit: src/dumpast
bin-ocaml-dumpast-dumpast.compile-byte ?=  \
    $(bin-ocaml-dumpast.compile-byte) \
    $(shell ocamlfind query -predicates byte -format "-I %d" unix) \
    $(shell ocamlfind query -predicates byte -format "-I %d" compiler-libs)
bin-ocaml-dumpast-dumpast.compile-native ?=  \
    $(bin-ocaml-dumpast.compile-native) \
    $(shell ocamlfind query -predicates native -format "-I %d" unix) \
    $(shell ocamlfind query -predicates native -format "-I %d" compiler-libs)
bin-ocaml-dumpast-dumpast.dep ?=  \
    $(bin-ocaml-dumpast.dep) \
    $(shell ocamlfind query -predicates byte -format "-I %d" unix) \
    $(shell ocamlfind query -predicates byte -format "-I %d" compiler-libs)
bin-ocaml-dumpast-dumpast.pp-byte ?=  \
    $(bin-ocaml-dumpast.pp-byte) \
    $(shell ocamlfind query -predicates syntax,preprocessor -format "%d/%a" camlp4) \
    $(shell ocamlfind query -predicates syntax,preprocessor -format "%d/%a" optcomp)
bin-ocaml-dumpast-dumpast.pp-native ?=  \
    $(bin-ocaml-dumpast.pp-native) \
    $(shell ocamlfind query -predicates syntax,preprocessor -format "%d/%a" camlp4) \
    $(shell ocamlfind query -predicates syntax,preprocessor -format "%d/%a" optcomp)


all:: 
	@echo '[04mall[m [33m=>[m ${all}'
	@$(MAKE) $(all)
	@if [ "x${HAS_JS}" = "x1" ]; then $(MAKE) js; fi
	@if [ "x${HAS_TEST}" = "x1" ]; then $(MAKE) test; fi
	@if [ "x${HAS_DOC}" = "x1" ]; then $(MAKE) doc; fi
	@if [ "x${HAS_FULL_DOC}" = "x1" ]; then $(MAKE) full-doc; fi
	@echo '[32m== Done![m'

clean:: 
	rm -f *~ **/*~
	rm -rf $(BUILDIR)

distclean:: clean
	rm -f Makefile dumpast.install META

install:: all
	@opam-installer --prefix $(shell opam config var prefix) dumpast.install

help: 
	@echo 'Use [04mVERBOSE=1[m to show the full commands.'
	@echo 'The following targets are available (use "make [04m<target>[m"):'
	@echo
	@echo ' - [04mall[m -- build all the active targets.'
	@echo ' - [04mbin-ocaml-dumpast[m -- build the executable ocaml-dumpast.'
	@echo ' - [04mdoc[m -- build the documentation.'
	@echo ' - [04mtest[m -- build and run the test.'
	@echo ' - [04mjs[m -- build the js_of_ocaml targets.'
	@echo ' - [04mclean[m -- clean the build artefacts.'
	@echo ' - [04mdistclean[m -- clean the project to prepare the release.'
	@echo
	@echo
	@echo 'Current configuration (use "make [04mVAR=val[m" to modify):'
	@echo
	@echo ' - [04mHAS_ANNOT=$(HAS_ANNOT)[m -- build binary annotations files'
	@echo ' - [04mHAS_BYTE=$(HAS_BYTE)[m -- byte code compilation available'
	@echo ' - [04mHAS_DEBUG=$(HAS_DEBUG)[m -- build with debug support'
	@echo ' - [04mHAS_DOC=$(HAS_DOC)[m -- build public documentation'
	@echo ' - [04mHAS_JS=$(HAS_JS)[m -- JavaScript code compilation with js_of_ocaml available'
	@echo ' - [04mHAS_NATIVE=$(HAS_NATIVE)[m -- native code compilation available'
	@echo ' - [04mHAS_NATIVE_DYNLINK=$(HAS_NATIVE_DYNLINK)[m -- native code dynamic linking available'
	@echo ' - [04mHAS_TEST=$(HAS_TEST)[m -- build tests'
	@echo ' - [04mHAS_WARN_ERROR=$(HAS_WARN_ERROR)[m -- build with warnings as errors'
	@echo

lib: $(lib)
	@

bin: $(bin)
	@

js: $(js)
	@

bin-ocaml-dumpast: $(bin-ocaml-dumpast)
	@

$(BUILDIR)/bin-ocaml-dumpast/: 
	@if test -n "$$VERBOSE"; then echo '$(MKDIR) $(BUILDIR)/bin-ocaml-dumpast'; else echo '[33mbin-ocaml-dumpast[m                     [01mprepare[m                bin-ocaml-dumpast'; fi
	@$(MKDIR) $(BUILDIR)/bin-ocaml-dumpast

$(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.byte: $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmo | $(BUILDIR)/bin-ocaml-dumpast/
	@if test -n "$$VERBOSE"; then echo '$(OCAMLC) $(bin-ocaml-dumpast.link-byte) -o $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.byte'; else echo '[33mbin-ocaml-dumpast[m                     [01mlink-byte[m              ocaml-dumpast.byte'; fi
	@$(OCAMLC) $(bin-ocaml-dumpast.link-byte) -o $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.byte

$(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.native: $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmx | $(BUILDIR)/bin-ocaml-dumpast/
	@if test -n "$$VERBOSE"; then echo '$(OCAMLOPT) $(bin-ocaml-dumpast.link-native) -o $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.native'; else echo '[33mbin-ocaml-dumpast[m                     [01mlink-native[m            ocaml-dumpast.native'; fi
	@$(OCAMLOPT) $(bin-ocaml-dumpast.link-native) -o $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.native

$(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.js: $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.byte
	@if test -n "$$VERBOSE"; then echo '$(JS_OF_OCAML) $(bin-ocaml-dumpast.link-js) $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.js'; else echo '[33mbin-ocaml-dumpast[m                     [01mlink-js[m                ocaml-dumpast.js'; fi
	@$(JS_OF_OCAML) $(bin-ocaml-dumpast.link-js) $(BUILDIR)/bin-ocaml-dumpast/ocaml-dumpast.js

test: $(test)
	@

doc: $(doc)
	@

$(BUILDIR)/bin-ocaml-dumpast/dumpast.ml: src/dumpast.ml | $(BUILDIR)/bin-ocaml-dumpast/
	@if test -n "$$VERBOSE"; then echo '$(LN) $(ROOTDIR)/src/dumpast.ml $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mprepare[m                dumpast.ml'; fi
	@$(LN) $(ROOTDIR)/src/dumpast.ml $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml

$(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte: $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml
	@if test -n "$$VERBOSE"; then echo '$(CAMLP4O) $(bin-ocaml-dumpast-dumpast.pp-byte) $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml > $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mpp-byte[m                dumpast.cml-byte'; fi
	@$(CAMLP4O) $(bin-ocaml-dumpast-dumpast.pp-byte) $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml > $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte

$(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native: $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml
	@if test -n "$$VERBOSE"; then echo '$(CAMLP4O) $(bin-ocaml-dumpast-dumpast.pp-native) $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml > $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mpp-native[m              dumpast.cml-native'; fi
	@$(CAMLP4O) $(bin-ocaml-dumpast-dumpast.pp-native) $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml > $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native

$(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d: $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte | $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml
	@if test -n "$$VERBOSE"; then echo '$(OCAMLDEP) $(bin-ocaml-dumpast-dumpast.dep) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte > $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mdep[m                    dumpast.ml.d'; fi
	@$(OCAMLDEP) $(bin-ocaml-dumpast-dumpast.dep) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte > $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d

$(BUILDIR)/bin-ocaml-dumpast/dumpast.cmi $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmo: $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte
	@if test -n "$$VERBOSE"; then echo '$(OCAMLC) -c $(bin-ocaml-dumpast-dumpast.compile-byte) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mcompile-byte[m           dumpast.cmi dumpast.cmo'; fi
	@$(OCAMLC) -c $(bin-ocaml-dumpast-dumpast.compile-byte) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-byte

$(BUILDIR)/bin-ocaml-dumpast/dumpast.cmx: $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d $(BUILDIR)/bin-ocaml-dumpast/dumpast.cmi $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native
	@if test -n "$$VERBOSE"; then echo '$(OCAMLOPT) -c $(bin-ocaml-dumpast-dumpast.compile-native) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native'; else echo '[33mbin-ocaml-dumpast-dumpast[m             [01mcompile-native[m         dumpast.cmx'; fi
	@$(OCAMLOPT) -c $(bin-ocaml-dumpast-dumpast.compile-native) -impl $(BUILDIR)/bin-ocaml-dumpast/dumpast.cml-native

-include Makefile.assemble
ifneq ($(filter-out clean help distclean,$(MAKECMDGOALS)),)
-include $(BUILDIR)/bin-ocaml-dumpast/dumpast.ml.d
endif