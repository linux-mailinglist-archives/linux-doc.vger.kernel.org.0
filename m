Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B73C5EE8C1
	for <lists+linux-doc@lfdr.de>; Wed, 28 Sep 2022 23:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbiI1V4U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Sep 2022 17:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiI1V4S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 17:56:18 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5118B2C4;
        Wed, 28 Sep 2022 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664402177; x=1695938177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvqCije8FYc80J2ZML8FtSYArUuaHDSm2gH3OFs28SM=;
  b=RIj+EsNEVReePDACFgY1TPjYJULeZC6HzL5pmgENxjkN0lPtYDgjhl+M
   bf1k3bX9N1bvu4SqKfkL5CjNmLRvLhUDZSndkyz+FyasB4ByTgBFCNHkC
   lveoW6OSgmojxisJJ4+7bEV6mvj+L7IzKCC5+p4hApamAHQupFPTUTzp1
   J385x78lyZvkx2xCAm7HDoqJdmU/FK1iUadqRdGLcr8lU39j7kU2f7AIr
   hJGTKXe9gUquNSiMlW/NRXDkVuxdWkxhCGKdZLyXgRN7ZXx+f1NXXjLQ9
   d9X4S1RnrK9G8FeGtOYiDs6dtnmRiaDK2Z2UwKADKMme8js8lhNM5uIct
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="363566934"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; 
   d="scan'208";a="363566934"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 14:56:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="652848709"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; 
   d="scan'208";a="652848709"
Received: from mjpaul-mobl1.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.209.66.23])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 14:56:15 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Wander Lairson Costa <wander@redhat.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v14 2/3] virt: Add TDX guest driver
Date:   Wed, 28 Sep 2022 14:55:34 -0700
Message-Id: <20220928215535.26527-3-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928215535.26527-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220928215535.26527-1-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TDX guest driver exposes IOCTL interfaces to service TDX guest
user-specific requests. Currently, it is only used to allow the user to
get the TDREPORT to support TDX attestation.

Details about the TDX attestation process are documented in
Documentation/x86/tdx.rst, and the IOCTL details are documented in
Documentation/virt/coco/tdx-guest.rst.

Operations like getting TDREPORT involves sending a blob of data as
input and getting another blob of data as output. It was considered
to use a sysfs interface for this, but it doesn't fit well into the
standard sysfs model for configuring values. It would be possible to
do read/write on files, but it would need multiple file descriptors,
which would be somewhat messy. IOCTLs seems to be the best fitting
and simplest model for this use case. The AMD sev-guest driver also
uses IOCTL interface to support attestation.

[Bagas Sanjaya: Ack is for documentation portion]
Acked-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Wander Lairson Costa <wander@redhat.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v13:
 * Converted the driver from built-in to a driver module
   as per Greg's suggestion.
 * Moved the driver to drivers/virt/coco to match AMD SEV.
 * Added support to autoload the driver based on
   X86_FEATURE_TDX_GUEST CPU feature.
 * Squashed patch titled "Documentation/x86: Document TDX
   attestation process" with this patch.
 * Since the attestation process is already documented in
   Documentation/x86/tdx.rst, remove it from the commit log.
 * Modified the commit log to match the new format.
 * Explicitly included the required header files.
 * Fixed magic number usage in reserved member check.

Changes since v13:
 * Fixed the commit log as per review suggestion.
 * Explicitly included the required header files.
 * Fixed magic number usage in reserved member check.

Changes since v12:
 * Added check to ensure reserved entries are set as 0.

Changes since v11:
 * Renamed DRIVER_NAME to TDX_GUEST_DEVICE and moved it to
   arch/x86/include/uapi/asm/tdx.h.
 * Fixed default error number in tdx_guest_ioctl().
 * Moved tdx_misc_dev definition out of tdx_guest_init() as
   per Greg's suggestion.
 * Reordered struct tdx_report_req to avoid holes and added
   required padding.

Changes since v10:
 * Replaced TD/TD Guest usage with TDX Guest or Guest.
 * Removed unnecessary comments.
 * Added more validation to user input in tdx_get_report().
 * Used u64_to_user_ptr when reading user u64 pointers.
 * Fixed commit log as per review comments.

