Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D2E5A2A4E
	for <lists+linux-doc@lfdr.de>; Fri, 26 Aug 2022 17:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiHZPGu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Aug 2022 11:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiHZPGt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Aug 2022 11:06:49 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F59C1205;
        Fri, 26 Aug 2022 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661526408; x=1693062408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ci/7C4DxmDC5s5TH//OjIbWxIR3YdcZiyAKle+74TYA=;
  b=fOPPhti/x9R9wYel9mmZGMatfTZFJhBhYw5D8jWt9uah9gIq69yjE1zL
   oQGoV/QPVxKCCMRffVhfh28zwCJXQFt9qSxZ5Wl5HOyPezfu71ZLE3E7b
   f2Cu644ATmkUAd25gv4Ylz3585wjT+lL9VaYy+xRPjpb3Lh/Jd+Z7QxDR
   aSl9NjeoNz5W+6ruCPkpmsu2ljvsZVEatHkwQe2tQRLZnHX2WkV3OvIVq
   qMJz30xLvGDtnjNuzagIWmskLnYzMvBWIpnQC1R0YrWGh14bqJwoTD1iB
   ttMTGGqCah1Z4lSlIxk3uNCmPTPIlAHKXuDuFk3MeBC0GJUvUlonXMDBY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="277537968"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="277537968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 08:06:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="678889576"
Received: from kimdavid-mobl.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.252.129.184])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 08:06:46 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Wander Lairson Costa <wander@redhat.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v11 1/3] x86/tdx: Add TDX Guest attestation interface driver
Date:   Fri, 26 Aug 2022 08:06:36 -0700
Message-Id: <20220826150638.2397576-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Attestation is used to verify the TDX guest trustworthiness to other
entities before provisioning secrets to the guest. For example, a key
server may request for attestation before releasing the encryption keys
to mount the encrypted rootfs or secondary drive.

During the TDX guest launch, the initial contents (including the
firmware image) and configuration of the guest are recorded by the
Intel TDX module in build time measurement register (MRTD). After TDX
guest is created, run-time measurement registers (RTMRs) can be used by
the guest software to extend the measurements. TDX supports 4 RTMR
registers, and TDG.MR.RTMR.EXTEND TDCALL is used to update the RTMR
registers securely. RTMRs are mainly used to record measurements
related to sections like the kernel image, command line parameters,
initrd, ACPI tables, firmware data, configuration firmware volume (CFV)
of TDVF, etc. For complete details, please refer to TDX Virtual
Firmware design specification, sec titled "TD Measurement".

At TDX guest runtime, the Intel TDX module reuses the Intel SGX
attestation infrastructure to provide support for attesting to these
measurements as described below.

The attestation process consists of two steps: TDREPORT generation and
Quote generation.

TDREPORT (TDREPORT_STRUCT) is a fixed-size data structure generated by
the TDX module which contains guest-specific information (such as build
and boot measurements), platform security version, and the MAC to
protect the integrity of the TDREPORT. The guest kernel uses
TDCALL[TDG.MR.REPORT] to get the TDREPORT from the TDX module. A
user-provided 64-Byte REPORTDATA is used as input and included in the
TDREPORT. Typically it can be some nonce provided by attestation
service so the TDREPORT can be verified uniquely. More details about
the TDREPORT can be found in Intel TDX Module specification, section
titled "TDG.MR.REPORT Leaf".

TDREPORT by design can only be verified on the local platform as the
MAC key is bound to the platform. To support remote verification of
the TDREPORT, TDX leverages Intel SGX Quote Enclave (QE) to verify
the TDREPORT locally and convert it to a remote verifiable Quote.

After getting the TDREPORT, the second step of the attestation process
is to send it to the QE to generate the Quote. TDX doesn't support SGX
inside the guest, so the QE can be deployed in the host, or in another
legacy VM with SGX support. QE checks the integrity of TDREPORT and if
it is valid, a certified quote signing key is used to sign the Quote.
How to send the TDREPORT to QE and receive the Quote is implementation
and deployment specific.

Implement a basic guest misc driver to allow userspace to get the
TDREPORT. After getting TDREPORT, the userspace attestation software
can choose whatever communication channel available (i.e. vsock or
hypercall) to send the TDREPORT to QE and receive the Quote.

Also note that explicit access permissions are not enforced in this
driver because the quote and measurements are not a secret. However
the access permissions of the device node can be used to set any
desired access policy. The udev default is usually root access
only.

Operations like getting TDREPORT or Quote generation involves sending
a blob of data as input and getting another blob of data as output. It
was considered to use a sysfs interface for this, but it doesn't fit
well into the standard sysfs model for configuring values. It would be
possible to do read/write on files, but it would need multiple file
descriptors, which would be somewhat messy. IOCTLs seems to be the best
fitting and simplest model for this use case. This is similar to AMD
SEV platform, which also uses IOCTL interface to support attestation.

