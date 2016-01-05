# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug)
  CSC = mcs
  RESGEN = resgen
  TARGETDIR = ../bin
  TARGET = $(TARGETDIR)/slua-standalone-tests.dll
  OBJDIR = obj/Debug/slua-standalone-tests
  FLAGS = /debug /noconfig /d:_DEBUG /d:DEBUG /d:TRACE
  DEPENDS = ../bin/slua-standalone.dll
  REFERENCES = /r:../bin/slua-standalone.dll
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release_windows)
  CSC = mcs
  RESGEN = resgen
  TARGETDIR = ../bin
  TARGET = $(TARGETDIR)/slua-standalone-tests.dll
  OBJDIR = obj/Release_Windows/slua-standalone-tests
  FLAGS = /optimize /noconfig /d:SLUA_STANDALONE_WINDOWS
  DEPENDS = ../bin/slua-standalone.dll
  REFERENCES = /r:../bin/slua-standalone.dll
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release_linux)
  CSC = mcs
  RESGEN = resgen
  TARGETDIR = ../bin
  TARGET = $(TARGETDIR)/slua-standalone-tests.dll
  OBJDIR = obj/Release_Linux/slua-standalone-tests
  FLAGS = /optimize /noconfig /d:SLUA_STANDALONE_LINUX
  DEPENDS = ../bin/slua-standalone.dll
  REFERENCES = /r:../bin/slua-standalone.dll
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

FLAGS += /t:library 
REFERENCES += /r:System /r:../packages/NUnit.3.0.1/lib/net20/nunit.framework.dll

SOURCES += \
	../slua-standalone-tests/Main.cs \
	../slua-standalone-tests/TestSLua.cs \

EMBEDFILES += \

RESPONSE += $(OBJDIR)/slua-standalone-tests.rsp
SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

all: $(TARGETDIR) $(OBJDIR) prebuild $(EMBEDFILES) $(COPYFILES) prelink $(TARGET)

$(TARGET): $(SOURCES) $(EMBEDFILES) $(DEPENDS) $(RESPONSE)
	$(SILENT) $(CSC) /nologo /out:$@ $(FLAGS) $(REFERENCES) @$(RESPONSE) $(patsubst %,/resource:%,$(EMBEDFILES))
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(RESPONSE): slua-standalone-tests.make
	@echo Generating response file
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f $(RESPONSE)
else
	$(SILENT) if exist $(RESPONSE) del $(OBJDIR)/slua-standalone-tests.rsp
endif
	@echo ../slua-standalone-tests/Main.cs >> $(RESPONSE)
	@echo ../slua-standalone-tests/TestSLua.cs >> $(RESPONSE)

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)