Changes since v9:
 * Dropped the cover letter. Since this patch set only adds
   TDREPORT support, the commit log itself has all the required details.
 * Dropped the Quote support and event IRQ support as per Dave's
   review suggestion.
 * Dropped attest.c and moved its contents to tdx.c
 * Updated commit log and comments to reflect latest changes.

Changes since v8:
 * Please refer to https://lore.kernel.org/all/ \
   20220728034420.648314-1-sathyanarayanan.kuppuswamy@linux.intel.com/

 Documentation/virt/coco/tdx-guest.rst   |  42 ++++++++
 Documentation/virt/index.rst            |   1 +
 Documentation/x86/tdx.rst               |  43 ++++++++
 arch/x86/include/asm/tdx.h              |   1 +
 drivers/virt/Kconfig                    |   2 +
 drivers/virt/Makefile                   |   1 +
 drivers/virt/coco/tdx-guest/Kconfig     |  10 ++
 drivers/virt/coco/tdx-guest/Makefile    |   2 +
 drivers/virt/coco/tdx-guest/tdx-guest.c | 131 ++++++++++++++++++++++++
 include/uapi/linux/tdx-guest.h          |  53 ++++++++++
 10 files changed, 286 insertions(+)
 create mode 100644 Documentation/virt/coco/tdx-guest.rst
 create mode 100644 drivers/virt/coco/tdx-guest/Kconfig
 create mode 100644 drivers/virt/coco/tdx-guest/Makefile
 create mode 100644 drivers/virt/coco/tdx-guest/tdx-guest.c
 create mode 100644 include/uapi/linux/tdx-guest.h

diff --git a/Documentation/virt/coco/tdx-guest.rst b/Documentation/virt/coco/tdx-guest.rst
new file mode 100644
index 000000000000..4fe72829bdd0
--- /dev/null
+++ b/Documentation/virt/coco/tdx-guest.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================================================
+TDX Guest API Documentation
+===================================================================
+
+1. General description
+======================
+
+The TDX guest driver exposes IOCTL interfaces via /dev/tdx-guest misc
+device to allow userspace to get certain TDX guest specific details.
+
+2. API description
+==================
+
+In this section, for each supported IOCTL, following information is
+provided along with a generic description.
+
+:Input parameters: Parameters passed to the IOCTL and related details.
+:Output: Details about output data and return value (with details about the non
+         common error values).
+
+2.1 TDX_CMD_GET_REPORT
+----------------------
+
+:Input parameters: struct tdx_report_req
+:Output: Upon successful execution, TDREPORT data is copied to
+         tdx_report_req.tdreport and return 0. Return -EIO on
+         TDCALL failure or standard error number on other common
+         failures.
+
+The TDX_CMD_GET_REPORT IOCTL can be used by the attestation software to
+get the TDREPORT from the TDX module using TDCALL[TDG.MR.REPORT].
+
+Reference
+---------
+
+TDX reference material is collected here:
+
+https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
+
+The driver is based on TDX module specification v1.0 and TDX GHCI specification v1.0.
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 2f1cffa87b1b..56e003ff28ff 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -14,6 +14,7 @@ Linux Virtualization Support
    ne_overview
    acrn/index
    coco/sev-guest
+   coco/tdx-guest
    hyperv/index
 
 .. only:: html and subproject
diff --git a/Documentation/x86/tdx.rst b/Documentation/x86/tdx.rst
index b8fa4329e1a5..014b769923a4 100644
--- a/Documentation/x86/tdx.rst
+++ b/Documentation/x86/tdx.rst
@@ -210,6 +210,49 @@ converted to shared on boot.
 For coherent DMA allocation, the DMA buffer gets converted on the
 allocation. Check force_dma_unencrypted() for details.
 
