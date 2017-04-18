import time

FNAME = "include/build_num.h"

build_num = None
version_major = None
version_minor = None

DEF_BUILD_NUM = "#define BUILD_NUM "
DEF_VERSION_MAJOR = "#define VERSION_MAJOR "
DEF_VERSION_MINOR = "#define VERSION_MINOR "

def get_int(s_marker, line):
    _, _, s = line.partition(s_marker) # we want the part after the marker
    return int(s)

try:
    with open(FNAME) as f:
        for line in f:
            if DEF_BUILD_NUM in line:
                build_num = get_int(DEF_BUILD_NUM, line)
                build_num += 1
            elif DEF_VERSION_MAJOR in line:
                version_major = get_int(DEF_VERSION_MAJOR, line)
            elif DEF_VERSION_MINOR in line:
                version_minor = get_int(DEF_VERSION_MINOR, line)
except IOError:
    build_num = 1
    version_major = 0
    version_minor = 1

assert None not in (build_num, version_major, version_minor)


with open(FNAME, 'w') as f:
    f.write("#ifndef BUILD_NUM_H\n")
    f.write("#define BUILD_NUM_H\n")
    f.write("\n")
    f.write(DEF_BUILD_NUM + "%d\n" % build_num)
    f.write("\n")
    t = time.localtime()
    f.write("#define BUILD_YEAR %d\n" % t.tm_year)
    f.write("#define BUILD_MONTH %d\n" % t.tm_mon)
    f.write("#define BUILD_DATE %d\n" % t.tm_mday)
    f.write("#define BUILD_HOUR %d\n" % t.tm_hour)
    f.write("#define BUILD_MIN %d\n" % t.tm_min)
    f.write("#define BUILD_SEC %d\n" % t.tm_sec)
    f.write("\n")
    f.write("#define VERSION_MAJOR %d\n" % version_major)
    f.write("#define VERSION_MINOR %d\n" % version_minor)
    f.write("\n")
    f.write("#define VERSION \"%d.%d\"\n" % (version_major, version_minor))
    s = "%d.%d.%04d%02d%02d.%02d%02d%02d" % (version_major, version_minor,
            t.tm_year, t.tm_mon, t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec)
    f.write("#define COMPLETE_VERSION \"%s\"\n" % s)
    f.write("\n")
    f.write("#endif // BUILD_NUM_H\n")

