Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0B56FD012
	for <lists+linux-doc@lfdr.de>; Tue,  9 May 2023 22:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235381AbjEIUue (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 May 2023 16:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbjEIUuH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 16:50:07 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8531165B7;
        Tue,  9 May 2023 13:49:28 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349JwGN2031581;
        Tue, 9 May 2023 20:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=gfJBM3/T2tsPngLU1OO//7I2AgIBcKFvAtlB2hwV2FM=;
 b=dh/HPNvRj5oFLYAwZPsbWBCUZWdrTmoI2oWEf6D7VF7sY0FXsxKkPTZxHZR1RqxXKRBT
 Fk3akZiPv+Hr8JhWKFSSjwHS5wo4dgDqvUypngnss6ktrcNKL8wu2xQDZ+hZqdm0bmFF
 YVoQG9MGgFH/hEiwLmJCSl16mVNvWa5F74gEtf8EOZ8HpKdYpNoyW2qFb0fBgO94XvNC
 QHarSwXbdiYnZevPgZYITwt4EzJHD56m2X/pc0aqEaO1hoHdDqXzVq5sRWPLThrT/E5c
 VGh8xVb8r6jcXDe6HvE+93yp//jzHOLxXDto7GQUEclYIXgRBQFoYzVEbj/224xjhKnh Eg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77f2uns-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 20:49:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349KnA7C005179
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 20:49:10 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 9 May 2023 13:49:09 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v13 12/24] samples: Add sample userspace Gunyah VM Manager
Date:   Tue, 9 May 2023 13:47:49 -0700
Message-ID: <20230509204801.2824351-13-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230509204801.2824351-1-quic_eberman@quicinc.com>
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UQ2RmIgtlQ5P0uPN6horKLSMLMFXNa13
X-Proofpoint-GUID: UQ2RmIgtlQ5P0uPN6horKLSMLMFXNa13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090171
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a sample Gunyah VMM capable of launching a non-proxy scheduled VM.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 samples/Kconfig              |  10 ++
 samples/Makefile             |   1 +
 samples/gunyah/.gitignore    |   2 +
 samples/gunyah/Makefile      |   6 +
 samples/gunyah/gunyah_vmm.c  | 270 +++++++++++++++++++++++++++++++++++
 samples/gunyah/sample_vm.dts |  68 +++++++++
 6 files changed, 357 insertions(+)
 create mode 100644 samples/gunyah/.gitignore
 create mode 100644 samples/gunyah/Makefile
 create mode 100644 samples/gunyah/gunyah_vmm.c
 create mode 100644 samples/gunyah/sample_vm.dts

diff --git a/samples/Kconfig b/samples/Kconfig
index b2db430bd3ff..567c7a706c01 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -280,6 +280,16 @@ config SAMPLE_KMEMLEAK
           Build a sample program which have explicitly leaks memory to test
           kmemleak
 
+config SAMPLE_GUNYAH
+	bool "Build example Gunyah Virtual Machine Manager"
+	depends on CC_CAN_LINK && HEADERS_INSTALL
+	depends on GUNYAH
+	help
+	  Build an example Gunyah VMM userspace program capable of launching
+	  a basic virtual machine under the Gunyah hypervisor.
+	  This demonstrates how to create a virtual machine under the Gunyah
+	  hypervisor.
+
 source "samples/rust/Kconfig"
 
 endif # SAMPLES
diff --git a/samples/Makefile b/samples/Makefile
index 7727f1a0d6d1..e1b92dec169f 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_SAMPLE_KMEMLEAK)		+= kmemleak/
 obj-$(CONFIG_SAMPLE_CORESIGHT_SYSCFG)	+= coresight/
 obj-$(CONFIG_SAMPLE_FPROBE)		+= fprobe/
 obj-$(CONFIG_SAMPLES_RUST)		+= rust/