+Attestation
+===========
+
+Attestation is used to verify the TDX guest trustworthiness to other
+entities before provisioning secrets to the guest. For example, a key
+server may want to use attestation to verify that the guest is the
+desired one before releasing the encryption keys to mount the encrypted
+rootfs or secondary drive.
+
+The TDX module records the state of the TDX guest in various stages of
+the guest boot process using build time measurement register (MRTD) and
+runtime measurement registers (RTMR). Measurements related to guest
+initial configuration and firmware image are recorded in the MRTD
+register. Measurements related to initial state, kernel image, firmware
+image, command line options, initrd, ACPI tables, etc are recorded in
+RTMR registers. For more details as an example, please refer to TDX
+Virtual Firmware design specification, sec titled "TD Measurement". At
+TDX guest runtime, the attestation process is used to attest to these
+measurements.
+
+The attestation process consists of two steps: TDREPORT generation and
+Quote generation.
+
+TDX guest uses TDCALL[TDG.MR.REPORT] to get the TDREPORT (TDREPORT_STRUCT)
+from the TDX module. TDREPORT is a fixed-size data structure generated by
+the TDX module which contains guest-specific information (such as build
+and boot measurements), platform security version, and the MAC to protect
+the integrity of the TDREPORT. A user-provided 64-Byte REPORTDATA is used
+as input and included in the TDREPORT. Typically it can be some nonce
+provided by attestation service so the TDREPORT can be verified uniquely.
+More details about the TDREPORT can be found in Intel TDX Module
+specification, section titled "TDG.MR.REPORT Leaf".
+
+After getting the TDREPORT, the second step of the attestation process
+is to send it to the Quoting Enclave (QE) to generate the Quote. TDREPORT
+by design can only be verified on the local platform as the MAC key is
+bound to the platform. To support remote verification of the TDREPORT,
+TDX leverages Intel SGX Quoting Enclave to verify the TDREPORT locally
+and convert it to a remotely verifiable Quote. Method of sending TDREPORT
+to QE is implementation specific. Attestation software can choose
+whatever communication channel available (i.e. vsock or TCP/IP) to
+send the TDREPORT to QE and receive the Quote.
+
 References
 ==========
 
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 34c00d8a5263..f710035a0bdb 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -21,6 +21,7 @@
 /* TDX module Call Leaf IDs */
 #define TDX_GET_INFO			1
 #define TDX_GET_VEINFO			3
+#define TDX_GET_REPORT			4
 #define TDX_ACCEPT_PAGE			6
 
 #ifndef __ASSEMBLY__
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 87ef258cec64..f79ab13a5c28 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -52,4 +52,6 @@ source "drivers/virt/coco/efi_secret/Kconfig"
 
 source "drivers/virt/coco/sev-guest/Kconfig"
 
+source "drivers/virt/coco/tdx-guest/Kconfig"
+
 endif
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index 093674e05c40..e9aa6fc96fab 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
 obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
