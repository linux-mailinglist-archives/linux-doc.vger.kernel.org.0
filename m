Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A68E59C321
	for <lists+linux-doc@lfdr.de>; Mon, 22 Aug 2022 17:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbiHVPmD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Aug 2022 11:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236740AbiHVPlr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 11:41:47 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C0CF1EEE4;
        Mon, 22 Aug 2022 08:41:36 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12BBF12FC;
        Mon, 22 Aug 2022 08:41:39 -0700 (PDT)
Received: from entos-ampere-02.shanghai.arm.com (entos-ampere-02.shanghai.arm.com [10.169.212.212])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1627F3F70D;
        Mon, 22 Aug 2022 08:41:26 -0700 (PDT)
From:   Jia He <justin.he@arm.com>
To:     Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
        Tony Luck <tony.luck@intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jan Luebbe <jlu@pengutronix.de>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Kani Toshi <toshi.kani@hpe.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        devel@acpica.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, linux-efi@vger.kernel.org,
        nd@arm.com, "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Muchun Song <songmuchun@bytedance.com>,
        linux-doc@vger.kernel.org, Jia He <justin.he@arm.com>,
        stable@kernel.org
Subject: [RESEND PATCH v3 3/9] EDAC/ghes: Make ghes_edac a proper module to remove the dependency on ghes
Date:   Mon, 22 Aug 2022 15:40:42 +0000
Message-Id: <20220822154048.188253-4-justin.he@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822154048.188253-1-justin.he@arm.com>
References: <20220822154048.188253-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in
apci_init()") introduced a bug that ghes_edac_register() would be invoked
before edac_init(). Because at that time, the bus "edac" hadn't been even
registered, this created sysfs /devices/mc0 instead of
/sys/devices/system/edac/mc/mc0 on an Ampere eMag server.

To remove the dependency of ghes_edac on ghes, make it a proper module. Use
a list to save the probing devices in ghes_probe(), and defer the
ghes_edac_register() to module_init() of the new ghes_edac module by
iterating over the devices list.

Co-developed-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Jia He <justin.he@arm.com>
Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
Cc: stable@kernel.org
Cc: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/acpi/apei/ghes.c | 35 ++++++++++++++++++++++--
 drivers/edac/Kconfig     |  4 +--
 drivers/edac/ghes_edac.c | 59 +++++++++++++++++++++++++---------------
 include/acpi/ghes.h      | 23 ++++------------
 4 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 8cb65f757d06..9c52183e3ad9 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -120,6 +120,9 @@ module_param_named(disable, ghes_disable, bool, 0);
 static LIST_HEAD(ghes_hed);
 static DEFINE_MUTEX(ghes_list_mutex);
 
+static LIST_HEAD(ghes_devs);
+static DEFINE_MUTEX(ghes_devs_mutex);
+
 /*
  * Because the memory area used to transfer hardware error information
  * from BIOS to Linux can be determined only in NMI, IRQ or timer
@@ -1378,7 +1381,11 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 	platform_set_drvdata(ghes_dev, ghes);
 
-	ghes_edac_register(ghes, &ghes_dev->dev);
+	ghes->dev = &ghes_dev->dev;
+
+	mutex_lock(&ghes_devs_mutex);
+	list_add_tail(&ghes->elist, &ghes_devs);
+	mutex_unlock(&ghes_devs_mutex);
 
 	/* Handle any pending errors right away */
 	spin_lock_irqsave(&ghes_notify_lock_irq, flags);
@@ -1442,7 +1449,9 @@ static int ghes_remove(struct platform_device *ghes_dev)
 
 	ghes_fini(ghes);
 
-	ghes_edac_unregister(ghes);
+	mutex_lock(&ghes_devs_mutex);
+	list_del_rcu(&ghes->elist);
+	mutex_unlock(&ghes_devs_mutex);
 
 	kfree(ghes);
 
@@ -1500,6 +1509,28 @@ void __init acpi_ghes_init(void)
 		pr_info(GHES_PFX "Failed to enable APEI firmware first mode.\n");
 }
 