+obj-$(CONFIG_SAMPLE_GUNYAH)		+= gunyah/
diff --git a/samples/gunyah/.gitignore b/samples/gunyah/.gitignore
new file mode 100644
index 000000000000..adc7d1589fde
--- /dev/null
+++ b/samples/gunyah/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+/gunyah_vmm
diff --git a/samples/gunyah/Makefile b/samples/gunyah/Makefile
new file mode 100644
index 000000000000..faf14f9bb337
--- /dev/null
+++ b/samples/gunyah/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+userprogs-always-y += gunyah_vmm
+dtb-y += sample_vm.dtb
+
+userccflags += -I usr/include
diff --git a/samples/gunyah/gunyah_vmm.c b/samples/gunyah/gunyah_vmm.c
new file mode 100644
index 000000000000..d0eb49e86372
--- /dev/null
+++ b/samples/gunyah/gunyah_vmm.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdint.h>
+#include <fcntl.h>
+#include <string.h>
+#include <sys/sysmacros.h>
+#define __USE_GNU
+#include <sys/mman.h>
+
+#include <linux/gunyah.h>
+
+struct vm_config {
+	int image_fd;
+	int dtb_fd;
+	int ramdisk_fd;
+
+	uint64_t guest_base;
+	uint64_t guest_size;
+
+	uint64_t image_offset;
+	off_t image_size;
+	uint64_t dtb_offset;
+	off_t dtb_size;
+	uint64_t ramdisk_offset;
+	off_t ramdisk_size;
+};
+
+static struct option options[] = {
+	{ "help", no_argument, NULL, 'h' },
+	{ "image", required_argument, NULL, 'i' },
+	{ "dtb", required_argument, NULL, 'd' },
+	{ "ramdisk", optional_argument, NULL, 'r' },
+	{ "base", optional_argument, NULL, 'B' },
+	{ "size", optional_argument, NULL, 'S' },
+	{ "image_offset", optional_argument, NULL, 'I' },
+	{ "dtb_offset", optional_argument, NULL, 'D' },
+	{ "ramdisk_offset", optional_argument, NULL, 'R' },
+	{ }
+};
+
+static void print_help(char *cmd)
+{
+	printf("gunyah_vmm, a sample tool to launch Gunyah VMs\n"
+	       "Usage: %s <options>\n"
+	       "       --help,    -h  this menu\n"
+	       "       --image,   -i <image> VM image file to load (e.g. a kernel Image) [Required]\n"
+	       "       --dtb,     -d <dtb>   Devicetree file to load [Required]\n"
+	       "       --ramdisk, -r <ramdisk>  Ramdisk file to load\n"
+	       "       --base,    -B <address>  Set the base address of guest's memory [Default: 0x80000000]\n"
+	       "       --size,    -S <number>   The number of bytes large to make the guest's memory [Default: 0x6400000 (100 MB)]\n"
+	       "       --image_offset, -I <number>  Offset into guest memory to load the VM image file [Default: 0x10000]\n"
+	       "        --dtb_offset,  -D <number>  Offset into guest memory to load the DTB [Default: 0]\n"
+	       "        --ramdisk_offset, -R <number>  Offset into guest memory to load a ramdisk [Default: 0x4600000]\n"
+	       , cmd);
+}
+
+int main(int argc, char **argv)
+{
+	int gunyah_fd, vm_fd, guest_fd;
+	struct gh_userspace_memory_region guest_mem_desc = { 0 };
+	struct gh_vm_dtb_config dtb_config = { 0 };
+	char *guest_mem;
+	struct vm_config config = {
+		/* Defaults good enough to boot static kernel and a basic ramdisk */
+		.ramdisk_fd = -1,
+		.guest_base = 0x80000000,
+		.guest_size = 0x6400000, /* 100 MB */
+		.image_offset = 0,
+		.dtb_offset = 0x45f0000,
+		.ramdisk_offset = 0x4600000, /* put at +70MB (30MB for ramdisk) */
+	};
+	struct stat st;
+	int opt, optidx, ret = 0;
+	long l;
+
+	while ((opt = getopt_long(argc, argv, "hi:d:r:B:S:I:D:R:c:", options, &optidx)) != -1) {
+		switch (opt) {
+		case 'i':
+			config.image_fd = open(optarg, O_RDONLY | O_CLOEXEC);
+			if (config.image_fd < 0) {
+				perror("Failed to open image");
+				return -1;
+			}
+			if (stat(optarg, &st) < 0) {
+				perror("Failed to stat image");
+				return -1;
+			}
+			config.image_size = st.st_size;
+			break;
+		case 'd':
+			config.dtb_fd = open(optarg, O_RDONLY | O_CLOEXEC);
+			if (config.dtb_fd < 0) {
+				perror("Failed to open dtb");
+				return -1;
+			}
+			if (stat(optarg, &st) < 0) {
+				perror("Failed to stat dtb");
+				return -1;
+			}
+			config.dtb_size = st.st_size;
+			break;
+		case 'r':
+			config.ramdisk_fd = open(optarg, O_RDONLY | O_CLOEXEC);
+			if (config.ramdisk_fd < 0) {
+				perror("Failed to open ramdisk");
+				return -1;
+			}
+			if (stat(optarg, &st) < 0) {
+				perror("Failed to stat ramdisk");
+				return -1;
+			}
+			config.ramdisk_size = st.st_size;
+			break;
+		case 'B':
+			l = strtol(optarg, NULL, 0);
+			if (l == LONG_MIN) {
+				perror("Failed to parse base address");
+				return -1;
+			}
+			config.guest_base = l;
+			break;
+		case 'S':
+			l = strtol(optarg, NULL, 0);
+			if (l == LONG_MIN) {
+				perror("Failed to parse memory size");
+				return -1;
+			}
+			config.guest_size = l;
+			break;
+		case 'I':
+			l = strtol(optarg, NULL, 0);
+			if (l == LONG_MIN) {
+				perror("Failed to parse image offset");
+				return -1;
+			}
+			config.image_offset = l;
+			break;
+		case 'D':
+			l = strtol(optarg, NULL, 0);
+			if (l == LONG_MIN) {
+				perror("Failed to parse dtb offset");
+				return -1;
+			}
+			config.dtb_offset = l;
+			break;
+		case 'R':
+			l = strtol(optarg, NULL, 0);
+			if (l == LONG_MIN) {
+				perror("Failed to parse ramdisk offset");
+				return -1;
+			}
+			config.ramdisk_offset = l;
+			break;
+		case 'h':
+			print_help(argv[0]);
+			return 0;
+		default:
+			print_help(argv[0]);
+			return -1;
+		}
+	}
+
+	if (!config.image_fd || !config.dtb_fd) {
+		print_help(argv[0]);
+		return -1;
+	}
+
+	if (config.image_offset + config.image_size > config.guest_size) {
+		fprintf(stderr, "Image offset and size puts it outside guest memory. Make image smaller or increase guest memory size.\n");
+		return -1;
+	}
+
+	if (config.dtb_offset + config.dtb_size > config.guest_size) {
+		fprintf(stderr, "DTB offset and size puts it outside guest memory. Make dtb smaller or increase guest memory size.\n");
+		return -1;
+	}
+
+	if (config.ramdisk_fd == -1 &&
+		config.ramdisk_offset + config.ramdisk_size > config.guest_size) {
+		fprintf(stderr, "Ramdisk offset and size puts it outside guest memory. Make ramdisk smaller or increase guest memory size.\n");
+		return -1;
+	}
+
+	gunyah_fd = open("/dev/gunyah", O_RDWR | O_CLOEXEC);
+	if (gunyah_fd < 0) {
+		perror("Failed to open /dev/gunyah");
+		return -1;
+	}
+
+	vm_fd = ioctl(gunyah_fd, GH_CREATE_VM, 0);
+	if (vm_fd < 0) {
+		perror("Failed to create vm");
+		return -1;
+	}
+
+	guest_fd = memfd_create("guest_memory", MFD_CLOEXEC);
+	if (guest_fd < 0) {
+		perror("Failed to create guest memfd");
+		return -1;
+	}
+
+	if (ftruncate(guest_fd, config.guest_size) < 0) {
+		perror("Failed to grow guest memory");
+		return -1;
+	}
+
+	guest_mem = mmap(NULL, config.guest_size, PROT_READ | PROT_WRITE, MAP_SHARED, guest_fd, 0);
+	if (guest_mem == MAP_FAILED) {
+		perror("Not enough memory");
+		return -1;
+	}
+
+	if (read(config.image_fd, guest_mem + config.image_offset, config.image_size) < 0) {
+		perror("Failed to read image into guest memory");
+		return -1;
+	}
+
+	if (read(config.dtb_fd, guest_mem + config.dtb_offset, config.dtb_size) < 0) {
+		perror("Failed to read dtb into guest memory");
+		return -1;
+	}
+
+	if (config.ramdisk_fd > 0 &&
+		read(config.ramdisk_fd, guest_mem + config.ramdisk_offset,
+			config.ramdisk_size) < 0) {
+		perror("Failed to read ramdisk into guest memory");
+		return -1;
+	}
+
+	guest_mem_desc.label = 0;
+	guest_mem_desc.flags = GH_MEM_ALLOW_READ | GH_MEM_ALLOW_WRITE | GH_MEM_ALLOW_EXEC;
+	guest_mem_desc.guest_phys_addr = config.guest_base;
+	guest_mem_desc.memory_size = config.guest_size;
+	guest_mem_desc.userspace_addr = (__u64)guest_mem;
+
+	if (ioctl(vm_fd, GH_VM_SET_USER_MEM_REGION, &guest_mem_desc) < 0) {
+		perror("Failed to register guest memory with VM");
+		return -1;
+	}
+
+	dtb_config.guest_phys_addr = config.guest_base + config.dtb_offset;
+	dtb_config.size = config.dtb_size;
+	if (ioctl(vm_fd, GH_VM_SET_DTB_CONFIG, &dtb_config) < 0) {
+		perror("Failed to set DTB configuration for VM");
+		return -1;
+	}
+
+	ret = ioctl(vm_fd, GH_VM_START);
+	if (ret) {
+		perror("GH_VM_START failed");
+		return -1;
+	}
+
+	while (1)
+		sleep(10);
+
+	return 0;
+}
diff --git a/samples/gunyah/sample_vm.dts b/samples/gunyah/sample_vm.dts
new file mode 100644
index 000000000000..293bbc0469c8
--- /dev/null
+++ b/samples/gunyah/sample_vm.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	chosen {
+		bootargs = "nokaslr";
+	};
+
+	cpus {
+		#address-cells = <0x2>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0 0>;
+		};
+	};
+
+	intc: interrupt-controller@3FFF0000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-controller;
+		reg = <0 0x3FFF0000 0 0x10000>,
+		      <0 0x3FFD0000 0 0x20000>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		always-on;
+		interrupts = <1 13 0x108>,
+			     <1 14 0x108>,
+			     <1 11 0x108>,
+			     <1 10 0x108>;
+		clock-frequency = <19200000>;
+	};
+
+	gunyah-vm-config {
+		image-name = "linux_vm_0";
+
+		memory {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			base-address = <0 0x80000000>;
+		};
+
+		interrupts {
+			config = <&intc>;
+		};
+
+		vcpus {
+			affinity-map = < 0 >;
+			sched-priority = < (-1) >;
+			sched-timeslice = < 2000 >;
+		};
+	};
+};
-- 
2.40.0

