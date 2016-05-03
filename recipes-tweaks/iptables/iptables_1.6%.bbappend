FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

EXTRA_OECONF += "--enable-shared --disable-static"

SRC_URI += "file://600-shared-libext.patch"

LDFLAGS += "-fuse-ld=bfd"

do_install_append() {
	install -d ${D}${libdir}
    install -m 0644 ${B}/extensions/libiptext.so ${D}${libdir}/libiptext.so.0.0.0
    install -m 0644 ${B}/extensions/libiptext4.so ${D}${libdir}/libiptext4.so.0.0.0
    install -m 0644 ${B}/extensions/libiptext6.so ${D}${libdir}/libiptext6.so.0.0.0
    install -m 0644 ${B}/extensions/libiptext_arpt.so ${D}${libdir}/libiptext_arpt.so.0.0.0
    install -m 0644 ${B}/extensions/libiptext_ebt.so ${D}${libdir}/libiptext_ebt.so.0.0.0

    ln -s libiptext.so.0.0.0 ${D}/${libdir}/libiptext.so.0
    ln -s libiptext4.so.0.0.0 ${D}/${libdir}/libiptext4.so.0
    ln -s libiptext6.so.0.0.0 ${D}/${libdir}/libiptext6.so.0
    ln -s libiptext_arpt.so.0.0.0 ${D}/${libdir}/libiptext_arpt.so.0
    ln -s libiptext_ebt.so.0.0.0 ${D}/${libdir}/libiptext_ebt.so.0

    ln -s libiptext.so.0.0.0 ${D}/${libdir}/libiptext.so
    ln -s libiptext4.so.0.0.0 ${D}/${libdir}/libiptext4.so
    ln -s libiptext6.so.0.0.0 ${D}/${libdir}/libiptext6.so
    ln -s libiptext_arpt.so.0.0.0 ${D}/${libdir}/libiptext_arpt.so
    ln -s libiptext_ebt.so.0.0.0 ${D}/${libdir}/libiptext_ebt.so
}
