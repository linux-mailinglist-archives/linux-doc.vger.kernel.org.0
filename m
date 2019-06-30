Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCDE5B0D8
	for <lists+linux-doc@lfdr.de>; Sun, 30 Jun 2019 19:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfF3RM1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 30 Jun 2019 13:12:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:58707 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726650AbfF3RM0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 30 Jun 2019 13:12:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jun 2019 10:12:24 -0700
X-IronPort-AV: E=Sophos;i="5.63,436,1557212400"; 
   d="scan'208";a="165587292"
Received: from spandruv-mobl.amr.corp.intel.com ([10.251.15.131])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jun 2019 10:12:23 -0700
Message-ID: <e8dae5ff583de6b70b3e1b27190280adaf2348b3.camel@linux.intel.com>
Subject: Re: [UPDATE][PATCH] tools/power/x86: A tool to validate Intel Speed
 Select commands
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     dvhart@infradead.org, andy@infradead.org,
        andriy.shevchenko@intel.com, corbet@lwn.net
Cc:     rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org,
        prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Date:   Sun, 30 Jun 2019 10:12:22 -0700
In-Reply-To: <20190630171054.8353-1-srinivas.pandruvada@linux.intel.com>
References: <20190630171054.8353-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Please ignore. I will send again.

On Sun, 2019-06-30 at 10:10 -0700, Srinivas Pandruvada wrote:
> The Intel(R) Speed select technologies contains four features.
> 
> Performance profile:An non architectural mechanism that allows
> multiple
> optimized performance profiles per system via static and/or dynamic
> adjustment of core count, workload, Tjmax, and TDP, etc. aka ISS
> in the documentation.
> 
> Base Frequency: Enables users to increase guaranteed base frequency
> on
> certain cores (high priority cores) in exchange for lower base
> frequency
> on remaining cores (low priority cores). aka PBF in the documenation.
> 
> Turbo frequency: Enables the ability to set different turbo ratio
> limits
> to cores based on priority. aka FACT in the documentation.
> 
> Core power: An Interface that allows user to define per core/tile
> priority.
> 
> There is a multi level help for commands and options. This can be
> used
> to check required arguments for each feature and commands for the
> feature.
> 
> To start navigating the features start with
> 
> $sudo intel-speed-select --help
> 
> For help on a specific feature for example
> $sudo intel-speed-select perf-profile --help
> 
> To get help for a command for a feature for example
> $sudo intel-speed-select perf-profile get-lock-status --help
> 
> Signed-off-by: Srinivas Pandruvada <
> srinivas.pandruvada@linux.intel.com>
> ---
> Updates:
> - Copied Makefile from tools/gpio and moified the Makefile here
> - Added entry to tools/build/Makefile
> - Rename directory to match the executable name
> - Fix one error message
> 
>  tools/Makefile                                |   12 +-
>  tools/power/x86/intel-speed-select/Build      |    1 +
>  tools/power/x86/intel-speed-select/Makefile   |   56 +
>  .../x86/intel-speed-select/isst-config.c      | 1607
> +++++++++++++++++
>  .../power/x86/intel-speed-select/isst-core.c  |  721 ++++++++
>  .../x86/intel-speed-select/isst-display.c     |  479 +++++
>  tools/power/x86/intel-speed-select/isst.h     |  231 +++
>  7 files changed, 3102 insertions(+), 5 deletions(-)
>  create mode 100644 tools/power/x86/intel-speed-select/Build
>  create mode 100644 tools/power/x86/intel-speed-select/Makefile
>  create mode 100644 tools/power/x86/intel-speed-select/isst-config.c
>  create mode 100644 tools/power/x86/intel-speed-select/isst-core.c
>  create mode 100644 tools/power/x86/intel-speed-select/isst-display.c
>  create mode 100644 tools/power/x86/intel-speed-select/isst.h
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 3dfd72ae6c1a..68defd7ecf5d 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -19,6 +19,7 @@ help:
>  	@echo '  gpio                   - GPIO tools'
>  	@echo '  hv                     - tools used when in Hyper-V
> clients'
>  	@echo '  iio                    - IIO tools'
> +	@echo '  intel-speed-select     - Intel Speed Select tool'
>  	@echo '  kvm_stat               - top-like utility for
> displaying kvm statistics'
>  	@echo '  leds                   - LEDs  tools'
>  	@echo '  liblockdep             - user-space wrapper for kernel
> locking-validator'
> @@ -82,7 +83,7 @@ perf: FORCE
>  selftests: FORCE
>  	$(call descend,testing/$@)
>  
> -turbostat x86_energy_perf_policy: FORCE
> +turbostat x86_energy_perf_policy intel-speed-select: FORCE
>  	$(call descend,power/x86/$@)
>  
>  tmon: FORCE
> @@ -115,7 +116,7 @@ liblockdep_install:
>  selftests_install:
>  	$(call descend,testing/$(@:_install=),install)
>  
> -turbostat_install x86_energy_perf_policy_install:
> +turbostat_install x86_energy_perf_policy_install intel-speed-
> select_install:
>  	$(call descend,power/x86/$(@:_install=),install)
>  
>  tmon_install:
> @@ -132,7 +133,7 @@ install: acpi_install cgroup_install
> cpupower_install gpio_install \
>  		perf_install selftests_install turbostat_install
> usb_install \
>  		virtio_install vm_install bpf_install
> x86_energy_perf_policy_install \
>  		tmon_install freefall_install objtool_install
> kvm_stat_install \
> -		wmi_install pci_install debugging_install
> +		wmi_install pci_install debugging_install intel-speed-
> select_install
>  
>  acpi_clean:
>  	$(call descend,power/acpi,clean)
> @@ -162,7 +163,7 @@ perf_clean:
>  selftests_clean:
>  	$(call descend,testing/$(@:_clean=),clean)
>  
> -turbostat_clean x86_energy_perf_policy_clean:
> +turbostat_clean x86_energy_perf_policy_clean intel-speed-
> select_clean:
>  	$(call descend,power/x86/$(@:_clean=),clean)
>  
>  tmon_clean:
> @@ -178,6 +179,7 @@ clean: acpi_clean cgroup_clean cpupower_clean
> hv_clean firewire_clean \
>  		perf_clean selftests_clean turbostat_clean spi_clean
> usb_clean virtio_clean \
>  		vm_clean bpf_clean iio_clean
> x86_energy_perf_policy_clean tmon_clean \
>  		freefall_clean build_clean libbpf_clean libsubcmd_clean
> liblockdep_clean \
> -		gpio_clean objtool_clean leds_clean wmi_clean pci_clean
> firmware_clean debugging_clean
> +		gpio_clean objtool_clean leds_clean wmi_clean pci_clean
> firmware_clean debugging_clean \
> +		intel-speed-select_clean
>  
>  .PHONY: FORCE
> diff --git a/tools/power/x86/intel-speed-select/Build
> b/tools/power/x86/intel-speed-select/Build
> new file mode 100644
> index 000000000000..b61456d75190
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/Build
> @@ -0,0 +1 @@
> +intel-speed-select-y +=  isst-config.o isst-core.o isst-display.o
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> new file mode 100644
> index 000000000000..12c6939dca2a
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0
> +include ../../../scripts/Makefile.include
> +
> +bindir ?= /usr/bin
> +
> +ifeq ($(srctree),)
> +srctree := $(patsubst %/,%,$(dir $(CURDIR)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +endif
> +
> +# Do not use make's built-in rules
> +# (this improves performance and avoids hard-to-debug behaviour);
> +MAKEFLAGS += -r
> +
> +override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> +
> +ALL_TARGETS := intel-speed-select
> +ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
> +
> +all: $(ALL_PROGRAMS)
> +
> +export srctree OUTPUT CC LD CFLAGS
> +include $(srctree)/tools/build/Makefile.include
> +
> +#
> +# We need the following to be outside of kernel tree
> +#
> +$(OUTPUT)include/linux/isst_if.h:
> ../../../../include/uapi/linux/isst_if.h
> +	mkdir -p $(OUTPUT)include/linux 2>&1 || true
> +	ln -sf $(CURDIR)/../../../../include/uapi/linux/isst_if.h $@
> +
> +prepare: $(OUTPUT)include/linux/isst_if.h
> +
> +ISST_IN := $(OUTPUT)intel-speed-select-in.o
> +
> +$(ISST_IN): prepare FORCE
> +	$(Q)$(MAKE) $(build)=intel-speed-select
> +$(OUTPUT)intel-speed-select: $(ISST_IN)
> +	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +
> +clean:
> +	rm -f $(ALL_PROGRAMS)
> +	rm -rf $(OUTPUT)include/linux/isst_if.h
> +	find $(if $(OUTPUT),$(OUTPUT),.) -name '*.o' -delete -o -name
> '\.*.d' -delete
> +
> +install: $(ALL_PROGRAMS)
> +	install -d -m 755 $(DESTDIR)$(bindir);		\
> +	for program in $(ALL_PROGRAMS); do		\
> +		install $$program $(DESTDIR)$(bindir);	\
> +	done
> +
> +FORCE:
> +
> +.PHONY: all install clean FORCE prepare
> diff --git a/tools/power/x86/intel-speed-select/isst-config.c
> b/tools/power/x86/intel-speed-select/isst-config.c
> new file mode 100644
> index 000000000000..91c5ad1685a1
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/isst-config.c
> @@ -0,0 +1,1607 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Speed Select -- Enumerate and control features
> + * Copyright (c) 2019 Intel Corporation.
> + */
> +
> +#include <linux/isst_if.h>
> +
> +#include "isst.h"
> +
> +struct process_cmd_struct {
> +	char *feature;
> +	char *command;
> +	void (*process_fn)(void);
> +};
> +
> +static const char *version_str = "v1.0";
> +static const int supported_api_ver = 1;
> +static struct isst_if_platform_info isst_platform_info;
> +static char *progname;
> +static int debug_flag;
> +static FILE *outf;
> +
> +static int cpu_model;
> +
> +#define MAX_CPUS_IN_ONE_REQ 64
> +static short max_target_cpus;
> +static unsigned short target_cpus[MAX_CPUS_IN_ONE_REQ];
> +
> +static int topo_max_cpus;
> +static size_t present_cpumask_size;
> +static cpu_set_t *present_cpumask;
> +static size_t target_cpumask_size;
> +static cpu_set_t *target_cpumask;
> +static int tdp_level = 0xFF;
> +static int fact_bucket = 0xFF;
> +static int fact_avx = 0xFF;
> +static unsigned long long fact_trl;
> +static int out_format_json;
> +static int cmd_help;
> +
> +/* clos related */
> +static int current_clos = -1;
> +static int clos_epp = -1;
> +static int clos_prop_prio = -1;
> +static int clos_min = -1;
> +static int clos_max = -1;
> +static int clos_desired = -1;
> +static int clos_priority_type;
> +
> +struct _cpu_map {
> +	unsigned short core_id;
> +	unsigned short pkg_id;
> +	unsigned short die_id;
> +	unsigned short punit_cpu;
> +	unsigned short punit_cpu_core;
> +};
> +struct _cpu_map *cpu_map;
> +
> +void debug_printf(const char *format, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, format);
> +
> +	if (debug_flag)
> +		vprintf(format, args);
> +
> +	va_end(args);
> +}
> +
> +static void update_cpu_model(void)
> +{
> +	unsigned int ebx, ecx, edx;
> +	unsigned int fms, family;
> +
> +	__cpuid(1, fms, ebx, ecx, edx);
> +	family = (fms >> 8) & 0xf;
> +	cpu_model = (fms >> 4) & 0xf;
> +	if (family == 6 || family == 0xf)
> +		cpu_model += ((fms >> 16) & 0xf) << 4;
> +}
> +
> +/* Open a file, and exit on failure */
> +static FILE *fopen_or_exit(const char *path, const char *mode)
> +{
> +	FILE *filep = fopen(path, mode);
> +
> +	if (!filep)
> +		err(1, "%s: open failed", path);
> +
> +	return filep;
> +}
> +
> +/* Parse a file containing a single int */
> +static int parse_int_file(int fatal, const char *fmt, ...)
> +{
> +	va_list args;
> +	char path[PATH_MAX];
> +	FILE *filep;
> +	int value;
> +
> +	va_start(args, fmt);
> +	vsnprintf(path, sizeof(path), fmt, args);
> +	va_end(args);
> +	if (fatal) {
> +		filep = fopen_or_exit(path, "r");
> +	} else {
> +		filep = fopen(path, "r");
> +		if (!filep)
> +			return -1;
> +	}
> +	if (fscanf(filep, "%d", &value) != 1)
> +		err(1, "%s: failed to parse number from file", path);
> +	fclose(filep);
> +
> +	return value;
> +}
> +
> +int cpufreq_sysfs_present(void)
> +{
> +	DIR *dir;
> +
> +	dir = opendir("/sys/devices/system/cpu/cpu0/cpufreq");
> +	if (dir) {
> +		closedir(dir);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +int out_format_is_json(void)
> +{
> +	return out_format_json;
> +}
> +
> +int get_physical_package_id(int cpu)
> +{
> +	return parse_int_file(
> +		1,
> "/sys/devices/system/cpu/cpu%d/topology/physical_package_id",
> +		cpu);
> +}
> +
> +int get_physical_core_id(int cpu)
> +{
> +	return parse_int_file(
> +		1, "/sys/devices/system/cpu/cpu%d/topology/core_id",
> cpu);
> +}
> +
> +int get_physical_die_id(int cpu)
> +{
> +	int ret;
> +
> +	ret = parse_int_file(0,
> "/sys/devices/system/cpu/cpu%d/topology/die_id",
> +			     cpu);
> +	if (ret < 0)
> +		ret = 0;
> +
> +	return ret;
> +}
> +
> +int get_topo_max_cpus(void)
> +{
> +	return topo_max_cpus;
> +}
> +
> +#define MAX_PACKAGE_COUNT 8
> +#define MAX_DIE_PER_PACKAGE 2
> +static void for_each_online_package_in_set(void (*callback)(int,
> void *, void *,
> +							    void *,
> void *),
> +					   void *arg1, void *arg2, void
> *arg3,
> +					   void *arg4)
> +{
> +	int max_packages[MAX_PACKAGE_COUNT * MAX_PACKAGE_COUNT];
> +	int pkg_index = 0, i;
> +
> +	memset(max_packages, 0xff, sizeof(max_packages));
> +	for (i = 0; i < topo_max_cpus; ++i) {
> +		int j, online, pkg_id, die_id = 0, skip = 0;
> +
> +		if (!CPU_ISSET_S(i, present_cpumask_size,
> present_cpumask))
> +			continue;
> +		if (i)
> +			online = parse_int_file(
> +				1,
> "/sys/devices/system/cpu/cpu%d/online", i);
> +		else
> +			online =
> +				1; /* online entry for CPU 0 needs some
> special configs */
> +
> +		die_id = get_physical_die_id(i);
> +		if (die_id < 0)
> +			die_id = 0;
> +		pkg_id = get_physical_package_id(i);
> +		/* Create an unique id for package, die combination to
> store */
> +		pkg_id = (MAX_PACKAGE_COUNT * pkg_id + die_id);
> +
> +		for (j = 0; j < pkg_index; ++j) {
> +			if (max_packages[j] == pkg_id) {
> +				skip = 1;
> +				break;
> +			}
> +		}
> +
> +		if (!skip && online && callback) {
> +			callback(i, arg1, arg2, arg3, arg4);
> +			max_packages[pkg_index++] = pkg_id;
> +		}
> +	}
> +}
> +
> +static void for_each_online_target_cpu_in_set(
> +	void (*callback)(int, void *, void *, void *, void *), void
> *arg1,
> +	void *arg2, void *arg3, void *arg4)
> +{
> +	int i;
> +
> +	for (i = 0; i < topo_max_cpus; ++i) {
> +		int online;
> +
> +		if (!CPU_ISSET_S(i, target_cpumask_size,
> target_cpumask))
> +			continue;
> +		if (i)
> +			online = parse_int_file(
> +				1,
> "/sys/devices/system/cpu/cpu%d/online", i);
> +		else
> +			online =
> +				1; /* online entry for CPU 0 needs some
> special configs */
> +
> +		if (online && callback)
> +			callback(i, arg1, arg2, arg3, arg4);
> +	}
> +}
> +
> +#define BITMASK_SIZE 32
> +static void set_max_cpu_num(void)
> +{
> +	FILE *filep;
> +	unsigned long dummy;
> +
> +	topo_max_cpus = 0;
> +	filep = fopen_or_exit(
> +		"/sys/devices/system/cpu/cpu0/topology/thread_siblings"
> , "r");
> +	while (fscanf(filep, "%lx,", &dummy) == 1)
> +		topo_max_cpus += BITMASK_SIZE;
> +	fclose(filep);
> +	topo_max_cpus--; /* 0 based */
> +
> +	debug_printf("max cpus %d\n", topo_max_cpus);
> +}
> +
> +size_t alloc_cpu_set(cpu_set_t **cpu_set)
> +{
> +	cpu_set_t *_cpu_set;
> +	size_t size;
> +
> +	_cpu_set = CPU_ALLOC((topo_max_cpus + 1));
> +	if (_cpu_set == NULL)
> +		err(3, "CPU_ALLOC");
> +	size = CPU_ALLOC_SIZE((topo_max_cpus + 1));
> +	CPU_ZERO_S(size, _cpu_set);
> +
> +	*cpu_set = _cpu_set;
> +	return size;
> +}
> +
> +void free_cpu_set(cpu_set_t *cpu_set)
> +{
> +	CPU_FREE(cpu_set);
> +}
> +
> +static int cpu_cnt[MAX_PACKAGE_COUNT][MAX_DIE_PER_PACKAGE];
> +static void set_cpu_present_cpu_mask(void)
> +{
> +	size_t size;
> +	DIR *dir;
> +	int i;
> +
> +	size = alloc_cpu_set(&present_cpumask);
> +	present_cpumask_size = size;
> +	for (i = 0; i < topo_max_cpus; ++i) {
> +		char buffer[256];
> +
> +		snprintf(buffer, sizeof(buffer),
> +			 "/sys/devices/system/cpu/cpu%d", i);
> +		dir = opendir(buffer);
> +		if (dir) {
> +			int pkg_id, die_id;
> +
> +			CPU_SET_S(i, size, present_cpumask);
> +			die_id = get_physical_die_id(i);
> +			if (die_id < 0)
> +				die_id = 0;
> +
> +			pkg_id = get_physical_package_id(i);
> +			if (pkg_id < MAX_PACKAGE_COUNT &&
> +			    die_id < MAX_DIE_PER_PACKAGE)
> +				cpu_cnt[pkg_id][die_id]++;
> +		}
> +		closedir(dir);
> +	}
> +}
> +
> +int get_cpu_count(int pkg_id, int die_id)
> +{
> +	if (pkg_id < MAX_PACKAGE_COUNT && die_id < MAX_DIE_PER_PACKAGE)
> +		return cpu_cnt[pkg_id][die_id] + 1;
> +
> +	return 0;
> +}
> +
> +static void set_cpu_target_cpu_mask(void)
> +{
> +	size_t size;
> +	int i;
> +
> +	size = alloc_cpu_set(&target_cpumask);
> +	target_cpumask_size = size;
> +	for (i = 0; i < max_target_cpus; ++i) {
> +		if (!CPU_ISSET_S(target_cpus[i], present_cpumask_size,
> +				 present_cpumask))
> +			continue;
> +
> +		CPU_SET_S(target_cpus[i], size, target_cpumask);
> +	}
> +}
> +
> +static void create_cpu_map(void)
> +{
> +	const char *pathname = "/dev/isst_interface";
> +	int i, fd = 0;
> +	struct isst_if_cpu_maps map;
> +
> +	cpu_map = malloc(sizeof(*cpu_map) * topo_max_cpus);
> +	if (!cpu_map)
> +		err(3, "cpumap");
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	for (i = 0; i < topo_max_cpus; ++i) {
> +		if (!CPU_ISSET_S(i, present_cpumask_size,
> present_cpumask))
> +			continue;
> +
> +		map.cmd_count = 1;
> +		map.cpu_map[0].logical_cpu = i;
> +
> +		debug_printf(" map logical_cpu:%d\n",
> +			     map.cpu_map[0].logical_cpu);
> +		if (ioctl(fd, ISST_IF_GET_PHY_ID, &map) == -1) {
> +			perror("ISST_IF_GET_PHY_ID");
> +			fprintf(outf, "Error: map logical_cpu:%d\n",
> +				map.cpu_map[0].logical_cpu);
> +			continue;
> +		}
> +		cpu_map[i].core_id = get_physical_core_id(i);
> +		cpu_map[i].pkg_id = get_physical_package_id(i);
> +		cpu_map[i].die_id = get_physical_die_id(i);
> +		cpu_map[i].punit_cpu = map.cpu_map[0].physical_cpu;
> +		cpu_map[i].punit_cpu_core =
> (map.cpu_map[0].physical_cpu >>
> +					     1); // shift to get core
> id
> +
> +		debug_printf(
> +			"map logical_cpu:%d core: %d die:%d pkg:%d
> punit_cpu:%d punit_core:%d\n",
> +			i, cpu_map[i].core_id, cpu_map[i].die_id,
> +			cpu_map[i].pkg_id, cpu_map[i].punit_cpu,
> +			cpu_map[i].punit_cpu_core);
> +	}
> +
> +	if (fd)
> +		close(fd);
> +}
> +
> +int find_logical_cpu(int pkg_id, int die_id, int punit_core_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < topo_max_cpus; ++i) {
> +		if (cpu_map[i].pkg_id == pkg_id &&
> +		    cpu_map[i].die_id == die_id &&
> +		    cpu_map[i].punit_cpu_core == punit_core_id)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +void set_cpu_mask_from_punit_coremask(int cpu, unsigned long long
> core_mask,
> +				      size_t core_cpumask_size,
> +				      cpu_set_t *core_cpumask, int
> *cpu_cnt)
> +{
> +	int i, cnt = 0;
> +	int die_id, pkg_id;
> +
> +	*cpu_cnt = 0;
> +	die_id = get_physical_die_id(cpu);
> +	pkg_id = get_physical_package_id(cpu);
> +
> +	for (i = 0; i < 64; ++i) {
> +		if (core_mask & BIT(i)) {
> +			int j;
> +
> +			for (j = 0; j < topo_max_cpus; ++j) {
> +				if (cpu_map[j].pkg_id == pkg_id &&
> +				    cpu_map[j].die_id == die_id &&
> +				    cpu_map[j].punit_cpu_core == i) {
> +					CPU_SET_S(j, core_cpumask_size,
> +						  core_cpumask);
> +					++cnt;
> +				}
> +			}
> +		}
> +	}
> +
> +	*cpu_cnt = cnt;
> +}
> +
> +int find_phy_core_num(int logical_cpu)
> +{
> +	if (logical_cpu < topo_max_cpus)
> +		return cpu_map[logical_cpu].punit_cpu_core;
> +
> +	return -EINVAL;
> +}
> +
> +static int isst_send_mmio_command(unsigned int cpu, unsigned int
> reg, int write,
> +				  unsigned int *value)
> +{
> +	struct isst_if_io_regs io_regs;
> +	const char *pathname = "/dev/isst_interface";
> +	int cmd;
> +	int fd;
> +
> +	debug_printf("mmio_cmd cpu:%d reg:%d write:%d\n", cpu, reg,
> write);
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	io_regs.req_count = 1;
> +	io_regs.io_reg[0].logical_cpu = cpu;
> +	io_regs.io_reg[0].reg = reg;
> +	cmd = ISST_IF_IO_CMD;
> +	if (write) {
> +		io_regs.io_reg[0].read_write = 1;
> +		io_regs.io_reg[0].value = *value;
> +	} else {
> +		io_regs.io_reg[0].read_write = 0;
> +	}
> +
> +	if (ioctl(fd, cmd, &io_regs) == -1) {
> +		perror("ISST_IF_IO_CMD");
> +		fprintf(outf, "Error: mmio_cmd cpu:%d reg:%x
> read_write:%x\n",
> +			cpu, reg, write);
> +	} else {
> +		if (!write)
> +			*value = io_regs.io_reg[0].value;
> +
> +		debug_printf(
> +			"mmio_cmd response: cpu:%d reg:%x rd_write:%x
> resp:%x\n",
> +			cpu, reg, write, *value);
> +	}
> +
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +int isst_send_mbox_command(unsigned int cpu, unsigned char command,
> +			   unsigned char sub_command, unsigned int
> parameter,
> +			   unsigned int req_data, unsigned int *resp)
> +{
> +	const char *pathname = "/dev/isst_interface";
> +	int fd;
> +	struct isst_if_mbox_cmds mbox_cmds = { 0 };
> +
> +	debug_printf(
> +		"mbox_send: cpu:%d command:%x sub_command:%x
> parameter:%x req_data:%x\n",
> +		cpu, command, sub_command, parameter, req_data);
> +
> +	if (isst_platform_info.mmio_supported && command ==
> CONFIG_CLOS) {
> +		unsigned int value;
> +		int write = 0;
> +		int clos_id, core_id, ret = 0;
> +
> +		debug_printf("CLOS %d\n", cpu);
> +
> +		if (parameter & BIT(MBOX_CMD_WRITE_BIT)) {
> +			value = req_data;
> +			write = 1;
> +		}
> +
> +		switch (sub_command) {
> +		case CLOS_PQR_ASSOC:
> +			core_id = parameter & 0xff;
> +			ret = isst_send_mmio_command(
> +				cpu, PQR_ASSOC_OFFSET + core_id * 4,
> write,
> +				&value);
> +			if (!ret && !write)
> +				*resp = value;
> +			break;
> +		case CLOS_PM_CLOS:
> +			clos_id = parameter & 0x03;
> +			ret = isst_send_mmio_command(
> +				cpu, PM_CLOS_OFFSET + clos_id * 4,
> write,
> +				&value);
> +			if (!ret && !write)
> +				*resp = value;
> +			break;
> +		case CLOS_PM_QOS_CONFIG:
> +			ret = isst_send_mmio_command(cpu,
> PM_QOS_CONFIG_OFFSET,
> +						     write, &value);
> +			if (!ret && !write)
> +				*resp = value;
> +			break;
> +		case CLOS_STATUS:
> +			break;
> +		default:
> +			break;
> +		}
> +		return ret;
> +	}
> +
> +	mbox_cmds.cmd_count = 1;
> +	mbox_cmds.mbox_cmd[0].logical_cpu = cpu;
> +	mbox_cmds.mbox_cmd[0].command = command;
> +	mbox_cmds.mbox_cmd[0].sub_command = sub_command;
> +	mbox_cmds.mbox_cmd[0].parameter = parameter;
> +	mbox_cmds.mbox_cmd[0].req_data = req_data;
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	if (ioctl(fd, ISST_IF_MBOX_COMMAND, &mbox_cmds) == -1) {
> +		perror("ISST_IF_MBOX_COMMAND");
> +		fprintf(outf,
> +			"Error: mbox_cmd cpu:%d command:%x
> sub_command:%x parameter:%x req_data:%x\n",
> +			cpu, command, sub_command, parameter,
> req_data);
> +	} else {
> +		*resp = mbox_cmds.mbox_cmd[0].resp_data;
> +		debug_printf(
> +			"mbox_cmd response: cpu:%d command:%x
> sub_command:%x parameter:%x req_data:%x resp:%x\n",
> +			cpu, command, sub_command, parameter, req_data,
> *resp);
> +	}
> +
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +int isst_send_msr_command(unsigned int cpu, unsigned int msr, int
> write,
> +			  unsigned long long *req_resp)
> +{
> +	struct isst_if_msr_cmds msr_cmds;
> +	const char *pathname = "/dev/isst_interface";
> +	int fd;
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	msr_cmds.cmd_count = 1;
> +	msr_cmds.msr_cmd[0].logical_cpu = cpu;
> +	msr_cmds.msr_cmd[0].msr = msr;
> +	msr_cmds.msr_cmd[0].read_write = write;
> +	if (write)
> +		msr_cmds.msr_cmd[0].data = *req_resp;
> +
> +	if (ioctl(fd, ISST_IF_MSR_COMMAND, &msr_cmds) == -1) {
> +		perror("ISST_IF_MSR_COMMAD");
> +		fprintf(outf, "Error: msr_cmd cpu:%d msr:%x
> read_write:%d\n",
> +			cpu, msr, write);
> +	} else {
> +		if (!write)
> +			*req_resp = msr_cmds.msr_cmd[0].data;
> +
> +		debug_printf(
> +			"msr_cmd response: cpu:%d msr:%x rd_write:%x
> resp:%llx %llx\n",
> +			cpu, msr, write, *req_resp,
> msr_cmds.msr_cmd[0].data);
> +	}
> +
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +static int isst_fill_platform_info(void)
> +{
> +	const char *pathname = "/dev/isst_interface";
> +	int fd;
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	if (ioctl(fd, ISST_IF_GET_PLATFORM_INFO, &isst_platform_info)
> == -1) {
> +		perror("ISST_IF_GET_PLATFORM_INFO");
> +		close(fd);
> +		return -1;
> +	}
> +
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +static void isst_print_platform_information(void)
> +{
> +	struct isst_if_platform_info platform_info;
> +	const char *pathname = "/dev/isst_interface";
> +	int fd;
> +
> +	fd = open(pathname, O_RDWR);
> +	if (fd < 0)
> +		err(-1, "%s open failed", pathname);
> +
> +	if (ioctl(fd, ISST_IF_GET_PLATFORM_INFO, &platform_info) == -1)
> {
> +		perror("ISST_IF_GET_PLATFORM_INFO");
> +	} else {
> +		fprintf(outf, "Platform: API version : %d\n",
> +			platform_info.api_version);
> +		fprintf(outf, "Platform: Driver version : %d\n",
> +			platform_info.driver_version);
> +		fprintf(outf, "Platform: mbox supported : %d\n",
> +			platform_info.mbox_supported);
> +		fprintf(outf, "Platform: mmio supported : %d\n",
> +			platform_info.mmio_supported);
> +	}
> +
> +	close(fd);
> +
> +	exit(0);
> +}
> +
> +static void exec_on_get_ctdp_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				 void *arg4)
> +{
> +	int (*fn_ptr)(int cpu, void *arg);
> +	int ret;
> +
> +	fn_ptr = arg1;
> +	ret = fn_ptr(cpu, arg2);
> +	if (ret)
> +		perror("get_tdp_*");
> +	else
> +		isst_display_result(cpu, outf, "perf-profile", (char
> *)arg3,
> +				    *(unsigned int *)arg4);
> +}
> +
> +#define _get_tdp_level(desc, suffix, object,
> help)                                \
> +	static void
> get_tdp_##object(void)                                        \
> +	{                                                              
>            \
> +		struct isst_pkg_ctdp
> ctdp;                                        \
> +\
> +		if (cmd_help)
> {                                                   \
> +			fprintf(stderr,                                
>            \
> +				"Print %s [No command arguments are
> required]\n", \
> +				help);                                 
>            \
> +			exit(0);                                       
>            \
> +		}                                                      
>            \
> +		isst_ctdp_display_information_start(outf);             
>            \
> +		if
> (max_target_cpus)                                              \
> +			for_each_online_target_cpu_in_set(             
>            \
> +				exec_on_get_ctdp_cpu,
> isst_get_ctdp_##suffix,     \
> +				&ctdp, desc,
> &ctdp.object);                       \
> +		else                                                   
>            \
> +			for_each_online_package_in_set(exec_on_get_ctdp
> _cpu,      \
> +						       isst_get_ctdp_##
> suffix,    \
> +						       &ctdp,
> desc,               \
> +						       &ctdp.object);  
>            \
> +		isst_ctdp_display_information_end(outf);               
>            \
> +	}
> +
> +_get_tdp_level("get-config-levels", levels, levels, "TDP levels");
> +_get_tdp_level("get-config-version", levels, version, "TDP
> version");
> +_get_tdp_level("get-config-enabled", levels, enabled, "TDP enable
> status");
> +_get_tdp_level("get-config-current_level", levels, current_level,
> +	       "Current TDP Level");
> +_get_tdp_level("get-lock-status", levels, locked, "TDP lock
> status");
> +
> +static void dump_isst_config_for_cpu(int cpu, void *arg1, void
> *arg2,
> +				     void *arg3, void *arg4)
> +{
> +	struct isst_pkg_ctdp pkg_dev;
> +	int ret;
> +
> +	memset(&pkg_dev, 0, sizeof(pkg_dev));
> +	ret = isst_get_process_ctdp(cpu, tdp_level, &pkg_dev);
> +	if (ret) {
> +		perror("isst_get_process_ctdp");
> +	} else {
> +		isst_ctdp_display_information(cpu, outf, tdp_level,
> &pkg_dev);
> +		isst_get_process_ctdp_complete(cpu, &pkg_dev);
> +	}
> +}
> +
> +static void dump_isst_config(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Print Intel(R) Speed Select Technology
> Performance profile configuration\n");
> +		fprintf(stderr,
> +			"including base frequency and turbo frequency
> configurations\n");
> +		fprintf(stderr, "Optional: -l|--level : Specify tdp
> level\n");
> +		fprintf(stderr,
> +			"\tIf no arguments, dump information for all
> TDP levels\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(dump_isst_config_for_
> cpu,
> +						  NULL, NULL, NULL,
> NULL);
> +	else
> +		for_each_online_package_in_set(dump_isst_config_for_cpu
> , NULL,
> +					       NULL, NULL, NULL);
> +
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_tdp_level_for_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				  void *arg4)
> +{
> +	int ret;
> +
> +	ret = isst_set_tdp_level(cpu, tdp_level);
> +	if (ret)
> +		perror("set_tdp_level_for_cpu");
> +	else
> +		isst_display_result(cpu, outf, "perf-profile",
> "set_tdp_level",
> +				    ret);
> +}
> +
> +static void set_tdp_level(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr, "Set Config TDP level\n");
> +		fprintf(stderr,
> +			"\t Arguments: -l|--level : Specify tdp
> level\n");
> +		exit(0);
> +	}
> +
> +	if (tdp_level == 0xff) {
> +		fprintf(outf, "Invalid command: specify tdp_level\n");
> +		exit(1);
> +	}
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_tdp_level_for_cpu
> , NULL,
> +						  NULL, NULL, NULL);
> +	else
> +		for_each_online_package_in_set(set_tdp_level_for_cpu,
> NULL,
> +					       NULL, NULL, NULL);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void dump_pbf_config_for_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				    void *arg4)
> +{
> +	struct isst_pbf_info pbf_info;
> +	int ret;
> +
> +	ret = isst_get_pbf_info(cpu, tdp_level, &pbf_info);
> +	if (ret) {
> +		perror("isst_get_pbf_info");
> +	} else {
> +		isst_pbf_display_information(cpu, outf, tdp_level,
> &pbf_info);
> +		isst_get_pbf_info_complete(&pbf_info);
> +	}
> +}
> +
> +static void dump_pbf_config(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Print Intel(R) Speed Select Technology base
> frequency configuration for a TDP level\n");
> +		fprintf(stderr,
> +			"\tArguments: -l|--level : Specify tdp
> level\n");
> +		exit(0);
> +	}
> +
> +	if (tdp_level == 0xff) {
> +		fprintf(outf, "Invalid command: specify tdp_level\n");
> +		exit(1);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(dump_pbf_config_for_c
> pu, NULL,
> +						  NULL, NULL, NULL);
> +	else
> +		for_each_online_package_in_set(dump_pbf_config_for_cpu,
> NULL,
> +					       NULL, NULL, NULL);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_pbf_for_cpu(int cpu, void *arg1, void *arg2, void
> *arg3,
> +			    void *arg4)
> +{
> +	int ret;
> +	int status = *(int *)arg4;
> +
> +	ret = isst_set_pbf_fact_status(cpu, 1, status);
> +	if (ret) {
> +		perror("isst_set_pbf");
> +	} else {
> +		if (status)
> +			isst_display_result(cpu, outf, "base-freq",
> "enable",
> +					    ret);
> +		else
> +			isst_display_result(cpu, outf, "base-freq",
> "disable",
> +					    ret);
> +	}
> +}
> +
> +static void set_pbf_enable(void)
> +{
> +	int status = 1;
> +
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Enable Intel Speed Select Technology base
> frequency feature [No command arguments are required]\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_pbf_for_cpu,
> NULL, NULL,
> +						  NULL, &status);
> +	else
> +		for_each_online_package_in_set(set_pbf_for_cpu, NULL,
> NULL,
> +					       NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_pbf_disable(void)
> +{
> +	int status = 0;
> +
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Disable Intel Speed Select Technology base
> frequency feature [No command arguments are required]\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_pbf_for_cpu,
> NULL, NULL,
> +						  NULL, &status);
> +	else
> +		for_each_online_package_in_set(set_pbf_for_cpu, NULL,
> NULL,
> +					       NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void dump_fact_config_for_cpu(int cpu, void *arg1, void
> *arg2,
> +				     void *arg3, void *arg4)
> +{
> +	struct isst_fact_info fact_info;
> +	int ret;
> +
> +	ret = isst_get_fact_info(cpu, tdp_level, &fact_info);
> +	if (ret)
> +		perror("isst_get_fact_bucket_info");
> +	else
> +		isst_fact_display_information(cpu, outf, tdp_level,
> fact_bucket,
> +					      fact_avx, &fact_info);
> +}
> +
> +static void dump_fact_config(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Print complete Intel Speed Select Technology
> turbo frequency configuration for a TDP level. Other arguments are
> optional.\n");
> +		fprintf(stderr,
> +			"\tArguments: -l|--level : Specify tdp
> level\n");
> +		fprintf(stderr,
> +			"\tArguments: -b|--bucket : Bucket index to
> dump\n");
> +		fprintf(stderr,
> +			"\tArguments: -r|--trl-type : Specify trl type:
> sse|avx2|avx512\n");
> +		exit(0);
> +	}
> +
> +	if (tdp_level == 0xff) {
> +		fprintf(outf, "Invalid command: specify tdp_level\n");
> +		exit(1);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(dump_fact_config_for_
> cpu,
> +						  NULL, NULL, NULL,
> NULL);
> +	else
> +		for_each_online_package_in_set(dump_fact_config_for_cpu
> , NULL,
> +					       NULL, NULL, NULL);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_fact_for_cpu(int cpu, void *arg1, void *arg2, void
> *arg3,
> +			     void *arg4)
> +{
> +	int ret;
> +	int status = *(int *)arg4;
> +
> +	ret = isst_set_pbf_fact_status(cpu, 0, status);
> +	if (ret)
> +		perror("isst_set_fact");
> +	else {
> +		if (status) {
> +			struct isst_pkg_ctdp pkg_dev;
> +
> +			ret = isst_get_ctdp_levels(cpu, &pkg_dev);
> +			if (ret) {
> +				isst_display_result(cpu, outf, "turbo-
> freq",
> +						    "enable", ret);
> +				return;
> +			}
> +			ret = isst_set_trl(cpu, fact_trl);
> +			isst_display_result(cpu, outf, "turbo-freq",
> "enable",
> +					    ret);
> +		} else {
> +			/* Since we modified TRL during Fact enable,
> restore it */
> +			isst_set_trl_from_current_tdp(cpu, fact_trl);
> +			isst_display_result(cpu, outf, "turbo-freq",
> "disable",
> +					    ret);
> +		}
> +	}
> +}
> +
> +static void set_fact_enable(void)
> +{
> +	int status = 1;
> +
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Enable Intel Speed Select Technology Turbo
> frequency feature\n");
> +		fprintf(stderr,
> +			"Optional: -t|--trl : Specify turbo ratio
> limit\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_fact_for_cpu,
> NULL, NULL,
> +						  NULL, &status);
> +	else
> +		for_each_online_package_in_set(set_fact_for_cpu, NULL,
> NULL,
> +					       NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_fact_disable(void)
> +{
> +	int status = 0;
> +
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Disable Intel Speed Select Technology turbo
> frequency feature\n");
> +		fprintf(stderr,
> +			"Optional: -t|--trl : Specify turbo ratio
> limit\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_fact_for_cpu,
> NULL, NULL,
> +						  NULL, &status);
> +	else
> +		for_each_online_package_in_set(set_fact_for_cpu, NULL,
> NULL,
> +					       NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void enable_clos_qos_config(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				   void *arg4)
> +{
> +	int ret;
> +	int status = *(int *)arg4;
> +
> +	ret = isst_pm_qos_config(cpu, status, clos_priority_type);
> +	if (ret) {
> +		perror("isst_pm_qos_config");
> +	} else {
> +		if (status)
> +			isst_display_result(cpu, outf, "core-power",
> "enable",
> +					    ret);
> +		else
> +			isst_display_result(cpu, outf, "core-power",
> "disable",
> +					    ret);
> +	}
> +}
> +
> +static void set_clos_enable(void)
> +{
> +	int status = 1;
> +
> +	if (cmd_help) {
> +		fprintf(stderr, "Enable core-power for a
> package/die\n");
> +		fprintf(stderr,
> +			"\tClos Enable: Specify priority type with [
> --priority|-p]\n");
> +		fprintf(stderr, "\t\t 0: Proportional, 1: Ordered\n");
> +		exit(0);
> +	}
> +
> +	if (cpufreq_sysfs_present()) {
> +		fprintf(stderr,
> +			"cpufreq subsystem and core-power enable will
> interfere with each other!\n");
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(enable_clos_qos_confi
> g, NULL,
> +						  NULL, NULL, &status);
> +	else
> +		for_each_online_package_in_set(enable_clos_qos_config,
> NULL,
> +					       NULL, NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_clos_disable(void)
> +{
> +	int status = 0;
> +
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Disable core-power: [No command arguments are
> required]\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(enable_clos_qos_confi
> g, NULL,
> +						  NULL, NULL, &status);
> +	else
> +		for_each_online_package_in_set(enable_clos_qos_config,
> NULL,
> +					       NULL, NULL, &status);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void dump_clos_config_for_cpu(int cpu, void *arg1, void
> *arg2,
> +				     void *arg3, void *arg4)
> +{
> +	struct isst_clos_config clos_config;
> +	int ret;
> +
> +	ret = isst_pm_get_clos(cpu, current_clos, &clos_config);
> +	if (ret)
> +		perror("isst_pm_get_clos");
> +	else
> +		isst_clos_display_information(cpu, outf, current_clos,
> +					      &clos_config);
> +}
> +
> +static void dump_clos_config(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Print Intel Speed Select Technology core power
> configuration\n");
> +		fprintf(stderr,
> +			"\tArguments: [-c | --clos]: Specify clos
> id\n");
> +		exit(0);
> +	}
> +	if (current_clos < 0 || current_clos > 3) {
> +		fprintf(stderr, "Invalid clos id\n");
> +		exit(0);
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(dump_clos_config_for_
> cpu,
> +						  NULL, NULL, NULL,
> NULL);
> +	else
> +		for_each_online_package_in_set(dump_clos_config_for_cpu
> , NULL,
> +					       NULL, NULL, NULL);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_clos_config_for_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				    void *arg4)
> +{
> +	struct isst_clos_config clos_config;
> +	int ret;
> +
> +	clos_config.pkg_id = get_physical_package_id(cpu);
> +	clos_config.die_id = get_physical_die_id(cpu);
> +
> +	clos_config.epp = clos_epp;
> +	clos_config.clos_prop_prio = clos_prop_prio;
> +	clos_config.clos_min = clos_min;
> +	clos_config.clos_max = clos_max;
> +	clos_config.clos_desired = clos_desired;
> +	ret = isst_set_clos(cpu, current_clos, &clos_config);
> +	if (ret)
> +		perror("isst_set_clos");
> +	else
> +		isst_display_result(cpu, outf, "core-power", "config",
> ret);
> +}
> +
> +static void set_clos_config(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr,
> +			"Set core-power configuration for one of the
> four clos ids\n");
> +		fprintf(stderr,
> +			"\tSpecify targeted clos id with [--clos|-
> c]\n");
> +		fprintf(stderr, "\tSpecify clos EPP with [--epp|-
> e]\n");
> +		fprintf(stderr,
> +			"\tSpecify clos Proportional Priority [
> --weight|-w]\n");
> +		fprintf(stderr, "\tSpecify clos min with [--min|-
> n]\n");
> +		fprintf(stderr, "\tSpecify clos max with [--max|-
> m]\n");
> +		fprintf(stderr, "\tSpecify clos desired with [
> --desired|-d]\n");
> +		exit(0);
> +	}
> +
> +	if (current_clos < 0 || current_clos > 3) {
> +		fprintf(stderr, "Invalid clos id\n");
> +		exit(0);
> +	}
> +	if (clos_epp < 0 || clos_epp > 0x0F) {
> +		fprintf(stderr, "clos epp is not specified, default:
> 0\n");
> +		clos_epp = 0;
> +	}
> +	if (clos_prop_prio < 0 || clos_prop_prio > 0x0F) {
> +		fprintf(stderr,
> +			"clos frequency weight is not specified,
> default: 0\n");
> +		clos_prop_prio = 0;
> +	}
> +	if (clos_min < 0) {
> +		fprintf(stderr, "clos min is not specified, default:
> 0\n");
> +		clos_min = 0;
> +	}
> +	if (clos_max < 0) {
> +		fprintf(stderr, "clos max is not specified, default:
> 0xff\n");
> +		clos_max = 0xff;
> +	}
> +	if (clos_desired < 0) {
> +		fprintf(stderr, "clos desired is not specified,
> default: 0\n");
> +		clos_desired = 0x00;
> +	}
> +
> +	isst_ctdp_display_information_start(outf);
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_clos_config_for_c
> pu, NULL,
> +						  NULL, NULL, NULL);
> +	else
> +		for_each_online_package_in_set(set_clos_config_for_cpu,
> NULL,
> +					       NULL, NULL, NULL);
> +	isst_ctdp_display_information_end(outf);
> +}
> +
> +static void set_clos_assoc_for_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				   void *arg4)
> +{
> +	int ret;
> +
> +	ret = isst_clos_associate(cpu, current_clos);
> +	if (ret)
> +		perror("isst_clos_associate");
> +	else
> +		isst_display_result(cpu, outf, "core-power", "assoc",
> ret);
> +}
> +
> +static void set_clos_assoc(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr, "Associate a clos id to a CPU\n");
> +		fprintf(stderr,
> +			"\tSpecify targeted clos id with [--clos|-
> c]\n");
> +		exit(0);
> +	}
> +
> +	if (current_clos < 0 || current_clos > 3) {
> +		fprintf(stderr, "Invalid clos id\n");
> +		exit(0);
> +	}
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(set_clos_assoc_for_cp
> u, NULL,
> +						  NULL, NULL, NULL);
> +	else {
> +		fprintf(stderr,
> +			"Invalid target cpu. Specify with [-c|
> --cpu]\n");
> +	}
> +}
> +
> +static void get_clos_assoc_for_cpu(int cpu, void *arg1, void *arg2,
> void *arg3,
> +				   void *arg4)
> +{
> +	int clos, ret;
> +
> +	ret = isst_clos_get_assoc_status(cpu, &clos);
> +	if (ret)
> +		perror("isst_clos_get_assoc_status");
> +	else
> +		isst_display_result(cpu, outf, "core-power", "get-
> assoc", clos);
> +}
> +
> +static void get_clos_assoc(void)
> +{
> +	if (cmd_help) {
> +		fprintf(stderr, "Get associate clos id to a CPU\n");
> +		fprintf(stderr, "\tSpecify targeted cpu id with [
> --cpu|-c]\n");
> +		exit(0);
> +	}
> +	if (max_target_cpus)
> +		for_each_online_target_cpu_in_set(get_clos_assoc_for_cp
> u, NULL,
> +						  NULL, NULL, NULL);
> +	else {
> +		fprintf(stderr,
> +			"Invalid target cpu. Specify with [-c|
> --cpu]\n");
> +	}
> +}
> +
> +static struct process_cmd_struct isst_cmds[] = {
> +	{ "perf-profile", "get-lock-status", get_tdp_locked },
> +	{ "perf-profile", "get-config-levels", get_tdp_levels },
> +	{ "perf-profile", "get-config-version", get_tdp_version },
> +	{ "perf-profile", "get-config-enabled", get_tdp_enabled },
> +	{ "perf-profile", "get-config-current-level",
> get_tdp_current_level },
> +	{ "perf-profile", "set-config-level", set_tdp_level },
> +	{ "perf-profile", "info", dump_isst_config },
> +	{ "base-freq", "info", dump_pbf_config },
> +	{ "base-freq", "enable", set_pbf_enable },
> +	{ "base-freq", "disable", set_pbf_disable },
> +	{ "turbo-freq", "info", dump_fact_config },
> +	{ "turbo-freq", "enable", set_fact_enable },
> +	{ "turbo-freq", "disable", set_fact_disable },
> +	{ "core-power", "info", dump_clos_config },
> +	{ "core-power", "enable", set_clos_enable },
> +	{ "core-power", "disable", set_clos_disable },
> +	{ "core-power", "config", set_clos_config },
> +	{ "core-power", "assoc", set_clos_assoc },
> +	{ "core-power", "get-assoc", get_clos_assoc },
> +	{ NULL, NULL, NULL }
> +};
> +
> +/*
> + * parse cpuset with following syntax
> + * 1,2,4..6,8-10 and set bits in cpu_subset
> + */
> +void parse_cpu_command(char *optarg)
> +{
> +	unsigned int start, end;
> +	char *next;
> +
> +	next = optarg;
> +
> +	while (next && *next) {
> +		if (*next == '-') /* no negative cpu numbers */
> +			goto error;
> +
> +		start = strtoul(next, &next, 10);
> +
> +		if (max_target_cpus < MAX_CPUS_IN_ONE_REQ)
> +			target_cpus[max_target_cpus++] = start;
> +
> +		if (*next == '\0')
> +			break;
> +
> +		if (*next == ',') {
> +			next += 1;
> +			continue;
> +		}
> +
> +		if (*next == '-') {
> +			next += 1; /* start range */
> +		} else if (*next == '.') {
> +			next += 1;
> +			if (*next == '.')
> +				next += 1; /* start range */
> +			else
> +				goto error;
> +		}
> +
> +		end = strtoul(next, &next, 10);
> +		if (end <= start)
> +			goto error;
> +
> +		while (++start <= end) {
> +			if (max_target_cpus < MAX_CPUS_IN_ONE_REQ)
> +				target_cpus[max_target_cpus++] = start;
> +		}
> +
> +		if (*next == ',')
> +			next += 1;
> +		else if (*next != '\0')
> +			goto error;
> +	}
> +
> +#ifdef DEBUG
> +	{
> +		int i;
> +
> +		for (i = 0; i < max_target_cpus; ++i)
> +			printf("cpu [%d] in arg\n", target_cpus[i]);
> +	}
> +#endif
> +	return;
> +
> +error:
> +	fprintf(stderr, "\"--cpu %s\" malformed\n", optarg);
> +	exit(-1);
> +}
> +
> +static void parse_cmd_args(int argc, int start, char **argv)
> +{
> +	int opt;
> +	int option_index;
> +
> +	static struct option long_options[] = {
> +		{ "bucket", required_argument, 0, 'b' },
> +		{ "level", required_argument, 0, 'l' },
> +		{ "trl-type", required_argument, 0, 'r' },
> +		{ "trl", required_argument, 0, 't' },
> +		{ "help", no_argument, 0, 'h' },
> +		{ "clos", required_argument, 0, 'c' },
> +		{ "desired", required_argument, 0, 'd' },
> +		{ "epp", required_argument, 0, 'e' },
> +		{ "min", required_argument, 0, 'n' },
> +		{ "max", required_argument, 0, 'm' },
> +		{ "priority", required_argument, 0, 'p' },
> +		{ "weight", required_argument, 0, 'w' },
> +		{ 0, 0, 0, 0 }
> +	};
> +
> +	option_index = start;
> +
> +	optind = start + 1;
> +	while ((opt = getopt_long(argc, argv, "b:l:t:c:d:e:n:m:p:w:h",
> +				  long_options, &option_index)) != -1)
> {
> +		switch (opt) {
> +		case 'b':
> +			fact_bucket = atoi(optarg);
> +			break;
> +		case 'h':
> +			cmd_help = 1;
> +			break;
> +		case 'l':
> +			tdp_level = atoi(optarg);
> +			break;
> +		case 't':
> +			sscanf(optarg, "0x%llx", &fact_trl);
> +			break;
> +		case 'r':
> +			if (!strncmp(optarg, "sse", 3)) {
> +				fact_avx = 0x01;
> +			} else if (!strncmp(optarg, "avx2", 4)) {
> +				fact_avx = 0x02;
> +			} else if (!strncmp(optarg, "avx512", 4)) {
> +				fact_avx = 0x04;
> +			} else {
> +				fprintf(outf, "Invalid sse,avx
> options\n");
> +				exit(1);
> +			}
> +			break;
> +		/* CLOS related */
> +		case 'c':
> +			current_clos = atoi(optarg);
> +			printf("clos %d\n", current_clos);
> +			break;
> +		case 'd':
> +			clos_desired = atoi(optarg);
> +			break;
> +		case 'e':
> +			clos_epp = atoi(optarg);
> +			break;
> +		case 'n':
> +			clos_min = atoi(optarg);
> +			break;
> +		case 'm':
> +			clos_max = atoi(optarg);
> +			break;
> +		case 'p':
> +			clos_priority_type = atoi(optarg);
> +			break;
> +		case 'w':
> +			clos_prop_prio = atoi(optarg);
> +			break;
> +		default:
> +			printf("no match\n");
> +		}
> +	}
> +}
> +
> +static void isst_help(void)
> +{
> +	printf("perf-profile:\tAn architectural mechanism that allows
> multiple optimized \n\
> +		performance profiles per system via static and/or
> dynamic\n\
> +		adjustment of core count, workload, Tjmax, and\n\
> +		TDP, etc.\n");
> +	printf("\nCommands : For feature=perf-profile\n");
> +	printf("\tinfo\n");
> +	printf("\tget-lock-status\n");
> +	printf("\tget-config-levels\n");
> +	printf("\tget-config-version\n");
> +	printf("\tget-config-enabled\n");
> +	printf("\tget-config-current-level\n");
> +	printf("\tset-config-level\n");
> +}
> +
> +static void pbf_help(void)
> +{
> +	printf("base-freq:\tEnables users to increase guaranteed base
> frequency\n\
> +		on certain cores (high priority cores) in exchange for
> lower\n\
> +		base frequency on remaining cores (low priority
> cores).\n");
> +	printf("\tcommand : info\n");
> +	printf("\tcommand : enable\n");
> +	printf("\tcommand : disable\n");
> +}
> +
> +static void fact_help(void)
> +{
> +	printf("turbo-freq:\tEnables the ability to set different turbo
> ratio\n\
> +		limits to cores based on priority.\n");
> +	printf("\nCommand: For feature=turbo-freq\n");
> +	printf("\tcommand : info\n");
> +	printf("\tcommand : enable\n");
> +	printf("\tcommand : disable\n");
> +}
> +
> +static void core_power_help(void)
> +{
> +	printf("core-power:\tInterface that allows user to define per
> core/tile\n\
> +		priority.\n");
> +	printf("\nCommands : For feature=core-power\n");
> +	printf("\tinfo\n");
> +	printf("\tenable\n");
> +	printf("\tdisable\n");
> +	printf("\tconfig\n");
> +	printf("\tassoc\n");
> +	printf("\tget-assoc\n");
> +}
> +
> +struct process_cmd_help_struct {
> +	char *feature;
> +	void (*process_fn)(void);
> +};
> +
> +static struct process_cmd_help_struct isst_help_cmds[] = {
> +	{ "perf-profile", isst_help },
> +	{ "base-freq", pbf_help },
> +	{ "turbo-freq", fact_help },
> +	{ "core-power", core_power_help },
> +	{ NULL, NULL }
> +};
> +
> +void process_command(int argc, char **argv)
> +{
> +	int i = 0, matched = 0;
> +	char *feature = argv[optind];
> +	char *cmd = argv[optind + 1];
> +
> +	if (!feature || !cmd)
> +		return;
> +
> +	debug_printf("feature name [%s] command [%s]\n", feature, cmd);
> +	if (!strcmp(cmd, "-h") || !strcmp(cmd, "--help")) {
> +		while (isst_help_cmds[i].feature) {
> +			if (!strcmp(isst_help_cmds[i].feature,
> feature)) {
> +				isst_help_cmds[i].process_fn();
> +				exit(0);
> +			}
> +			++i;
> +		}
> +	}
> +
> +	create_cpu_map();
> +
> +	i = 0;
> +	while (isst_cmds[i].feature) {
> +		if (!strcmp(isst_cmds[i].feature, feature) &&
> +		    !strcmp(isst_cmds[i].command, cmd)) {
> +			parse_cmd_args(argc, optind + 1, argv);
> +			isst_cmds[i].process_fn();
> +			matched = 1;
> +			break;
> +		}
> +		++i;
> +	}
> +
> +	if (!matched)
> +		fprintf(stderr, "Invalid command\n");
> +}
> +
> +static void usage(void)
> +{
> +	printf("Intel(R) Speed Select Technology\n");
> +	printf("\nUsage:\n");
> +	printf("intel-speed-select [OPTIONS] FEATURE COMMAND
> COMMAND_ARGUMENTS\n");
> +	printf("\nUse this tool to enumerate and control the Intel
> Speed Select Technology features,\n");
> +	printf("\nFEATURE : [perf-profile|base-freq|turbo-freq|core-
> power]\n");
> +	printf("\nFor help on each feature, use --h|--help\n");
> +	printf("\tFor example:  intel-speed-select perf-profile -h\n");
> +
> +	printf("\nFor additional help on each command for a feature,
> use --h|--help\n");
> +	printf("\tFor example:  intel-speed-select perf-profile get-
> lock-status -h\n");
> +	printf("\t\t This will print help for the command \"get-lock-
> status\" for the feature \"perf-profile\"\n");
> +
> +	printf("\nOPTIONS\n");
> +	printf("\t[-c|--cpu] : logical cpu number\n");
> +	printf("\t\tDefault: Die scoped for all dies in the system with
> multiple dies/package\n");
> +	printf("\t\t\t Or Package scoped for all Packages when each
> package contains one die\n");
> +	printf("\t[-d|--debug] : Debug mode\n");
> +	printf("\t[-h|--help] : Print help\n");
> +	printf("\t[-i|--info] : Print platform information\n");
> +	printf("\t[-o|--out] : Output file\n");
> +	printf("\t\t\tDefault : stderr\n");
> +	printf("\t[-f|--format] : output format [json|text]. Default:
> text\n");
> +	printf("\t[-v|--version] : Print version\n");
> +
> +	printf("\nResult format\n");
> +	printf("\tResult display uses a common format for each
> command:\n");
> +	printf("\tResults are formatted in text/JSON with\n");
> +	printf("\t\tPackage, Die, CPU, and command specific
> results.\n");
> +	printf("\t\t\tFor Set commands, status is 0 for success and
> rest for failures\n");
> +	exit(1);
> +}
> +
> +static void print_version(void)
> +{
> +	fprintf(outf, "Version %s\n", version_str);
> +	fprintf(outf, "Build date %s time %s\n", __DATE__, __TIME__);
> +	exit(0);
> +}
> +
> +static void cmdline(int argc, char **argv)
> +{
> +	int opt;
> +	int option_index = 0;
> +
> +	static struct option long_options[] = {
> +		{ "cpu", required_argument, 0, 'c' },
> +		{ "debug", no_argument, 0, 'd' },
> +		{ "format", required_argument, 0, 'f' },
> +		{ "help", no_argument, 0, 'h' },
> +		{ "info", no_argument, 0, 'i' },
> +		{ "out", required_argument, 0, 'o' },
> +		{ "version", no_argument, 0, 'v' },
> +		{ 0, 0, 0, 0 }
> +	};
> +
> +	progname = argv[0];
> +	while ((opt = getopt_long_only(argc, argv, "+c:df:hio:v",
> long_options,
> +				       &option_index)) != -1) {
> +		switch (opt) {
> +		case 'c':
> +			parse_cpu_command(optarg);
> +			break;
> +		case 'd':
> +			debug_flag = 1;
> +			printf("Debug Mode ON\n");
> +			break;
> +		case 'f':
> +			if (!strncmp(optarg, "json", 4))
> +				out_format_json = 1;
> +			break;
> +		case 'h':
> +			usage();
> +			break;
> +		case 'i':
> +			isst_print_platform_information();
> +			break;
> +		case 'o':
> +			if (outf)
> +				fclose(outf);
> +			outf = fopen_or_exit(optarg, "w");
> +			break;
> +		case 'v':
> +			print_version();
> +			break;
> +		default:
> +			usage();
> +		}
> +	}
> +
> +	if (geteuid() != 0) {
> +		fprintf(stderr, "Must run as root\n");
> +		exit(0);
> +	}
> +
> +	if (optind > (argc - 2)) {
> +		fprintf(stderr, "Feature name and|or command not
> specified\n");
> +		exit(0);
> +	}
> +	update_cpu_model();
> +	printf("Intel(R) Speed Select Technology\n");
> +	printf("Executing on CPU model:%d[0x%x]\n", cpu_model,
> cpu_model);
> +	set_max_cpu_num();
> +	set_cpu_present_cpu_mask();
> +	set_cpu_target_cpu_mask();
> +	isst_fill_platform_info();
> +	if (isst_platform_info.api_version > supported_api_ver) {
> +		printf("Incompatible API versions; Upgrade of tool is
> required\n");
> +		exit(0);
> +	}
> +
> +	process_command(argc, argv);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	outf = stderr;
> +	cmdline(argc, argv);
> +	return 0;
> +}
> diff --git a/tools/power/x86/intel-speed-select/isst-core.c
> b/tools/power/x86/intel-speed-select/isst-core.c
> new file mode 100644
> index 000000000000..8de4ac39a008
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/isst-core.c
> @@ -0,0 +1,721 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Speed Select -- Enumerate and control features
> + * Copyright (c) 2019 Intel Corporation.
> + */
> +
> +#include "isst.h"
> +
> +int isst_get_ctdp_levels(int cpu, struct isst_pkg_ctdp *pkg_dev)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_GET_LEVELS_INFO, 0, 0,
> &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_GET_LEVELS_INFO resp:%x\n",
> cpu, resp);
> +
> +	pkg_dev->version = resp & 0xff;
> +	pkg_dev->levels = (resp >> 8) & 0xff;
> +	pkg_dev->current_level = (resp >> 16) & 0xff;
> +	pkg_dev->locked = !!(resp & BIT(24));
> +	pkg_dev->enabled = !!(resp & BIT(31));
> +
> +	return 0;
> +}
> +
> +int isst_get_ctdp_control(int cpu, int config_index,
> +			  struct isst_pkg_ctdp_level_info *ctdp_level)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_GET_TDP_CONTROL, 0,
> +				     config_index, &resp);
> +	if (ret)
> +		return ret;
> +
> +	ctdp_level->fact_support = resp & BIT(0);
> +	ctdp_level->pbf_support = !!(resp & BIT(1));
> +	ctdp_level->fact_enabled = !!(resp & BIT(16));
> +	ctdp_level->pbf_enabled = !!(resp & BIT(17));
> +
> +	debug_printf(
> +		"cpu:%d CONFIG_TDP_GET_TDP_CONTROL resp:%x
> fact_support:%d pbf_support: %d fact_enabled:%d pbf_enabled:%d\n",
> +		cpu, resp, ctdp_level->fact_support, ctdp_level-
> >pbf_support,
> +		ctdp_level->fact_enabled, ctdp_level->pbf_enabled);
> +
> +	return 0;
> +}
> +
> +int isst_get_tdp_info(int cpu, int config_index,
> +		      struct isst_pkg_ctdp_level_info *ctdp_level)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> CONFIG_TDP_GET_TDP_INFO,
> +				     0, config_index, &resp);
> +	if (ret)
> +		return ret;
> +
> +	ctdp_level->pkg_tdp = resp & GENMASK(14, 0);
> +	ctdp_level->tdp_ratio = (resp & GENMASK(23, 16)) >> 16;
> +
> +	debug_printf(
> +		"cpu:%d ctdp:%d CONFIG_TDP_GET_TDP_INFO resp:%x
> tdp_ratio:%d pkg_tdp:%d\n",
> +		cpu, config_index, resp, ctdp_level->tdp_ratio,
> +		ctdp_level->pkg_tdp);
> +	return 0;
> +}
> +
> +int isst_get_pwr_info(int cpu, int config_index,
> +		      struct isst_pkg_ctdp_level_info *ctdp_level)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> CONFIG_TDP_GET_PWR_INFO,
> +				     0, config_index, &resp);
> +	if (ret)
> +		return ret;
> +
> +	ctdp_level->pkg_max_power = resp & GENMASK(14, 0);
> +	ctdp_level->pkg_min_power = (resp & GENMASK(30, 16)) >> 16;
> +
> +	debug_printf(
> +		"cpu:%d ctdp:%d CONFIG_TDP_GET_PWR_INFO resp:%x
> pkg_max_power:%d pkg_min_power:%d\n",
> +		cpu, config_index, resp, ctdp_level->pkg_max_power,
> +		ctdp_level->pkg_min_power);
> +
> +	return 0;
> +}
> +
> +int isst_get_tjmax_info(int cpu, int config_index,
> +			struct isst_pkg_ctdp_level_info *ctdp_level)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> CONFIG_TDP_GET_TJMAX_INFO,
> +				     0, config_index, &resp);
> +	if (ret)
> +		return ret;
> +
> +	ctdp_level->t_proc_hot = resp & GENMASK(7, 0);
> +
> +	debug_printf(
> +		"cpu:%d ctdp:%d CONFIG_TDP_GET_TJMAX_INFO resp:%x
> t_proc_hot:%d\n",
> +		cpu, config_index, resp, ctdp_level->t_proc_hot);
> +
> +	return 0;
> +}
> +
> +int isst_get_coremask_info(int cpu, int config_index,
> +			   struct isst_pkg_ctdp_level_info *ctdp_level)
> +{
> +	unsigned int resp;
> +	int i, ret;
> +
> +	ctdp_level->cpu_count = 0;
> +	for (i = 0; i < 2; ++i) {
> +		unsigned long long mask;
> +		int cpu_count = 0;
> +
> +		ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +					     CONFIG_TDP_GET_CORE_MASK,
> 0,
> +					     (i << 8) | config_index,
> &resp);
> +		if (ret)
> +			return ret;
> +
> +		debug_printf(
> +			"cpu:%d ctdp:%d mask:%d
> CONFIG_TDP_GET_CORE_MASK resp:%x\n",
> +			cpu, config_index, i, resp);
> +
> +		mask = (unsigned long long)resp << (32 * i);
> +		set_cpu_mask_from_punit_coremask(cpu, mask,
> +						 ctdp_level-
> >core_cpumask_size,
> +						 ctdp_level-
> >core_cpumask,
> +						 &cpu_count);
> +		ctdp_level->cpu_count += cpu_count;
> +		debug_printf("cpu:%d ctdp:%d mask:%d cpu count:%d\n",
> cpu,
> +			     config_index, i, ctdp_level->cpu_count);
> +	}
> +
> +	return 0;
> +}
> +
> +int isst_get_get_trl(int cpu, int level, int avx_level, int *trl)
> +{
> +	unsigned int req, resp;
> +	int ret;
> +
> +	req = level | (avx_level << 16);
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_GET_TURBO_LIMIT_RATIOS,
> 0, req,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf(
> +		"cpu:%d CONFIG_TDP_GET_TURBO_LIMIT_RATIOS req:%x
> resp:%x\n",
> +		cpu, req, resp);
> +
> +	trl[0] = resp & GENMASK(7, 0);
> +	trl[1] = (resp & GENMASK(15, 8)) >> 8;
> +	trl[2] = (resp & GENMASK(23, 16)) >> 16;
> +	trl[3] = (resp & GENMASK(31, 24)) >> 24;
> +
> +	req = level | BIT(8) | (avx_level << 16);
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_GET_TURBO_LIMIT_RATIOS,
> 0, req,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_GET_TURBO_LIMIT req:%x
> resp:%x\n", cpu,
> +		     req, resp);
> +
> +	trl[4] = resp & GENMASK(7, 0);
> +	trl[5] = (resp & GENMASK(15, 8)) >> 8;
> +	trl[6] = (resp & GENMASK(23, 16)) >> 16;
> +	trl[7] = (resp & GENMASK(31, 24)) >> 24;
> +
> +	return 0;
> +}
> +
> +int isst_set_tdp_level_msr(int cpu, int tdp_level)
> +{
> +	int ret;
> +
> +	debug_printf("cpu: tdp_level via MSR %d\n", cpu, tdp_level);
> +
> +	if (isst_get_config_tdp_lock_status(cpu)) {
> +		debug_printf("cpu: tdp_locked %d\n", cpu);
> +		return -1;
> +	}
> +
> +	if (tdp_level > 2)
> +		return -1; /* invalid value */
> +
> +	ret = isst_send_msr_command(cpu, 0x64b, 1,
> +				    (unsigned long long *)&tdp_level);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu: tdp_level via MSR successful %d\n", cpu,
> tdp_level);
> +
> +	return 0;
> +}
> +
> +int isst_set_tdp_level(int cpu, int tdp_level)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> CONFIG_TDP_SET_LEVEL, 0,
> +				     tdp_level, &resp);
> +	if (ret)
> +		return isst_set_tdp_level_msr(cpu, tdp_level);
> +
> +	return 0;
> +}
> +
> +int isst_get_pbf_info(int cpu, int level, struct isst_pbf_info
> *pbf_info)
> +{
> +	unsigned int req, resp;
> +	int i, ret;
> +
> +	pbf_info->core_cpumask_size = alloc_cpu_set(&pbf_info-
> >core_cpumask);
> +
> +	for (i = 0; i < 2; ++i) {
> +		unsigned long long mask;
> +		int count;
> +
> +		ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +					     CONFIG_TDP_PBF_GET_CORE_MA
> SK_INFO,
> +					     0, (i << 8) | level,
> &resp);
> +		if (ret)
> +			return ret;
> +
> +		debug_printf(
> +			"cpu:%d CONFIG_TDP_PBF_GET_CORE_MASK_INFO
> resp:%x\n",
> +			cpu, resp);
> +
> +		mask = (unsigned long long)resp << (32 * i);
> +		set_cpu_mask_from_punit_coremask(cpu, mask,
> +						 pbf_info-
> >core_cpumask_size,
> +						 pbf_info-
> >core_cpumask,
> +						 &count);
> +	}
> +
> +	req = level;
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_PBF_GET_P1HI_P1LO_INFO,
> 0, req,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_PBF_GET_P1HI_P1LO_INFO
> resp:%x\n", cpu,
> +		     resp);
> +
> +	pbf_info->p1_low = resp & 0xff;
> +	pbf_info->p1_high = (resp & GENMASK(15, 8)) >> 8;
> +
> +	req = level;
> +	ret = isst_send_mbox_command(
> +		cpu, CONFIG_TDP, CONFIG_TDP_PBF_GET_TDP_INFO, 0, req,
> &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_PBF_GET_TDP_INFO resp:%x\n",
> cpu, resp);
> +
> +	pbf_info->tdp = resp & 0xffff;
> +
> +	req = level;
> +	ret = isst_send_mbox_command(
> +		cpu, CONFIG_TDP, CONFIG_TDP_PBF_GET_TJ_MAX_INFO, 0,
> req, &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_PBF_GET_TJ_MAX_INFO resp:%x\n",
> cpu,
> +		     resp);
> +	pbf_info->t_control = (resp >> 8) & 0xff;
> +	pbf_info->t_prochot = resp & 0xff;
> +
> +	return 0;
> +}
> +
> +void isst_get_pbf_info_complete(struct isst_pbf_info *pbf_info)
> +{
> +	free_cpu_set(pbf_info->core_cpumask);
> +}
> +
> +int isst_set_pbf_fact_status(int cpu, int pbf, int enable)
> +{
> +	struct isst_pkg_ctdp pkg_dev;
> +	struct isst_pkg_ctdp_level_info ctdp_level;
> +	int current_level;
> +	unsigned int req = 0, resp;
> +	int ret;
> +
> +	ret = isst_get_ctdp_levels(cpu, &pkg_dev);
> +	if (ret)
> +		return ret;
> +
> +	current_level = pkg_dev.current_level;
> +
> +	ret = isst_get_ctdp_control(cpu, current_level, &ctdp_level);
> +	if (ret)
> +		return ret;
> +
> +	if (pbf) {
> +		if (ctdp_level.fact_enabled)
> +			req = BIT(16);
> +
> +		if (enable)
> +			req |= BIT(17);
> +		else
> +			req &= ~BIT(17);
> +	} else {
> +		if (ctdp_level.pbf_enabled)
> +			req = BIT(17);
> +
> +		if (enable)
> +			req |= BIT(16);
> +		else
> +			req &= ~BIT(16);
> +	}
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_SET_TDP_CONTROL, 0,
> req, &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_SET_TDP_CONTROL pbf/fact:%d
> req:%x\n",
> +		     cpu, pbf, req);
> +
> +	return 0;
> +}
> +
> +int isst_get_fact_bucket_info(int cpu, int level,
> +			      struct isst_fact_bucket_info
> *bucket_info)
> +{
> +	unsigned int resp;
> +	int i, k, ret;
> +
> +	for (i = 0; i < 2; ++i) {
> +		int j;
> +
> +		ret = isst_send_mbox_command(
> +			cpu, CONFIG_TDP,
> +			CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_NUMCORES, 0,
> +			(i << 8) | level, &resp);
> +		if (ret)
> +			return ret;
> +
> +		debug_printf(
> +			"cpu:%d
> CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_NUMCORES index:%d level:%d
> resp:%x\n",
> +			cpu, i, level, resp);
> +
> +		for (j = 0; j < 4; ++j) {
> +			bucket_info[j + (i *
> 4)].high_priority_cores_count =
> +				(resp >> (j * 8)) & 0xff;
> +		}
> +	}
> +
> +	for (k = 0; k < 3; ++k) {
> +		for (i = 0; i < 2; ++i) {
> +			int j;
> +
> +			ret = isst_send_mbox_command(
> +				cpu, CONFIG_TDP,
> +				CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_RATI
> OS, 0,
> +				(k << 16) | (i << 8) | level, &resp);
> +			if (ret)
> +				return ret;
> +
> +			debug_printf(
> +				"cpu:%d
> CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_RATIOS index:%d level:%d avx:%d
> resp:%x\n",
> +				cpu, i, level, k, resp);
> +
> +			for (j = 0; j < 4; ++j) {
> +				switch (k) {
> +				case 0:
> +					bucket_info[j + (i *
> 4)].sse_trl =
> +						(resp >> (j * 8)) &
> 0xff;
> +					break;
> +				case 1:
> +					bucket_info[j + (i *
> 4)].avx_trl =
> +						(resp >> (j * 8)) &
> 0xff;
> +					break;
> +				case 2:
> +					bucket_info[j + (i *
> 4)].avx512_trl =
> +						(resp >> (j * 8)) &
> 0xff;
> +					break;
> +				default:
> +					break;
> +				}
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int isst_get_fact_info(int cpu, int level, struct isst_fact_info
> *fact_info)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
> +				     CONFIG_TDP_GET_FACT_LP_CLIPPING_RA
> TIO, 0,
> +				     level, &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CONFIG_TDP_GET_FACT_LP_CLIPPING_RATIO
> resp:%x\n",
> +		     cpu, resp);
> +
> +	fact_info->lp_clipping_ratio_license_sse = resp & 0xff;
> +	fact_info->lp_clipping_ratio_license_avx2 = (resp >> 8) & 0xff;
> +	fact_info->lp_clipping_ratio_license_avx512 = (resp >> 16) &
> 0xff;
> +
> +	ret = isst_get_fact_bucket_info(cpu, level, fact_info-
> >bucket_info);
> +
> +	return ret;
> +}
> +
> +int isst_set_trl(int cpu, unsigned long long trl)
> +{
> +	int ret;
> +
> +	if (!trl)
> +		trl = 0xFFFFFFFFFFFFFFFFULL;
> +
> +	ret = isst_send_msr_command(cpu, 0x1AD, 1, &trl);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +int isst_set_trl_from_current_tdp(int cpu, unsigned long long trl)
> +{
> +	unsigned long long msr_trl;
> +	int ret;
> +
> +	if (trl) {
> +		msr_trl = trl;
> +	} else {
> +		struct isst_pkg_ctdp pkg_dev;
> +		int trl[8];
> +		int i;
> +
> +		ret = isst_get_ctdp_levels(cpu, &pkg_dev);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_get_trl(cpu, pkg_dev.current_level, 0,
> trl);
> +		if (ret)
> +			return ret;
> +
> +		msr_trl = 0;
> +		for (i = 0; i < 8; ++i) {
> +			unsigned long long _trl = trl[i];
> +
> +			msr_trl |= (_trl << (i * 8));
> +		}
> +	}
> +	ret = isst_send_msr_command(cpu, 0x1AD, 1, &msr_trl);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/* Return 1 if locked */
> +int isst_get_config_tdp_lock_status(int cpu)
> +{
> +	unsigned long long tdp_control = 0;
> +	int ret;
> +
> +	ret = isst_send_msr_command(cpu, 0x64b, 0, &tdp_control);
> +	if (ret)
> +		return ret;
> +
> +	ret = !!(tdp_control & BIT(31));
> +
> +	return ret;
> +}
> +
> +void isst_get_process_ctdp_complete(int cpu, struct isst_pkg_ctdp
> *pkg_dev)
> +{
> +	int i;
> +
> +	if (!pkg_dev->processed)
> +		return;
> +
> +	for (i = 0; i < pkg_dev->levels; ++i) {
> +		struct isst_pkg_ctdp_level_info *ctdp_level;
> +
> +		ctdp_level = &pkg_dev->ctdp_level[i];
> +		if (ctdp_level->pbf_support)
> +			free_cpu_set(ctdp_level-
> >pbf_info.core_cpumask);
> +		free_cpu_set(ctdp_level->core_cpumask);
> +	}
> +}
> +
> +int isst_get_process_ctdp(int cpu, int tdp_level, struct
> isst_pkg_ctdp *pkg_dev)
> +{
> +	int i, ret;
> +
> +	if (pkg_dev->processed)
> +		return 0;
> +
> +	ret = isst_get_ctdp_levels(cpu, pkg_dev);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu: %d ctdp enable:%d current level: %d
> levels:%d\n",
> +		     cpu, pkg_dev->enabled, pkg_dev->current_level,
> +		     pkg_dev->levels);
> +
> +	for (i = 0; i <= pkg_dev->levels; ++i) {
> +		struct isst_pkg_ctdp_level_info *ctdp_level;
> +
> +		if (tdp_level != 0xff && i != tdp_level)
> +			continue;
> +
> +		debug_printf("cpu:%d Get Information for TDP
> level:%d\n", cpu,
> +			     i);
> +		ctdp_level = &pkg_dev->ctdp_level[i];
> +
> +		ctdp_level->processed = 1;
> +		ctdp_level->level = i;
> +		ctdp_level->control_cpu = cpu;
> +		ctdp_level->pkg_id = get_physical_package_id(cpu);
> +		ctdp_level->die_id = get_physical_die_id(cpu);
> +
> +		ret = isst_get_ctdp_control(cpu, i, ctdp_level);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_tdp_info(cpu, i, ctdp_level);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_pwr_info(cpu, i, ctdp_level);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_tjmax_info(cpu, i, ctdp_level);
> +		if (ret)
> +			return ret;
> +
> +		ctdp_level->core_cpumask_size =
> +			alloc_cpu_set(&ctdp_level->core_cpumask);
> +		ret = isst_get_coremask_info(cpu, i, ctdp_level);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_get_trl(cpu, i, 0,
> +				       ctdp_level-
> >trl_sse_active_cores);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_get_trl(cpu, i, 1,
> +				       ctdp_level-
> >trl_avx_active_cores);
> +		if (ret)
> +			return ret;
> +
> +		ret = isst_get_get_trl(cpu, i, 2,
> +				       ctdp_level-
> >trl_avx_512_active_cores);
> +		if (ret)
> +			return ret;
> +
> +		if (ctdp_level->pbf_support) {
> +			ret = isst_get_pbf_info(cpu, i, &ctdp_level-
> >pbf_info);
> +			if (!ret)
> +				ctdp_level->pbf_found = 1;
> +		}
> +
> +		if (ctdp_level->fact_support) {
> +			ret = isst_get_fact_info(cpu, i,
> +						 &ctdp_level-
> >fact_info);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	pkg_dev->processed = 1;
> +
> +	return 0;
> +}
> +
> +int isst_pm_qos_config(int cpu, int enable_clos, int priority_type)
> +{
> +	unsigned int req, resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS,
> CLOS_PM_QOS_CONFIG, 0, 0,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CLOS_PM_QOS_CONFIG resp:%x\n", cpu, resp);
> +
> +	req = resp;
> +
> +	if (enable_clos)
> +		req = req | BIT(1);
> +	else
> +		req = req & ~BIT(1);
> +
> +	if (priority_type)
> +		req = req | BIT(2);
> +	else
> +		req = req & ~BIT(2);
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS,
> CLOS_PM_QOS_CONFIG,
> +				     BIT(MBOX_CMD_WRITE_BIT), req,
> &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CLOS_PM_QOS_CONFIG priority type:%d
> req:%x\n", cpu,
> +		     priority_type, req);
> +
> +	return 0;
> +}
> +
> +int isst_pm_get_clos(int cpu, int clos, struct isst_clos_config
> *clos_config)
> +{
> +	unsigned int resp;
> +	int ret;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS, CLOS_PM_CLOS,
> clos, 0,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	clos_config->pkg_id = get_physical_package_id(cpu);
> +	clos_config->die_id = get_physical_die_id(cpu);
> +
> +	clos_config->epp = resp & 0x0f;
> +	clos_config->clos_prop_prio = (resp >> 4) & 0x0f;
> +	clos_config->clos_min = (resp >> 8) & 0xff;
> +	clos_config->clos_max = (resp >> 16) & 0xff;
> +	clos_config->clos_desired = (resp >> 24) & 0xff;
> +
> +	return 0;
> +}
> +
> +int isst_set_clos(int cpu, int clos, struct isst_clos_config
> *clos_config)
> +{
> +	unsigned int req, resp;
> +	unsigned int param;
> +	int ret;
> +
> +	req = clos_config->epp & 0x0f;
> +	req |= (clos_config->clos_prop_prio & 0x0f) << 4;
> +	req |= (clos_config->clos_min & 0xff) << 8;
> +	req |= (clos_config->clos_max & 0xff) << 16;
> +	req |= (clos_config->clos_desired & 0xff) << 24;
> +
> +	param = BIT(MBOX_CMD_WRITE_BIT) | clos;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS, CLOS_PM_CLOS,
> param, req,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CLOS_PM_CLOS param:%x req:%x\n", cpu,
> param, req);
> +
> +	return 0;
> +}
> +
> +int isst_clos_get_assoc_status(int cpu, int *clos_id)
> +{
> +	unsigned int resp;
> +	unsigned int param;
> +	int core_id, ret;
> +
> +	core_id = find_phy_core_num(cpu);
> +	param = core_id;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS, CLOS_PQR_ASSOC,
> param, 0,
> +				     &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CLOS_PQR_ASSOC param:%x resp:%x\n", cpu,
> param,
> +		     resp);
> +	*clos_id = (resp >> 16) & 0x03;
> +
> +	return 0;
> +}
> +
> +int isst_clos_associate(int cpu, int clos_id)
> +{
> +	unsigned int req, resp;
> +	unsigned int param;
> +	int core_id, ret;
> +
> +	req = (clos_id & 0x03) << 16;
> +	core_id = find_phy_core_num(cpu);
> +	param = BIT(MBOX_CMD_WRITE_BIT) | core_id;
> +
> +	ret = isst_send_mbox_command(cpu, CONFIG_CLOS, CLOS_PQR_ASSOC,
> param,
> +				     req, &resp);
> +	if (ret)
> +		return ret;
> +
> +	debug_printf("cpu:%d CLOS_PQR_ASSOC param:%x req:%x\n", cpu,
> param,
> +		     req);
> +
> +	return 0;
> +}
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c
> b/tools/power/x86/intel-speed-select/isst-display.c
> new file mode 100644
> index 000000000000..f368b8323742
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel dynamic_speed_select -- Enumerate and control features
> + * Copyright (c) 2019 Intel Corporation.
> + */
> +
> +#include "isst.h"
> +
> +#define DISP_FREQ_MULTIPLIER 100000
> +
> +static void printcpumask(int str_len, char *str, int mask_size,
> +			 cpu_set_t *cpu_mask)
> +{
> +	int i, max_cpus = get_topo_max_cpus();
> +	unsigned int *mask;
> +	int size, index, curr_index;
> +
> +	size = max_cpus / (sizeof(unsigned int) * 8);
> +	if (max_cpus % (sizeof(unsigned int) * 8))
> +		size++;
> +
> +	mask = calloc(size, sizeof(unsigned int));
> +	if (!mask)
> +		return;
> +
> +	for (i = 0; i < max_cpus; ++i) {
> +		int mask_index, bit_index;
> +
> +		if (!CPU_ISSET_S(i, mask_size, cpu_mask))
> +			continue;
> +
> +		mask_index = i / (sizeof(unsigned int) * 8);
> +		bit_index = i % (sizeof(unsigned int) * 8);
> +		mask[mask_index] |= BIT(bit_index);
> +	}
> +
> +	curr_index = 0;
> +	for (i = size - 1; i >= 0; --i) {
> +		index = snprintf(&str[curr_index], str_len -
> curr_index, "%08x",
> +				 mask[i]);
> +		curr_index += index;
> +		if (i) {
> +			strncat(&str[curr_index], ",", str_len -
> curr_index);
> +			curr_index++;
> +		}
> +	}
> +
> +	free(mask);
> +}
> +
> +static void format_and_print_txt(FILE *outf, int level, char
> *header,
> +				 char *value)
> +{
> +	char *spaces = "  ";
> +	static char delimiters[256];
> +	int i, j = 0;
> +
> +	if (!level)
> +		return;
> +
> +	if (level == 1) {
> +		strcpy(delimiters, " ");
> +	} else {
> +		for (i = 0; i < level - 1; ++i)
> +			j += snprintf(&delimiters[j],
> sizeof(delimiters) - j,
> +				      "%s", spaces);
> +	}
> +
> +	if (header && value) {
> +		fprintf(outf, "%s", delimiters);
> +		fprintf(outf, "%s:%s\n", header, value);
> +	} else if (header) {
> +		fprintf(outf, "%s", delimiters);
> +		fprintf(outf, "%s\n", header);
> +	}
> +}
> +
> +static int last_level;
> +static void format_and_print(FILE *outf, int level, char *header,
> char *value)
> +{
> +	char *spaces = "  ";
> +	static char delimiters[256];
> +	int i;
> +
> +	if (!out_format_is_json()) {
> +		format_and_print_txt(outf, level, header, value);
> +		return;
> +	}
> +
> +	if (level == 0) {
> +		if (header)
> +			fprintf(outf, "{");
> +		else
> +			fprintf(outf, "\n}\n");
> +
> +	} else {
> +		int j = 0;
> +
> +		for (i = 0; i < level; ++i)
> +			j += snprintf(&delimiters[j],
> sizeof(delimiters) - j,
> +				      "%s", spaces);
> +
> +		if (last_level == level)
> +			fprintf(outf, ",\n");
> +
> +		if (value) {
> +			if (last_level != level)
> +				fprintf(outf, "\n");
> +
> +			fprintf(outf, "%s\"%s\": ", delimiters,
> header);
> +			fprintf(outf, "\"%s\"", value);
> +		} else {
> +			for (i = last_level - 1; i >= level; --i) {
> +				int k = 0;
> +
> +				for (j = i; j > 0; --j)
> +					k += snprintf(&delimiters[k],
> +						      sizeof(delimiters
> ) - k,
> +						      "%s", spaces);
> +				if (i == level && header)
> +					fprintf(outf, "\n%s},",
> delimiters);
> +				else
> +					fprintf(outf, "\n%s}",
> delimiters);
> +			}
> +			if (abs(last_level - level) < 3)
> +				fprintf(outf, "\n");
> +			if (header)
> +				fprintf(outf, "%s\"%s\": {",
> delimiters,
> +					header);
> +		}
> +	}
> +
> +	last_level = level;
> +}
> +
> +static void print_packag_info(int cpu, FILE *outf)
> +{
> +	char header[256];
> +
> +	snprintf(header, sizeof(header), "package-%d",
> +		 get_physical_package_id(cpu));
> +	format_and_print(outf, 1, header, NULL);
> +	snprintf(header, sizeof(header), "die-%d",
> get_physical_die_id(cpu));
> +	format_and_print(outf, 2, header, NULL);
> +	snprintf(header, sizeof(header), "cpu-%d", cpu);
> +	format_and_print(outf, 3, header, NULL);
> +}
> +
> +static void _isst_pbf_display_information(int cpu, FILE *outf, int
> level,
> +					  struct isst_pbf_info
> *pbf_info,
> +					  int disp_level)
> +{
> +	char header[256];
> +	char value[256];
> +
> +	snprintf(header, sizeof(header), "speed-select-base-freq");
> +	format_and_print(outf, disp_level, header, NULL);
> +
> +	snprintf(header, sizeof(header), "high-priority-base-
> frequency(KHz)");
> +	snprintf(value, sizeof(value), "%d",
> +		 pbf_info->p1_high * DISP_FREQ_MULTIPLIER);
> +	format_and_print(outf, disp_level + 1, header, value);
> +
> +	snprintf(header, sizeof(header), "high-priority-cpu-mask");
> +	printcpumask(sizeof(value), value, pbf_info->core_cpumask_size,
> +		     pbf_info->core_cpumask);
> +	format_and_print(outf, disp_level + 1, header, value);
> +
> +	snprintf(header, sizeof(header), "low-priority-base-
> frequency(KHz)");
> +	snprintf(value, sizeof(value), "%d",
> +		 pbf_info->p1_low * DISP_FREQ_MULTIPLIER);
> +	format_and_print(outf, disp_level + 1, header, value);
> +
> +	snprintf(header, sizeof(header), "tjunction-temperature(C)");
> +	snprintf(value, sizeof(value), "%d", pbf_info->t_prochot);
> +	format_and_print(outf, disp_level + 1, header, value);
> +
> +	snprintf(header, sizeof(header), "thermal-design-power(W)");
> +	snprintf(value, sizeof(value), "%d", pbf_info->tdp);
> +	format_and_print(outf, disp_level + 1, header, value);
> +}
> +
> +static void _isst_fact_display_information(int cpu, FILE *outf, int
> level,
> +					   int fact_bucket, int
> fact_avx,
> +					   struct isst_fact_info
> *fact_info,
> +					   int base_level)
> +{
> +	struct isst_fact_bucket_info *bucket_info = fact_info-
> >bucket_info;
> +	char header[256];
> +	char value[256];
> +	int j;
> +
> +	snprintf(header, sizeof(header), "speed-select-turbo-freq");
> +	format_and_print(outf, base_level, header, NULL);
> +	for (j = 0; j < ISST_FACT_MAX_BUCKETS; ++j) {
> +		if (fact_bucket != 0xff && fact_bucket != j)
> +			continue;
> +
> +		if (!bucket_info[j].high_priority_cores_count)
> +			break;
> +
> +		snprintf(header, sizeof(header), "bucket-%d", j);
> +		format_and_print(outf, base_level + 1, header, NULL);
> +
> +		snprintf(header, sizeof(header), "high-priority-cores-
> count");
> +		snprintf(value, sizeof(value), "%d",
> +			 bucket_info[j].high_priority_cores_count);
> +		format_and_print(outf, base_level + 2, header, value);
> +
> +		if (fact_avx & 0x01) {
> +			snprintf(header, sizeof(header),
> +				 "high-priority-max-frequency(KHz)");
> +			snprintf(value, sizeof(value), "%d",
> +				 bucket_info[j].sse_trl *
> DISP_FREQ_MULTIPLIER);
> +			format_and_print(outf, base_level + 2, header,
> value);
> +		}
> +
> +		if (fact_avx & 0x02) {
> +			snprintf(header, sizeof(header),
> +				 "high-priority-max-avx2-
> frequency(KHz)");
> +			snprintf(value, sizeof(value), "%d",
> +				 bucket_info[j].avx_trl *
> DISP_FREQ_MULTIPLIER);
> +			format_and_print(outf, base_level + 2, header,
> value);
> +		}
> +
> +		if (fact_avx & 0x04) {
> +			snprintf(header, sizeof(header),
> +				 "high-priority-max-avx512-
> frequency(KHz)");
> +			snprintf(value, sizeof(value), "%d",
> +				 bucket_info[j].avx512_trl *
> +					 DISP_FREQ_MULTIPLIER);
> +			format_and_print(outf, base_level + 2, header,
> value);
> +		}
> +	}
> +	snprintf(header, sizeof(header),
> +		 "speed-select-turbo-freq-clip-frequencies");
> +	format_and_print(outf, base_level + 1, header, NULL);
> +	snprintf(header, sizeof(header), "low-priority-max-
> frequency(KHz)");
> +	snprintf(value, sizeof(value), "%d",
> +		 fact_info->lp_clipping_ratio_license_sse *
> +			 DISP_FREQ_MULTIPLIER);
> +	format_and_print(outf, base_level + 2, header, value);
> +	snprintf(header, sizeof(header),
> +		 "low-priority-max-avx2-frequency(KHz)");
> +	snprintf(value, sizeof(value), "%d",
> +		 fact_info->lp_clipping_ratio_license_avx2 *
> +			 DISP_FREQ_MULTIPLIER);
> +	format_and_print(outf, base_level + 2, header, value);
> +	snprintf(header, sizeof(header),
> +		 "low-priority-max-avx512-frequency(KHz)");
> +	snprintf(value, sizeof(value), "%d",
> +		 fact_info->lp_clipping_ratio_license_avx512 *
> +			 DISP_FREQ_MULTIPLIER);
> +	format_and_print(outf, base_level + 2, header, value);
> +}
> +
> +void isst_ctdp_display_information(int cpu, FILE *outf, int
> tdp_level,
> +				   struct isst_pkg_ctdp *pkg_dev)
> +{
> +	char header[256];
> +	char value[256];
> +	int i, base_level = 1;
> +
> +	print_packag_info(cpu, outf);
> +
> +	for (i = 0; i <= pkg_dev->levels; ++i) {
> +		struct isst_pkg_ctdp_level_info *ctdp_level;
> +		int j;
> +
> +		ctdp_level = &pkg_dev->ctdp_level[i];
> +		if (!ctdp_level->processed)
> +			continue;
> +
> +		snprintf(header, sizeof(header), "perf-profile-level-
> %d",
> +			 ctdp_level->level);
> +		format_and_print(outf, base_level + 3, header, NULL);
> +
> +		snprintf(header, sizeof(header), "cpu-count");
> +		j = get_cpu_count(get_physical_die_id(cpu),
> +				  get_physical_die_id(cpu));
> +		snprintf(value, sizeof(value), "%d", j);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "enable-cpu-mask");
> +		printcpumask(sizeof(value), value,
> +			     ctdp_level->core_cpumask_size,
> +			     ctdp_level->core_cpumask);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "thermal-design-power-
> ratio");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >tdp_ratio);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "base-
> frequency(KHz)");
> +		snprintf(value, sizeof(value), "%d",
> +			 ctdp_level->tdp_ratio * DISP_FREQ_MULTIPLIER);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header),
> +			 "speed-select-turbo-freq-support");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >fact_support);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header),
> +			 "speed-select-base-freq-support");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >pbf_support);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header),
> +			 "speed-select-base-freq-enabled");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >pbf_enabled);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header),
> +			 "speed-select-turbo-freq-enabled");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >fact_enabled);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "thermal-design-
> power(W)");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >pkg_tdp);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "tjunction-max(C)");
> +		snprintf(value, sizeof(value), "%d", ctdp_level-
> >t_proc_hot);
> +		format_and_print(outf, base_level + 4, header, value);
> +
> +		snprintf(header, sizeof(header), "turbo-ratio-limits-
> sse");
> +		format_and_print(outf, base_level + 4, header, NULL);
> +		for (j = 0; j < 8; ++j) {
> +			snprintf(header, sizeof(header), "bucket-%d",
> j);
> +			format_and_print(outf, base_level + 5, header,
> NULL);
> +
> +			snprintf(header, sizeof(header), "core-count");
> +			snprintf(value, sizeof(value), "%d", j);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +
> +			snprintf(header, sizeof(header), "turbo-
> ratio");
> +			snprintf(value, sizeof(value), "%d",
> +				 ctdp_level->trl_sse_active_cores[j]);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +		}
> +		snprintf(header, sizeof(header), "turbo-ratio-limits-
> avx");
> +		format_and_print(outf, base_level + 4, header, NULL);
> +		for (j = 0; j < 8; ++j) {
> +			snprintf(header, sizeof(header), "bucket-%d",
> j);
> +			format_and_print(outf, base_level + 5, header,
> NULL);
> +
> +			snprintf(header, sizeof(header), "core-count");
> +			snprintf(value, sizeof(value), "%d", j);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +
> +			snprintf(header, sizeof(header), "turbo-
> ratio");
> +			snprintf(value, sizeof(value), "%d",
> +				 ctdp_level->trl_avx_active_cores[j]);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +		}
> +
> +		snprintf(header, sizeof(header), "turbo-ratio-limits-
> avx512");
> +		format_and_print(outf, base_level + 4, header, NULL);
> +		for (j = 0; j < 8; ++j) {
> +			snprintf(header, sizeof(header), "bucket-%d",
> j);
> +			format_and_print(outf, base_level + 5, header,
> NULL);
> +
> +			snprintf(header, sizeof(header), "core-count");
> +			snprintf(value, sizeof(value), "%d", j);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +
> +			snprintf(header, sizeof(header), "turbo-
> ratio");
> +			snprintf(value, sizeof(value), "%d",
> +				 ctdp_level-
> >trl_avx_512_active_cores[j]);
> +			format_and_print(outf, base_level + 6, header,
> value);
> +		}
> +		if (ctdp_level->pbf_support)
> +			_isst_pbf_display_information(cpu, outf, i,
> +						      &ctdp_level-
> >pbf_info,
> +						      base_level + 4);
> +		if (ctdp_level->fact_support)
> +			_isst_fact_display_information(cpu, outf, i,
> 0xff, 0xff,
> +						       &ctdp_level-
> >fact_info,
> +						       base_level + 4);
> +	}
> +
> +	format_and_print(outf, 1, NULL, NULL);
> +}
> +
> +void isst_ctdp_display_information_start(FILE *outf)
> +{
> +	last_level = 0;
> +	format_and_print(outf, 0, "start", NULL);
> +}
> +
> +void isst_ctdp_display_information_end(FILE *outf)
> +{
> +	format_and_print(outf, 0, NULL, NULL);
> +}
> +
> +void isst_pbf_display_information(int cpu, FILE *outf, int level,
> +				  struct isst_pbf_info *pbf_info)
> +{
> +	print_packag_info(cpu, outf);
> +	_isst_pbf_display_information(cpu, outf, level, pbf_info, 4);
> +	format_and_print(outf, 1, NULL, NULL);
> +}
> +
> +void isst_fact_display_information(int cpu, FILE *outf, int level,
> +				   int fact_bucket, int fact_avx,
> +				   struct isst_fact_info *fact_info)
> +{
> +	print_packag_info(cpu, outf);
> +	_isst_fact_display_information(cpu, outf, level, fact_bucket,
> fact_avx,
> +				       fact_info, 4);
> +	format_and_print(outf, 1, NULL, NULL);
> +}
> +
> +void isst_clos_display_information(int cpu, FILE *outf, int clos,
> +				   struct isst_clos_config
> *clos_config)
> +{
> +	char header[256];
> +	char value[256];
> +
> +	snprintf(header, sizeof(header), "package-%d",
> +		 get_physical_package_id(cpu));
> +	format_and_print(outf, 1, header, NULL);
> +	snprintf(header, sizeof(header), "die-%d",
> get_physical_die_id(cpu));
> +	format_and_print(outf, 2, header, NULL);
> +	snprintf(header, sizeof(header), "cpu-%d", cpu);
> +	format_and_print(outf, 3, header, NULL);
> +
> +	snprintf(header, sizeof(header), "core-power");
> +	format_and_print(outf, 4, header, NULL);
> +
> +	snprintf(header, sizeof(header), "clos");
> +	snprintf(value, sizeof(value), "%d", clos);
> +	format_and_print(outf, 5, header, value);
> +
> +	snprintf(header, sizeof(header), "epp");
> +	snprintf(value, sizeof(value), "%d", clos_config->epp);
> +	format_and_print(outf, 5, header, value);
> +
> +	snprintf(header, sizeof(header), "clos-proportional-priority");
> +	snprintf(value, sizeof(value), "%d", clos_config-
> >clos_prop_prio);
> +	format_and_print(outf, 5, header, value);
> +
> +	snprintf(header, sizeof(header), "clos-min");
> +	snprintf(value, sizeof(value), "%d", clos_config->clos_min);
> +	format_and_print(outf, 5, header, value);
> +
> +	snprintf(header, sizeof(header), "clos-max");
> +	snprintf(value, sizeof(value), "%d", clos_config->clos_max);
> +	format_and_print(outf, 5, header, value);
> +
> +	snprintf(header, sizeof(header), "clos-desired");
> +	snprintf(value, sizeof(value), "%d", clos_config-
> >clos_desired);
> +	format_and_print(outf, 5, header, value);
> +
> +	format_and_print(outf, 1, NULL, NULL);
> +}
> +
> +void isst_display_result(int cpu, FILE *outf, char *feature, char
> *cmd,
> +			 int result)
> +{
> +	char header[256];
> +	char value[256];
> +
> +	snprintf(header, sizeof(header), "package-%d",
> +		 get_physical_package_id(cpu));
> +	format_and_print(outf, 1, header, NULL);
> +	snprintf(header, sizeof(header), "die-%d",
> get_physical_die_id(cpu));
> +	format_and_print(outf, 2, header, NULL);
> +	snprintf(header, sizeof(header), "cpu-%d", cpu);
> +	format_and_print(outf, 3, header, NULL);
> +	snprintf(header, sizeof(header), "%s", feature);
> +	format_and_print(outf, 4, header, NULL);
> +	snprintf(header, sizeof(header), "%s", cmd);
> +	snprintf(value, sizeof(value), "%d", result);
> +	format_and_print(outf, 5, header, value);
> +
> +	format_and_print(outf, 1, NULL, NULL);
> +}
> diff --git a/tools/power/x86/intel-speed-select/isst.h
> b/tools/power/x86/intel-speed-select/isst.h
> new file mode 100644
> index 000000000000..221881761609
> --- /dev/null
> +++ b/tools/power/x86/intel-speed-select/isst.h
> @@ -0,0 +1,231 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Intel Speed Select -- Enumerate and control features
> + * Copyright (c) 2019 Intel Corporation.
> + */
> +
> +#ifndef _ISST_H_
> +#define _ISST_H_
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sched.h>
> +#include <sys/stat.h>
> +#include <sys/resource.h>
> +#include <getopt.h>
> +#include <err.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <sys/time.h>
> +#include <limits.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <cpuid.h>
> +#include <dirent.h>
> +#include <errno.h>
> +
> +#include <stdarg.h>
> +#include <sys/ioctl.h>
> +
> +#define BIT(x) (1 << (x))
> +#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (sizeof(long) * 8
> - 1 - (h))))
> +#define GENMASK_ULL(h,
> l)                                                      \
> +	(((~0ULL) << (l)) & (~0ULL >> (sizeof(long long) * 8 - 1 -
> (h))))
> +
> +#define CONFIG_TDP				0x7f
> +#define CONFIG_TDP_GET_LEVELS_INFO		0x00
> +#define CONFIG_TDP_GET_TDP_CONTROL		0x01
> +#define CONFIG_TDP_SET_TDP_CONTROL		0x02
> +#define CONFIG_TDP_GET_TDP_INFO			0x03
> +#define CONFIG_TDP_GET_PWR_INFO			0x04
> +#define CONFIG_TDP_GET_TJMAX_INFO		0x05
> +#define CONFIG_TDP_GET_CORE_MASK		0x06
> +#define CONFIG_TDP_GET_TURBO_LIMIT_RATIOS	0x07
> +#define CONFIG_TDP_SET_LEVEL			0x08
> +#define CONFIG_TDP_GET_UNCORE_P0_P1_INFO	0X09
> +#define CONFIG_TDP_GET_P1_INFO			0x0a
> +#define CONFIG_TDP_GET_MEM_FREQ			0x0b
> +
> +#define CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_NUMCORES	0x10
> +#define CONFIG_TDP_GET_FACT_HP_TURBO_LIMIT_RATIOS	0x11
> +#define CONFIG_TDP_GET_FACT_LP_CLIPPING_RATIO		0x12
> +
> +#define CONFIG_TDP_PBF_GET_CORE_MASK_INFO	0x20
> +#define CONFIG_TDP_PBF_GET_P1HI_P1LO_INFO	0x21
> +#define CONFIG_TDP_PBF_GET_TJ_MAX_INFO		0x22
> +#define CONFIG_TDP_PBF_GET_TDP_INFO		0X23
> +
> +#define CONFIG_CLOS				0xd0
> +#define CLOS_PQR_ASSOC				0x00
> +#define CLOS_PM_CLOS				0x01
> +#define CLOS_PM_QOS_CONFIG			0x02
> +#define CLOS_STATUS				0x03
> +
> +#define MBOX_CMD_WRITE_BIT			0x08
> +
> +#define PM_QOS_INFO_OFFSET			0x00
> +#define PM_QOS_CONFIG_OFFSET			0x04
> +#define PM_CLOS_OFFSET				0x08
> +#define PQR_ASSOC_OFFSET			0x20
> +
> +struct isst_clos_config {
> +	int pkg_id;
> +	int die_id;
> +	unsigned char epp;
> +	unsigned char clos_prop_prio;
> +	unsigned char clos_min;
> +	unsigned char clos_max;
> +	unsigned char clos_desired;
> +};
> +
> +struct isst_fact_bucket_info {
> +	int high_priority_cores_count;
> +	int sse_trl;
> +	int avx_trl;
> +	int avx512_trl;
> +};
> +
> +struct isst_pbf_info {
> +	int pbf_acticated;
> +	int pbf_available;
> +	size_t core_cpumask_size;
> +	cpu_set_t *core_cpumask;
> +	int p1_high;
> +	int p1_low;
> +	int t_control;
> +	int t_prochot;
> +	int tdp;
> +};
> +
> +#define ISST_TRL_MAX_ACTIVE_CORES	8
> +#define ISST_FACT_MAX_BUCKETS		8
> +struct isst_fact_info {
> +	int lp_clipping_ratio_license_sse;
> +	int lp_clipping_ratio_license_avx2;
> +	int lp_clipping_ratio_license_avx512;
> +	struct isst_fact_bucket_info
> bucket_info[ISST_FACT_MAX_BUCKETS];
> +};
> +
> +struct isst_pkg_ctdp_level_info {
> +	int processed;
> +	int control_cpu;
> +	int pkg_id;
> +	int die_id;
> +	int level;
> +	int fact_support;
> +	int pbf_support;
> +	int fact_enabled;
> +	int pbf_enabled;
> +	int tdp_ratio;
> +	int active;
> +	int tdp_control;
> +	int pkg_tdp;
> +	int pkg_min_power;
> +	int pkg_max_power;
> +	int fact;
> +	int t_proc_hot;
> +	int uncore_p0;
> +	int uncore_p1;
> +	int sse_p1;
> +	int avx2_p1;
> +	int avx512_p1;
> +	int mem_freq;
> +	size_t core_cpumask_size;
> +	cpu_set_t *core_cpumask;
> +	int cpu_count;
> +	int trl_sse_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
> +	int trl_avx_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
> +	int trl_avx_512_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
> +	int kobj_bucket_index;
> +	int active_bucket;
> +	int fact_max_index;
> +	int fact_max_config;
> +	int pbf_found;
> +	int pbf_active;
> +	struct isst_pbf_info pbf_info;
> +	struct isst_fact_info fact_info;
> +};
> +
> +#define ISST_MAX_TDP_LEVELS	(4 + 1) /* +1 for base config */
> +struct isst_pkg_ctdp {
> +	int locked;
> +	int version;
> +	int processed;
> +	int levels;
> +	int current_level;
> +	int enabled;
> +	struct isst_pkg_ctdp_level_info
> ctdp_level[ISST_MAX_TDP_LEVELS];
> +};
> +
> +extern int get_topo_max_cpus(void);
> +extern int get_cpu_count(int pkg_id, int die_id);
> +
> +/* Common interfaces */
> +extern void debug_printf(const char *format, ...);
> +extern int out_format_is_json(void);
> +extern int get_physical_package_id(int cpu);
> +extern int get_physical_die_id(int cpu);
> +extern size_t alloc_cpu_set(cpu_set_t **cpu_set);
> +extern void free_cpu_set(cpu_set_t *cpu_set);
> +extern int find_logical_cpu(int pkg_id, int die_id, int phy_cpu);
> +extern int find_phy_cpu_num(int logical_cpu);
> +extern int find_phy_core_num(int logical_cpu);
> +extern void set_cpu_mask_from_punit_coremask(int cpu,
> +					     unsigned long long
> core_mask,
> +					     size_t core_cpumask_size,
> +					     cpu_set_t *core_cpumask,
> +					     int *cpu_cnt);
> +
> +extern int isst_send_mbox_command(unsigned int cpu, unsigned char
> command,
> +				  unsigned char sub_command,
> +				  unsigned int write,
> +				  unsigned int req_data, unsigned int
> *resp);
> +
> +extern int isst_send_msr_command(unsigned int cpu, unsigned int
> command,
> +				 int write, unsigned long long
> *req_resp);
> +
> +extern int isst_get_ctdp_levels(int cpu, struct isst_pkg_ctdp
> *pkg_dev);
> +extern int isst_get_process_ctdp(int cpu, int tdp_level,
> +				 struct isst_pkg_ctdp *pkg_dev);
> +extern void isst_get_process_ctdp_complete(int cpu,
> +					   struct isst_pkg_ctdp
> *pkg_dev);
> +extern void isst_ctdp_display_information(int cpu, FILE *outf, int
> tdp_level,
> +					  struct isst_pkg_ctdp
> *pkg_dev);
> +extern void isst_ctdp_display_information_start(FILE *outf);
> +extern void isst_ctdp_display_information_end(FILE *outf);
> +extern void isst_pbf_display_information(int cpu, FILE *outf, int
> level,
> +					 struct isst_pbf_info *info);
> +extern int isst_set_tdp_level(int cpu, int tdp_level);
> +extern int isst_set_tdp_level_msr(int cpu, int tdp_level);
> +extern int isst_set_pbf_fact_status(int cpu, int pbf, int enable);
> +extern int isst_get_pbf_info(int cpu, int level,
> +			     struct isst_pbf_info *pbf_info);
> +extern void isst_get_pbf_info_complete(struct isst_pbf_info
> *pbf_info);
> +extern int isst_get_fact_info(int cpu, int level,
> +			      struct isst_fact_info *fact_info);
> +extern int isst_get_fact_bucket_info(int cpu, int level,
> +				     struct isst_fact_bucket_info
> *bucket_info);
> +extern void isst_fact_display_information(int cpu, FILE *outf, int
> level,
> +					  int fact_bucket, int
> fact_avx,
> +					  struct isst_fact_info
> *fact_info);
> +extern int isst_set_trl(int cpu, unsigned long long trl);
> +extern int isst_set_trl_from_current_tdp(int cpu, unsigned long long
> trl);
> +extern int isst_get_config_tdp_lock_status(int cpu);
> +
> +extern int isst_pm_qos_config(int cpu, int enable_clos, int
> priority_type);
> +extern int isst_pm_get_clos(int cpu, int clos,
> +			    struct isst_clos_config *clos_config);
> +extern int isst_set_clos(int cpu, int clos,
> +			 struct isst_clos_config *clos_config);
> +extern int isst_clos_associate(int cpu, int clos);
> +extern int isst_clos_get_assoc_status(int cpu, int *clos_id);
> +extern void isst_clos_display_information(int cpu, FILE *outf, int
> clos,
> +					  struct isst_clos_config
> *clos_config);
> +
> +extern int isst_read_reg(unsigned short reg, unsigned int *val);
> +extern int isst_write_reg(int reg, unsigned int val);
> +
> +extern void isst_display_result(int cpu, FILE *outf, char *feature,
> char *cmd,
> +				int result);
> +#endif