+obj-$(CONFIG_INTEL_TDX_GUEST)	+= coco/tdx-guest/
diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
new file mode 100644
index 000000000000..14246fc2fb02
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/Kconfig
@@ -0,0 +1,10 @@
+config TDX_GUEST_DRIVER
+	tristate "TDX Guest driver"
+	depends on INTEL_TDX_GUEST
+	help
+	  The driver provides userspace interface to communicate with
+	  the TDX module to request the TDX guest details like attestation
+	  report.
+
+	  To compile this driver as module, choose M here. The module will
+	  be called tdx-guest.
diff --git a/drivers/virt/coco/tdx-guest/Makefile b/drivers/virt/coco/tdx-guest/Makefile
new file mode 100644
index 000000000000..4396ec319589
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_TDX_GUEST_DRIVER) += tdx-guest.o
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
new file mode 100644
index 000000000000..3a4aa5590963
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TDX guest user interface driver
+ *
+ * Copyright (C) 2022 Intel Corporation
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include <uapi/linux/tdx-guest.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/tdx.h>
+
+static long tdx_get_report(void __user *argp)
+{
+	u8 *reportdata, *tdreport;
+	struct tdx_report_req req;
+	long ret;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	/*
+	 * Per TDX Module 1.0 specification, section titled
+	 * "TDG.MR.REPORT", REPORTDATA length is fixed as
+	 * TDX_REPORTDATA_LEN, TDREPORT length is fixed as
+	 * TDX_REPORT_LEN, and TDREPORT subtype is fixed as 0.
+	 */
+	if (req.subtype || req.rpd_len != TDX_REPORTDATA_LEN ||
+	    req.tdr_len != TDX_REPORT_LEN)
+		return -EINVAL;
+
+	if (memchr_inv(req.reserved, 0, sizeof(req.reserved)))
+		return -EINVAL;
+
+	reportdata = kmalloc(req.rpd_len, GFP_KERNEL);
+	if (!reportdata)
+		return -ENOMEM;
+
+	tdreport = kzalloc(req.tdr_len, GFP_KERNEL);
+	if (!tdreport) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (copy_from_user(reportdata, u64_to_user_ptr(req.reportdata),
+			   req.rpd_len)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	/*
+	 * Generate TDREPORT using "TDG.MR.REPORT" TDCALL.
+	 *
+	 * Get the TDREPORT using REPORTDATA as input. Refer to
+	 * section 22.3.3 TDG.MR.REPORT leaf in the TDX Module 1.0
+	 * Specification for detailed information.
+	 */
+	ret = __tdx_module_call(TDX_GET_REPORT, virt_to_phys(tdreport),
+				virt_to_phys(reportdata), req.subtype,
+				0, NULL);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(req.tdreport), tdreport, req.tdr_len))
+		ret = -EFAULT;
+
+out:
+	kfree(reportdata);
+	kfree(tdreport);
+
+	return ret;
+}
+
+static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
+			    unsigned long arg)
+{
+	switch (cmd) {
+	case TDX_CMD_GET_REPORT:
+		return tdx_get_report((void __user *)arg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations tdx_guest_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = tdx_guest_ioctl,
+	.llseek = no_llseek,
+};
+
+static struct miscdevice tdx_misc_dev = {
+	.name = TDX_GUEST_DEVICE,
+	.minor = MISC_DYNAMIC_MINOR,
+	.fops = &tdx_guest_fops,
+};
+
+static int __init tdx_guest_init(void)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return -ENODEV;
+
+	return misc_register(&tdx_misc_dev);
+}
+module_init(tdx_guest_init);
+
+static void __exit tdx_guest_exit(void)
+{
+	misc_deregister(&tdx_misc_dev);
+}
+module_exit(tdx_guest_exit);
+
+static const struct x86_cpu_id tdx_guest_ids[] = {
+	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
+
+MODULE_AUTHOR("Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>");
+MODULE_DESCRIPTION("TDX Guest Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/tdx-guest.h b/include/uapi/linux/tdx-guest.h
new file mode 100644
index 000000000000..8a3785eac3de
--- /dev/null
+++ b/include/uapi/linux/tdx-guest.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_TDX_GUEST_H_
+#define _UAPI_LINUX_TDX_GUEST_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define TDX_GUEST_DEVICE                "tdx-guest"
+
+/* Length of the REPORTDATA used in TDG.MR.REPORT TDCALL */
+#define TDX_REPORTDATA_LEN              64
+
+/* Length of TDREPORT used in TDG.MR.REPORT TDCALL */
+#define TDX_REPORT_LEN                  1024
+
+/**
+ * struct tdx_report_req - Get TDREPORT using REPORTDATA as input.
+ *
+ * @reportdata: User-defined REPORTDATA to be included into TDREPORT.
+ *	Typically it can be some nonce provided by attestation service,
+ *	so the generated TDREPORT can be uniquely verified.
+ * @tdreport: TDREPORT output from TDCALL[TDG.MR.REPORT].
+ * @rpd_len: Length of the REPORTDATA (fixed as 64 bytes by the TDX
+ *	Module specification, but a parameter is added to handle future
+ *	extension).
+ * @tdr_len: Length of the TDREPORT (fixed as 1024 bytes by the TDX
+ *	Module specification, but a parameter is added to accommodate
+ *	future extension).
+ * @subtype: Subtype of TDREPORT (fixed as 0 by the TDX Module specification,
+ *	but added a parameter to handle future extension).
+ * @reserved: Reserved entries to handle future requirements. Should be
+ *	filled with zeroes.
+ *
+ * Used in TDX_CMD_GET_REPORT IOCTL request.
+ */
+struct tdx_report_req {
+	__u64 reportdata;
+	__u64 tdreport;
+	__u32 rpd_len;
+	__u32 tdr_len;
+	__u8 subtype;
+	__u8 reserved[7];
+};
+
+/*
+ * TDX_CMD_GET_REPORT - Get TDREPORT using TDCALL[TDG.MR.REPORT]
+ *
+ * Return 0 on success, -EIO on TDCALL execution failure, and
+ * standard errno on other general error cases.
+ */
+#define TDX_CMD_GET_REPORT              _IOWR('T', 1, struct tdx_report_req)
+
+#endif /* _UAPI_LINUX_TDX_GUEST_H_ */
-- 
2.34.1

