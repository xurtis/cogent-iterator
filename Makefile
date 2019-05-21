STDGUM=`$(cogent --stdgum-dir)`
CFLAGS+=-I${STDGUM} -I${STDGUM}gum/anti -O2
COGENTFLAGS= \
	--cpp-args="\$$CPPIN -o \$$CPPOUT -P $(CFLAGS)" --cpp=cpp

all: main

main: main_pp_inferred.c
	$(CC) $(CFLAGS) -o $@ $^

main_pp_inferred.c: main.ac Iter.cogent
	cogent \
		${COGENTFLAGS} \
		--infer-c-funcs=main.ac \
		-ogenerated \
		-g Iter.cogent
