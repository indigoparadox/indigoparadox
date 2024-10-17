
# vim: ft=make noexpandtab

ifeq ($(BUILD),prod)
	IWZ_PROD=1	
else
	IWZ_PROD=0
endif

IWZ_HTML_PAGES=$(subst src/,,$(subst .m4,.html,$(wildcard src/**/*.m4) \
	$(wildcard src/*.m4))) \
	$(subst src/,,$(subst .c,.html,$(wildcard src/**/*.c))) \
	$(subst src/,,$(subst .asm,.html,$(wildcard src/**/*.asm)))

IWZ_CSS=$(subst .m4,.css,$(wildcard styles/*))

IWZ_JS=$(subst .m4,.js,$(wildcard scripts/*))

IWZ_IMG=$(wildcard images/*.*) $(wildcard images/**/*.*)

# Literate source files from which some of the m4 templates processed above
# are generated.

IWZ_LIT_SRC=$(subst src/,,$(wildcard src/**/*.c)) \
	$(subst src/,,$(wildcard src/**/*.asm))

modern: $(addprefix modern/,$(IWZ_HTML_PAGES)) \
	$(addprefix modern/,$(IWZ_CSS)) \
	$(addprefix modern/,$(IWZ_JS)) \
	$(addprefix modern/,$(IWZ_IMG)) \
	$(addprefix modern/,$(IWZ_LIT_SRC)) \
	modern/CNAME modern/robots.txt modern/sitemap.txt

.PHONY: modern clean

# Normal Pages

modern/%.html: src/%.m4
	mkdir -p $(dir $@)
	m4 -I ./templates \
		-D IWZ_PROD=$(IWZ_PROD) \
		-D IWZ_LASTMOD="$(shell git log $< | grep "^Date" | head -1)" \
		"$<" > $@

# Literate Programming

modern/%.html: temp/%.m4
	# For last mod date, this is a generated file so use any similar source
	# file in the log to figure it out.
	m4 -I ./templates \
		-D IWZ_PROD=$(IWZ_PROD) \
		-D IWZ_LASTMOD="$(shell git log $(subst temp/,src/,$(subst .m4,.*,$<)) | grep "^Date" | head -1)" \
		"$<" > $@

temp/%.m4: src/%.c
	mkdir -p $(dir $@)
	./generate.sh proc_c "$<" "$@"

temp/%.m4: src/%.asm
	mkdir -p $(dir $@)
	./generate.sh proc_asm "$<" "$@"

modern/%.c: src/%.c
	mkdir -p $(dir $@)
	cp -v "$<" "$@"

modern/%.asm: src/%.asm
	mkdir -p $(dir $@)
	cp -v "$<" "$@"

# Styles

modern/styles/%.css: styles/%.m4
	mkdir -p $(dir $@)
	m4 -I ./templates -D IWZ_PROD=$(IWZ_PROD) "$<" > "$@"

modern/styles/%.png: styles/%.png
	mkdir -p $(dir $@)
	cp -v "$<" "$@"

# Scripts

modern/scripts/%.js: scripts/%.m4
	mkdir -p $(dir $@)
	m4 -I ./templates -D IWZ_PROD=$(IWZ_PROD) "$<" > "$@"

modern/scripts/%.js: scripts/%.js
	mkdir -p $(dir $@)
	cp -v "$<" "$@"

# Images

modern/images/%: images/%
	mkdir -p $(dir $@)
	cp -v "$<" "$@"

# Special Files

modern/sitemap.txt: $(addprefix modern/,$(IWZ_HTML_PAGES))
	# Build a sitemap from the wildcard lists used to build the site.
	echo $^ | tr ' ' '\n' | grep -v "404.html$$" | \
		sed -e "s/^modern/https:\/\/indigoparadox.zone/g" > \
			"$@"

modern/%: meta/%
	cp -v "$<" "$@"

clean:
	rm -rf "modern" "temp"