+/*
+ * Known x86 systems that prefer GHES error reporting:
+ */
+static struct acpi_platform_list plat_list[] = {
+	{"HPE   ", "Server  ", 0, ACPI_SIG_FADT, all_versions},
+	{ } /* End */
+};
+
+struct list_head *ghes_get_devices(bool force)
+{
+	int idx = -1;
+
+	if (IS_ENABLED(CONFIG_X86)) {
+		idx = acpi_match_platform_list(plat_list);
+		if (idx < 0 && !force)
+			return NULL;
+	}
+
+	return &ghes_devs;
+}
+EXPORT_SYMBOL_GPL(ghes_get_devices);
+
 void ghes_register_report_chain(struct notifier_block *nb)
 {
 	atomic_notifier_chain_register(&ghes_report_chain, nb);
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 17562cf1fe97..df45db81858b 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -53,8 +53,8 @@ config EDAC_DECODE_MCE
 	  has been initialized.
 
 config EDAC_GHES
-	bool "Output ACPI APEI/GHES BIOS detected errors via EDAC"
-	depends on ACPI_APEI_GHES && (EDAC=y)
+	tristate "Output ACPI APEI/GHES BIOS detected errors via EDAC"
+	depends on ACPI_APEI_GHES
 	select UEFI_CPER
 	help
 	  Not all machines support hardware-driven error report. Some of those
diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index 7b8d56a769f6..bb3ea42ba70b 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -60,6 +60,8 @@ module_param(force_load, bool, 0);
 
 static bool system_scanned;
 
+static struct list_head *ghes_devs;
+
 /* Memory Device - Type 17 of SMBIOS spec */
 struct memdev_dmi_entry {
 	u8 type;
@@ -387,34 +389,15 @@ static struct notifier_block ghes_edac_mem_err_nb = {
 	.priority	= 0,
 };
 
-/*
- * Known systems that are safe to enable this module.
- */
-static struct acpi_platform_list plat_list[] = {
-	{"HPE   ", "Server  ", 0, ACPI_SIG_FADT, all_versions},
-	{ } /* End */
-};
-
-int ghes_edac_register(struct ghes *ghes, struct device *dev)
+static int ghes_edac_register(struct device *dev)
 {
 	bool fake = false;
 	struct mem_ctl_info *mci;
 	struct ghes_pvt *pvt;
 	struct edac_mc_layer layers[1];
 	unsigned long flags;
-	int idx = -1;
 	int rc = 0;
 
-	if (IS_ENABLED(CONFIG_X86)) {
-		/* Check if safe to enable on this system */
-		idx = acpi_match_platform_list(plat_list);
-		if (!force_load && idx < 0)
-			return -ENODEV;
-	} else {
-		force_load = true;
-		idx = 0;
-	}
-
 	/* finish another registration/unregistration instance first */
 	mutex_lock(&ghes_reg_mutex);
 
@@ -458,7 +441,7 @@ int ghes_edac_register(struct ghes *ghes, struct device *dev)
 		pr_info("This system has a very crappy BIOS: It doesn't even list the DIMMS.\n");
 		pr_info("Its SMBIOS info is wrong. It is doubtful that the error report would\n");
 		pr_info("work on such system. Use this driver with caution\n");
-	} else if (idx < 0) {
+	} else if (force_load) {
 		pr_info("This EDAC driver relies on BIOS to enumerate memory and get error reports.\n");
 		pr_info("Unfortunately, not all BIOSes reflect the memory layout correctly.\n");
 		pr_info("So, the end result of using this driver varies from vendor to vendor.\n");
@@ -530,7 +513,7 @@ int ghes_edac_register(struct ghes *ghes, struct device *dev)
 	return rc;
 }
 
-void ghes_edac_unregister(struct ghes *ghes)
+static void ghes_edac_unregister(struct ghes *ghes)
 {
 	struct mem_ctl_info *mci;
 	unsigned long flags;
@@ -566,3 +549,35 @@ void ghes_edac_unregister(struct ghes *ghes)
 unlock:
 	mutex_unlock(&ghes_reg_mutex);
 }
+
+static int __init ghes_edac_init(void)
+{
+	struct ghes *g, *g_tmp;
+
+	if (!IS_ENABLED(CONFIG_X86))
+		force_load = true;
+
+	ghes_devs = ghes_get_devices(force_load);
+	if (!ghes_devs)
+		return -ENODEV;
+
+	list_for_each_entry_safe(g, g_tmp, ghes_devs, elist) {
+		ghes_edac_register(g->dev);
+	}
+
+	return 0;
+}
+module_init(ghes_edac_init);
+
+static void __exit ghes_edac_exit(void)
+{
+	struct ghes *g, *g_tmp;
+
+	list_for_each_entry_safe(g, g_tmp, ghes_devs, elist) {
+		ghes_edac_unregister(g);
+	}
+}
+module_exit(ghes_edac_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Output ACPI APEI/GHES BIOS detected errors module via EDAC");
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index 5cbd38b6e4e1..150c0b9500d6 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -27,6 +27,8 @@ struct ghes {
 		struct timer_list timer;
 		unsigned int irq;
 	};
+	struct device *dev;
+	struct list_head elist;
 };
 
 struct ghes_estatus_node {
@@ -69,28 +71,13 @@ int ghes_register_vendor_record_notifier(struct notifier_block *nb);
  * @nb: pointer to the notifier_block structure of the vendor record handler.
  */
 void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);
+struct list_head *ghes_get_devices(bool force);
+#else
+static inline struct list_head *ghes_get_devices(bool force) { return NULL; }
 #endif
 
 int ghes_estatus_pool_init(int num_ghes);
 
-/* From drivers/edac/ghes_edac.c */
-
-#ifdef CONFIG_EDAC_GHES
-int ghes_edac_register(struct ghes *ghes, struct device *dev);
-
-void ghes_edac_unregister(struct ghes *ghes);
-
-#else
-static inline int ghes_edac_register(struct ghes *ghes, struct device *dev)
-{
-	return -ENODEV;
-}
-
-static inline void ghes_edac_unregister(struct ghes *ghes)
-{
-}
-#endif
-
 static inline int acpi_hest_get_version(struct acpi_hest_generic_data *gdata)
 {
 	return gdata->revision >> 8;
-- 
2.25.1