Any distribution enabling TDX is also expected to need attestation. So
enable it by default with TDX guest support.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Acked-by: Wander Lairson Costa <wander@redhat.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

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

 arch/x86/coco/tdx/tdx.c         | 114 ++++++++++++++++++++++++++++++++
 arch/x86/include/uapi/asm/tdx.h |  51 ++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/x86/include/uapi/asm/tdx.h

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 928dcf7a20d9..0888bdf93a4e 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -5,16 +5,21 @@
 #define pr_fmt(fmt)     "tdx: " fmt
 
 #include <linux/cpufeature.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/io.h>
 #include <asm/coco.h>
 #include <asm/tdx.h>
 #include <asm/vmx.h>
 #include <asm/insn.h>
 #include <asm/insn-eval.h>
 #include <asm/pgtable.h>
+#include <uapi/asm/tdx.h>
 
 /* TDX module Call Leaf IDs */
 #define TDX_GET_INFO			1
 #define TDX_GET_VEINFO			3
+#define TDX_GET_REPORT			4
 #define TDX_ACCEPT_PAGE			6
 
 /* TDX hypercall Leaf IDs */
@@ -34,6 +39,10 @@
 #define VE_GET_PORT_NUM(e)	((e) >> 16)
 #define VE_IS_IO_STRING(e)	((e) & BIT(4))
 
+#define DRIVER_NAME	"tdx-guest"
+
+static struct miscdevice tdx_misc_dev;
+
 /*
  * Wrapper for standard use of __tdx_hypercall with no output aside from
  * return code.
@@ -775,3 +784,108 @@ void __init tdx_early_init(void)
 
 	pr_info("Guest detected\n");
 }
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
+	 * TDX_REPORT_LEN, and TDREPORT subtype is fixed as
+	 * 0. Also check for valid user pointers.
+	 */
+	if (!req.reportdata || !req.tdreport || req.subtype ||
+		req.rpd_len != TDX_REPORTDATA_LEN ||
+		req.tdr_len != TDX_REPORT_LEN)
+		return -EINVAL;
+
+	reportdata = kmalloc(req.rpd_len, GFP_KERNEL);
+	if (!reportdata)
+		return -ENOMEM;
+
+	tdreport = kzalloc(req.tdr_len, GFP_KERNEL);
+	if (!tdreport) {
+		kfree(reportdata);
+		return -ENOMEM;
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
+	return ret;
+}
+static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
+			    unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	long ret = -EINVAL;
+
+	switch (cmd) {
+	case TDX_CMD_GET_REPORT:
+		ret = tdx_get_report(argp);
+		break;
+	default:
+		pr_debug("cmd %d not supported\n", cmd);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations tdx_guest_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= tdx_guest_ioctl,
+	.llseek		= no_llseek,
+};
+
+static int __init tdx_guest_init(void)
+{
+	int ret;
+
+	if (!cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return -EIO;
+
+	tdx_misc_dev.name = DRIVER_NAME;
+	tdx_misc_dev.minor = MISC_DYNAMIC_MINOR;
+	tdx_misc_dev.fops = &tdx_guest_fops;
+
+	ret = misc_register(&tdx_misc_dev);
+	if (ret) {
+		pr_err("misc device registration failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+device_initcall(tdx_guest_init)
diff --git a/arch/x86/include/uapi/asm/tdx.h b/arch/x86/include/uapi/asm/tdx.h
new file mode 100644
index 000000000000..c1667b20fe20
--- /dev/null
+++ b/arch/x86/include/uapi/asm/tdx.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_X86_TDX_H
+#define _UAPI_ASM_X86_TDX_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* Length of the REPORTDATA used in TDG.MR.REPORT TDCALL */
+#define TDX_REPORTDATA_LEN              64
+
+/* Length of TDREPORT used in TDG.MR.REPORT TDCALL */
+#define TDX_REPORT_LEN                  1024
+
+/**
+ * struct tdx_report_req: Get TDREPORT using REPORTDATA as input.
+ *
+ * @subtype        : Subtype of TDREPORT (fixed as 0 by TDX Module
+ *                   specification, but added a parameter to handle
+ *                   future extension).
+ * @reportdata     : User-defined REPORTDATA to be included into
+ *                   TDREPORT. Typically it can be some nonce
+ *                   provided by attestation service, so the
+ *                   generated TDREPORT can be uniquely verified.
+ * @rpd_len        : Length of the REPORTDATA (fixed as 64 bytes by
+ *                   the TDX Module specification, but parameter is
+ *                   added to handle future extension).
+ * @tdreport       : TDREPORT output from TDCALL[TDG.MR.REPORT].
+ * @tdr_len        : Length of the TDREPORT (fixed as 1024 bytes by
+ *                   the TDX Module specification, but a parameter
+ *                   is added to accommodate future extension).
+ *
+ * Used in TDX_CMD_GET_REPORT IOCTL request.
+ */
+struct tdx_report_req {
+	__u8  subtype;
+	__u64 reportdata;
+	__u32 rpd_len;
+	__u64 tdreport;
+	__u32 tdr_len;
+};
+
+/*
+ * TDX_CMD_GET_REPORT - Get TDREPORT using TDCALL[TDG.MR.REPORT]
+ *
+ * Return 0 on success, -EIO on TDCALL execution failure, and
+ * standard errno on other general error cases.
+ *
+ */
+#define TDX_CMD_GET_REPORT		_IOWR('T', 0x01, __u64)
+
+#endif /* _UAPI_ASM_X86_TDX_H */
-- 
2.25.1

