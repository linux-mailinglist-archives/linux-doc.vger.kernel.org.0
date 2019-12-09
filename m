Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E01B1166A0
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2019 06:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfLIFxx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Dec 2019 00:53:53 -0500
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:6044
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726038AbfLIFxw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Dec 2019 00:53:52 -0500
Received: from BL0PR02CA0075.namprd02.prod.outlook.com (2603:10b6:208:51::16)
 by BN7PR02MB4993.namprd02.prod.outlook.com (2603:10b6:408:25::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Mon, 9 Dec
 2019 05:53:41 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by BL0PR02CA0075.outlook.office365.com
 (2603:10b6:208:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Mon, 9 Dec 2019 05:53:41 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2495.26
 via Frontend Transport; Mon, 9 Dec 2019 05:53:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieBzI-0004Mr-BE; Sun, 08 Dec 2019 21:53:40 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieBzD-00012m-5R; Sun, 08 Dec 2019 21:53:35 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieBzB-0000yR-Rh; Sun, 08 Dec 2019 21:53:34 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, michal.simek@xilinx.com,
        robh+dt@kernel.org, shubhrajyoti.datta@gmail.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Kedareswara rao Appana <appanad@xilinx.com>,
        Srikanth Thokala <sthokal@xilinx.com>,
        Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH 2/3] trafgen: xilinx: add axi traffic generator driver
Date:   Mon,  9 Dec 2019 11:23:19 +0530
Message-Id: <1575870800-7369-2-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1575870800-7369-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1575870800-7369-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--8.883-7.0-31-1
X-imss-scan-details: No--8.883-7.0-31-1;No--8.883-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132203444210141161;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(346002)(136003)(39850400004)(376002)(189003)(199004)(30864003)(86362001)(76176011)(55446002)(50226002)(9686003)(5660300002)(51416003)(107886003)(82202003)(8676002)(81156014)(316002)(8936002)(50466002)(4326008)(356004)(6666004)(36756003)(26005)(9786002)(81166006)(48376002)(73392003)(336012)(2906002)(76482006)(426003)(2616005)(70586007)(305945005)(498600001)(54906003)(450100002)(70206006)(559001)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4993;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b242a90-8af7-408e-3369-08d77c6c24aa
X-MS-TrafficTypeDiagnostic: BN7PR02MB4993:
X-Microsoft-Antispam-PRVS: <BN7PR02MB49931A0044FC46DD47F87C9287580@BN7PR02MB4993.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXwY+AhuFHbWjKPy+5dza+jTd5/OTfBlNDUWioYFq7fskH7t45hclVmx0DHy8e7nS1bMosAlVwCOPKCClQi5jxK85vWG/i6hGeZPg0VT4+etMMD+Bepv2WYxoa/xm6RL9wJLI4OIac/JUIULLetiATRz0TBFKFWuBka+NV0z5uU/llfaYIeOgqwg3wEJLHUfzbZrU591Amr2tP6Bz4g2NrzgBoyT4pScMh/fYzmnYOFsFOKrPf2cHjd1lOG+eeccKkAzFcN58527PlMJ1IyQw/YjypIvH2abQhS6TRAWMPn5bJ2HaNjrpkx3NZTkHKPLWH3Jjyp0ZMDOcSx777uBvK08HJQ2zqPObBlGIRqaAtgh8l6KLHpNq0eEVhv8tkvFnsm4tFovy2uDDLxDPmTYl8A+f5dCbA0aGmmnw/5EwPqR4RGP8ZBxXT22iL4rhzuR
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 05:53:40.7408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b242a90-8af7-408e-3369-08d77c6c24aa
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4993
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

This is the driver for AXI Traffic Generator IP. The AXI
Traffic Generator IP is a core that generates traffic on the AXI4
interconnect and other AXI4 peripherals in the system.
It generates a wide variety of AXI4 transactions based on
the core programming.

Architecture of the core is broadly separated into a master
and slave block, each of which contains the write block and
read block. Other support functions are provided by the
control registers and three internal RAMs - Master RAM,
Command RAM, Parameter RAM. The initialisation sequence
includes programming Command RAM with commands, data into
Master RAM (optional Parameter RAM programming) and then
enable master logic using control register interface.
This sequence generates traffic to cores connected in the
h/w design.

The driver for this IP is designed to be a module with
sysfs interface.

The driver is work is authored by
Srikanth Thokla
Nava Kishore
Michal Simek
Kedar
Shubhrajyoti

Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
Signed-off-by: Srikanth Thokala <sthokal@xilinx.com>
Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/misc/Kconfig          |   12 +
 drivers/misc/Makefile         |    1 +
 drivers/misc/xilinx_trafgen.c | 1654 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1667 insertions(+)
 create mode 100644 drivers/misc/xilinx_trafgen.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 1e9a6fa..05f06b6 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -463,6 +463,18 @@ config XILINX_FLEX_PM
 
 	  If unsure, say N
 
+config XILINX_TRAFGEN
+	tristate "Xilinx Traffic Generator"
+	help
+	  This option enables support for the Xilinx Traffic Generator driver.
+	  It is designed to generate AXI4 traffic which can be used to stress
+	  different modules/interconnect connected in the system. Different
+	  configurable options which are provided through sysfs entries allow
+	  allow the user to generate a wide variety of traffic based on their
+	  their requirements.
+
+	  If unsure, say N
+
 config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 1f1c34d..b209181 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -58,3 +58,4 @@ obj-$(CONFIG_PVPANIC)   	+= pvpanic.o
 obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_XILINX_FLEX_PM)	+= xilinx_flex_pm.o
+obj-$(CONFIG_XILINX_TRAFGEN)	+= xilinx_trafgen.o
diff --git a/drivers/misc/xilinx_trafgen.c b/drivers/misc/xilinx_trafgen.c
new file mode 100644
index 0000000..d699e70
--- /dev/null
+++ b/drivers/misc/xilinx_trafgen.c
@@ -0,0 +1,1654 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AXI Traffic Generator driver.
+ *
+ * Description:
+ * This driver is developed for AXI Traffic Generator IP, which is
+ * designed to generate AXI4 traffic which can be used to stress
+ * different modules/interconnect connected in the system. Different
+ * configurable options which are provided through sysfs entries
+ * allow the user to generate a wide variety of traffic based on
+ * their requirements.
+ *
+ * Copyright (c) 2019 Xilinx Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* Hw specific definitions */
+
+/* Internal RAM Offsets */
+#define XTG_PARAM_RAM_OFFSET	   0x1000  /* Parameter RAM offset */
+#define XTG_COMMAND_RAM_OFFSET	   0x8000  /* Command RAM offset */
+#define XTG_COMMAND_RAM_MSB_OFFSET 0xa000	/**< Command RAM MSB Offset */
+#define XTG_MASTER_RAM_INIT_OFFSET 0x10000 /* Master RAM initial offset(v1.0) */
+#define XTG_MASTER_RAM_OFFSET	   0xc000  /* Master RAM offset */
+#define XTG_WRITE_COMMAND_RAM_OFFSET	0x9000  /* Write Command RAM offset */
+
+/* Register Offsets */
+#define XTG_MCNTL_OFFSET	0x00	/* Master control */
+#define XTG_SCNTL_OFFSET	0x04	/* Slave control */
+#define XTG_ERR_STS_OFFSET	0x08	/* Error status  */
+#define XTG_ERR_EN_OFFSET	0x0C	/* Error enable */
+#define XTG_MSTERR_INTR_OFFSET	0x10	/* Master error interrupt enable */
+#define XTG_CFG_STS_OFFSET	0x14	/* Config status */
+#define XTG_STREAM_CNTL_OFFSET	0x30	/* Streaming Control */
+#define XTG_STREAM_CFG_OFFSET	0x34	/* Streaming Control */
+#define XTG_STREAM_TL_OFFSET	0x38    /* Streaming Transfer Length */
+#define XTG_STREAM_TKTS1_OFFSET	0x40    /* Streaming tkeep tstrb set1*/
+#define XTG_STREAM_TKTS2_OFFSET	0x44    /* Streaming tkeep tstrb set2*/
+#define XTG_STREAM_TKTS3_OFFSET	0x48    /* Streaming tkeep tstrb set3*/
+#define XTG_STREAM_TKTS4_OFFSET	0x4C    /* Streaming tkeep tstrb set4*/
+#define XTG_STATIC_CNTL_OFFSET	0x60	/* Static Control */
+#define XTG_STATIC_LEN_OFFSET	0x64	/* Static Length */
+
+/* Register Bitmasks/shifts */
+
+/* Master logic enable */
+#define XTG_MCNTL_MSTEN_MASK		0x00100000
+/* Loop enable */
+#define XTG_MCNTL_LOOPEN_MASK		0x00080000
+/* Slave error interrupt enable */
+#define XTG_SCNTL_ERREN_MASK		0x00008000
+/* Master complete interrupt enable */
+#define XTG_ERR_EN_MSTIRQEN_MASK	0x80000000
+/* Master error interrupt enable */
+#define XTG_MSTERR_INTR_MINTREN_MASK	0x00008000
+/* Master complete done status */
+#define XTG_ERR_STS_MSTDONE_MASK	0x80000000
+/* Error mask for error status/enable registers */
+#define XTG_ERR_ALL_ERRS_MASK		0x801F0003
+/* Core Revision shift */
+#define XTG_MCNTL_REV_SHIFT		24
+
+/* Axi Traffic Generator Command RAM Entry field mask/shifts */
+
+/* Command RAM entry masks */
+#define XTG_LEN_MASK		0xFF		/* Driven to a*_len line  */
+#define XTG_LOCK_MASK		0x1		/* Driven to a*_lock line */
+#define XTG_BURST_MASK		0x3		/* Driven to a*_burst line */
+#define XTG_SIZE_MASK		0x7		/* Driven to a*_size line */
+#define XTG_ID_MASK		0x1F		/* Driven to a*_id line */
+#define XTG_PROT_MASK		0x7		/* Driven to a*_prot line */
+#define XTG_LAST_ADDR_MASK	0x7		/* Last address */
+#define XTG_VALID_CMD_MASK	0x1		/* Valid Command */
+#define XTG_MSTRAM_INDEX_MASK	0x1FFF		/* Master RAM Index */
+#define XTG_OTHER_DEPEND_MASK	0x1FF		/* Other depend Command no */
+#define XTG_MY_DEPEND_MASK	0x1FF		/* My depend command no */
+#define XTG_QOS_MASK		0xF		/* Driven to a*_qos line */
+#define XTG_USER_MASK		0xFF		/* Driven to a*_user line */
+#define XTG_CACHE_MASK		0xF		/* Driven to a*_cache line */
+#define XTG_EXPECTED_RESP_MASK	0x7		/* Expected response */
+
+/* Command RAM entry shift values */
+#define XTG_LEN_SHIFT		0		/* Driven to a*_len line  */
+#define XTG_LOCK_SHIFT		8		/* Driven to a*_lock line */
+#define XTG_BURST_SHIFT		10		/* Driven to a*_burst line */
+#define XTG_SIZE_SHIFT		12		/* Driven to a*_size line */
+#define XTG_ID_SHIFT		15		/* Driven to a*_id line */
+#define XTG_PROT_SHIFT		21		/* Driven to a*_prot line */
+#define XTG_LAST_ADDR_SHIFT	28		/* Last address */
+#define XTG_VALID_CMD_SHIFT	31		/* Valid Command */
+#define XTG_MSTRAM_INDEX_SHIFT	0		/* Master RAM Index */
+#define XTG_OTHER_DEPEND_SHIFT	13		/* Other depend cmd num */
+#define XTG_MY_DEPEND_SHIFT	22		/* My depend cmd num */
+#define XTG_QOS_SHIFT		16		/* Driven to a*_qos line */
+#define XTG_USER_SHIFT		5		/* Driven to a*_user line */
+#define XTG_CACHE_SHIFT		4		/* Driven to a*_cache line */
+#define XTG_EXPECTED_RESP_SHIFT	0		/* Expected response */
+
+/* Axi Traffic Generator Parameter RAM Entry field mask/shifts */
+
+/* Parameter RAM Entry field shift values */
+#define XTG_PARAM_ADDRMODE_SHIFT	24	/* Address mode */
+#define XTG_PARAM_INTERVALMODE_SHIFT	26	/* Interval mode */
+#define XTG_PARAM_IDMODE_SHIFT		28	/* Id mode */
+#define XTG_PARAM_OP_SHIFT		29	/* Opcode */
+
+/* PARAM RAM Opcode shift values */
+#define XTG_PARAM_COUNT_SHIFT		0	/* Repeat/Delay count */
+#define XTG_PARAM_DELAYRANGE_SHIFT	0	/* Delay range */
+#define XTG_PARAM_DELAY_SHIFT		8	/* FIXED RPT delay count */
+#define XTG_PARAM_ADDRRANGE_SHIFT	20	/* Address range */
+
+/* Parameter RAM Entry field mask values */
+#define XTG_PARAM_ADDRMODE_MASK		0x3	/* Address mode */
+#define XTG_PARAM_INTERVALMODE_MASK	0x3	/* Interval mode */
+#define XTG_PARAM_IDMODE_MASK		0x1	/* Id mode */
+#define XTG_PARAM_OP_MASK		0x7	/* Opcode */
+
+/* PARAM RAM Opcode mask values */
+#define XTG_PARAM_COUNT_MASK		0xFFFFFF/* Repeat/Delay count */
+#define XTG_PARAM_DELAYRANGE_MASK	0xFF	/* Delay range */
+#define XTG_PARAM_DELAY_MASK		0xFFF	/* FIXED RPT delay count */
+#define XTG_PARAM_ADDRRANGE_MASK	0xF	/* Address range */
+
+/* PARAM RAM Opcode values */
+#define XTG_PARAM_OP_NOP		0x0	/* NOP mode */
+#define XTG_PARAM_OP_RPT		0x1	/* Repeat mode */
+#define XTG_PARAM_OP_DELAY		0x2	/* Delay mode */
+#define XTG_PARAM_OP_FIXEDRPT		0x3	/* Fixed repeat delay */
+
+/* Axi Traffic Generator Static Mode masks */
+#define XTG_STATIC_CNTL_TD_MASK		0x00000002	/* Transfer Done Mask */
+#define XTG_STATIC_CNTL_STEN_MASK	0x00000001	/* Static Enable Mask */
+#define XTG_STATIC_CNTL_RESET_MASK	0x00000000	/* Static Reset Mask */
+
+/* Axi Traffic Generator Stream Mode mask/shifts */
+#define XTG_STREAM_CNTL_STEN_MASK   0x00000001	/* Stream Enable Mask */
+#define XTG_STREAM_TL_TCNT_MASK	    0xFFFF0000	/* Transfer Count Mask */
+#define XTG_STREAM_TL_TLEN_MASK	    0x0000FFFF	/* Transfer Length Mask */
+#define XTG_STREAM_TL_TCNT_SHIFT    16		/* Transfer Count Shift */
+
+/* Driver Specific Definitions */
+
+#define MAX_NUM_ENTRIES	256	/* Number of command entries per region */
+
+#define VALID_SIG	0xa5a5a5a5	/* Valid unique identifier */
+
+/* Internal RAM Sizes */
+#define XTG_PRM_RAM_BLOCK_SIZE	0x400	/* PRAM Block size (1KB) */
+#define XTG_CMD_RAM_BLOCK_SIZE	0x1000	/* CRAM Block size (4KB) */
+#define XTG_EXTCMD_RAM_BLOCK_SIZE 0x400	/**< Extended CMDRAM Block Size (1KB) */
+#define XTG_PARAM_RAM_SIZE	0x800	/* Parameter RAM (2KB) */
+#define XTG_COMMAND_RAM_SIZE	0x2000	/* Command RAM (8KB) */
+#define XTG_EXTCMD_RAM_SIZE	0x800	/* Command RAM (2KB) */
+#define XTG_MASTER_RAM_SIZE	0x2000	/* Master RAM (8KB) */
+
+/* RAM Access Flags */
+#define XTG_READ_RAM		0x0	/* Read RAM flag */
+#define XTG_WRITE_RAM		0x1	/* Write RAM flag */
+#define XTG_WRITE_RAM_ZERO	0x2	/* Write Zero flag */
+
+/* Bytes per entry */
+#define XTG_CRAM_BYTES_PER_ENTRY	16 /* CRAM bytes per entry */
+#define XTG_PRAM_BYTES_PER_ENTRY	4  /* PRAM bytes per entry */
+
+/* Interrupt Definitions */
+#define XTG_MASTER_CMP_INTR	0x1	/* Master complete intr flag */
+#define XTG_MASTER_ERR_INTR	0x2	/* Master error intr flag */
+#define XTG_SLAVE_ERR_INTR	0x4	/* Slave error intr flag */
+
+/*
+ * Version value of the trafgen core.
+ * For the initial IP release the version(v1.0) value is 0x47
+ * From the v2.0 IP and onwards the value starts from  0x20.
+ * For eg:
+ * v2.1 -> 0x21
+ * v2.2 -> 0x22 ... so on.
+ *
+ */
+#define XTG_INIT_VERSION	0x47	/* Trafgen initial version(v1.0) */
+
+/* Macro */
+#define to_xtg_dev_info(n)	((struct xtg_dev_info *)dev_get_drvdata(n))
+
+#define CMD_WDS	0x4	/* No of words in command ram per command */
+#define EXT_WDS	0x1	/* No of words in extended ram per command */
+#define MSB_INDEX	0x4
+/**
+ * struct xtg_cram - Command RAM structure
+ * @addr: Address Driven to a*_addr line
+ * @valid_cmd: Valid Command
+ * @last_addr: Last address
+ * @prot: Driven to a*_prot line
+ * @id: Driven to a*_id line
+ * @size: Driven to a*_size line
+ * @burst: Driven to a*_burst line
+ * @lock: Driven to a*_lock line
+ * @length: Driven to a*_len line
+ * @my_dpnd: My Depend command number
+ * @other_dpnd: Other depend command number
+ * @mram_idx: Master RAM index
+ * @qos: Driven to a*_qos line
+ * @user: Driven to a*_user line
+ * @cache: Driven to a*_cache line
+ * @expected_resp: Expected response
+ * @index: Command Index
+ * @is_write_block: Write/Read block
+ * @is_valid_req: Unique signature
+ *
+ * FIXME: This structure is shared with the user application and
+ * hence need to be synchronized. We know these kind of structures
+ * should not be defined in the driver and this need to be fixed
+ * if found a proper placeholder (in uapi/).
+ */
+struct xtg_cram {
+	phys_addr_t addr;
+	u32 valid_cmd;
+	u32 last_addr;
+	u32 prot;
+	u32 id;
+	u32 size;
+	u32 burst;
+	u32 lock;
+	u32 length;
+	u32 my_dpnd;
+	u32 other_dpnd;
+	u32 mram_idx;
+	u32 qos;
+	u32 user;
+	u32 cache;
+	u32 expected_resp;
+	u16 index;
+	bool is_write_block;
+	u32 is_valid_req;
+};
+
+/**
+ * struct xtg_pram - Parameter RAM structure
+ * @op_cntl0: Control field 0
+ * @op_cntl1: Control field 1
+ * @op_cntl2: Control field 2
+ * @addr_mode: Address mode
+ * @interval_mode: Interval mode
+ * @id_mode: Id mode
+ * @opcode: Opcode
+ * @index: Command Index
+ * @is_write_block: Write/Read block
+ * @is_valid_req: Unique signature
+ *
+ * FIXME: This structure is shared with the user application and
+ * hence need to be synchronized. We know these kind of structures
+ * should not be defined in the driver and this need to be fixed
+ * if found a proper placeholder (in uapi/).
+ */
+struct xtg_pram {
+	u32 op_cntl0;
+	u32 op_cntl1;
+	u32 op_cntl2;
+	u32 addr_mode;
+	u32 interval_mode;
+	u32 id_mode;
+	u32 opcode;
+	u16 index;
+	bool is_write_block;
+	u32 is_valid_req;
+};
+
+/**
+ * struct xtg_dev_info - Global Driver structure
+ * @regs: Iomapped base address
+ * @dev: Device structure
+ * @phys_base_addr: Physical base address
+ * @last_rd_valid_idx: Last Read Valid Command Index
+ * @last_wr_valid_idx: Last Write Valid Command Index
+ * @id: Device instance id
+ * @xtg_mram_offset: MasterRam offset
+ * @clk: Input clock
+ */
+struct xtg_dev_info {
+	void __iomem *regs;
+	struct device *dev;
+	phys_addr_t phys_base_addr;
+	s16 last_rd_valid_idx;
+	s16 last_wr_valid_idx;
+	u32 id;
+	u32 xtg_mram_offset;
+	struct clk *clk;
+};
+
+/**
+ * enum xtg_sysfs_ioctl - Ioctl opcodes
+ * @XTG_GET_MASTER_CMP_STS: get master complete status
+ * @XTG_GET_SLV_CTRL_REG: get slave control reg status
+ * @XTG_GET_ERR_STS: get error status
+ * @XTG_GET_CFG_STS: get config status
+ * @XTG_GET_LAST_VALID_INDEX: get last valid index
+ * @XTG_GET_DEVICE_ID: get device id
+ * @XTG_GET_RESOURCE: get resource
+ * @XTG_GET_STATIC_ENABLE: get staic mode traffic genration state
+ * @XTG_GET_STATIC_BURSTLEN: get static mode burst length
+ * @XTG_GET_STATIC_TRANSFERDONE: get static transfer done
+ * @XTG_GET_STREAM_ENABLE : get strean mode traffic genration state
+ * @XTG_GET_STREAM_TRANSFERLEN: get streaming mode transfer length
+ * @XTG_GET_STREAM_TRANSFERCNT: get streaming mode transfer count
+ * @XTG_GET_MASTER_LOOP_EN: get master loop enable status
+ * @XTG_GET_STREAM_TKTS1: get stream tstrb and tkeep set1 values
+ * @XTG_GET_STREAM_TKTS2: get stream tstrb and tkeep set2 values
+ * @XTG_GET_STREAM_TKTS3: get stream tstrb and tkeep set3 values
+ * @XTG_GET_STREAM_TKTS4: get stream tstrb and tkeep set4 values
+ * @XTG_GET_STREAM_CFG: get stream configuration values
+ * @XTG_START_MASTER_LOGIC: start master logic
+ * @XTG_SET_SLV_CTRL_REG: set slave control
+ * @XTG_CLEAR_ERRORS: clear errors
+ * @XTG_ENABLE_ERRORS: enable errors
+ * @XTG_ENABLE_INTRS: enable interrupts
+ * @XTG_CLEAR_MRAM: clear master ram
+ * @XTG_CLEAR_CRAM: clear command ram
+ * @XTG_CLEAR_PRAM: clear parameter ram
+ * @XTG_SET_STATIC_ENABLE: enable static mode traffic genration
+ * @XTG_SET_STATIC_DISABLE: disable static mode traffic genration
+ * @XTG_SET_STATIC_BURSTLEN: set static mode burst length
+ * @XTG_SET_STATIC_TRANSFERDONE: set static transfer done
+ * @XTG_SET_STREAM_ENABLE: enable streaming mode traffic genration
+ * @XTG_SET_STREAM_DISABLE: disable streaming mode traffic genration
+ * @XTG_SET_STREAM_TRANSFERLEN: set streaming mode transfer length
+ * @XTG_SET_STREAM_TRANSFERCNT: set streaming mode transfer count
+ * @XTG_SET_STREAM_TKTS1: set stream tstrb and tkeep set1 values
+ * @XTG_SET_STREAM_TKTS2: set stream tstrb and tkeep set2 values
+ * @XTG_SET_STREAM_TKTS3: set stream tstrb and tkeep set3 values
+ * @XTG_SET_STREAM_TKTS4: set stream tstrb and tkeep set4 values
+ * @XTG_SET_STREAM_CFG: set stream configuration values
+ * @XTG_MASTER_LOOP_EN: enable master loop
+ */
+enum xtg_sysfs_ioctl_opcode {
+	XTG_GET_MASTER_CMP_STS,
+	XTG_GET_SLV_CTRL_REG,
+	XTG_GET_ERR_STS,
+	XTG_GET_CFG_STS,
+	XTG_GET_LAST_VALID_INDEX,
+	XTG_GET_DEVICE_ID,
+	XTG_GET_RESOURCE,
+	XTG_GET_STATIC_ENABLE,
+	XTG_GET_STATIC_BURSTLEN,
+	XTG_GET_STATIC_TRANSFERDONE,
+	XTG_GET_STREAM_ENABLE,
+	XTG_GET_STREAM_TRANSFERLEN,
+	XTG_GET_MASTER_LOOP_EN,
+	XTG_GET_STREAM_TKTS1,
+	XTG_GET_STREAM_TKTS2,
+	XTG_GET_STREAM_TKTS3,
+	XTG_GET_STREAM_TKTS4,
+	XTG_GET_STREAM_CFG,
+	XTG_GET_STREAM_TRANSFERCNT,
+	XTG_START_MASTER_LOGIC,
+	XTG_SET_SLV_CTRL_REG,
+	XTG_CLEAR_ERRORS,
+	XTG_ENABLE_ERRORS,
+	XTG_ENABLE_INTRS,
+	XTG_CLEAR_MRAM,
+	XTG_CLEAR_CRAM,
+	XTG_CLEAR_PRAM,
+	XTG_SET_STATIC_ENABLE,
+	XTG_SET_STATIC_DISABLE,
+	XTG_SET_STATIC_BURSTLEN,
+	XTG_SET_STATIC_TRANSFERDONE,
+	XTG_SET_STREAM_ENABLE,
+	XTG_SET_STREAM_DISABLE,
+	XTG_SET_STREAM_TRANSFERLEN,
+	XTG_SET_STREAM_TRANSFERCNT,
+	XTG_SET_STREAM_TKTS1,
+	XTG_SET_STREAM_TKTS2,
+	XTG_SET_STREAM_TKTS3,
+	XTG_SET_STREAM_TKTS4,
+	XTG_SET_STREAM_CFG,
+	XTG_MASTER_LOOP_EN
+};
+
+/**
+ * xtg_access_rams - Write/Read Master/Command/Parameter RAM
+ * @tg: Pointer to xtg_dev_info structure
+ * @where: Offset from base
+ * @count: Number of bytes to write/read
+ * @flags: Read/Write/Write Zero
+ * @data: Data pointer
+ */
+static void xtg_access_rams(struct xtg_dev_info *tg, int where,
+			    int count, int flags, u32 *data)
+{
+	u32 index;
+
+	switch (flags) {
+	case XTG_WRITE_RAM_ZERO:
+		memset_io(tg->regs + where, 0, count);
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+		writel(0x0, tg->regs + where +
+			(XTG_COMMAND_RAM_MSB_OFFSET - XTG_COMMAND_RAM_OFFSET) +
+			XTG_EXTCMD_RAM_BLOCK_SIZE - XTG_CMD_RAM_BLOCK_SIZE);
+#endif
+		break;
+	case XTG_WRITE_RAM:
+		for (index = 0; count > 0; index++, count -= 4)
+			writel(data[index], tg->regs + where + index * 4);
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	/*
+	 * This additional logic is required only for command ram.
+	 * when writing to READ Command RAM write higher address to READ addr
+	 * RAM
+	 */
+	if (where >= XTG_COMMAND_RAM_OFFSET &&
+	    where < XTG_WRITE_COMMAND_RAM_OFFSET)
+		writel(data[MSB_INDEX],	tg->regs + XTG_COMMAND_RAM_OFFSET +
+			(where - XTG_COMMAND_RAM_OFFSET) / 4 +
+			(XTG_COMMAND_RAM_MSB_OFFSET - XTG_COMMAND_RAM_OFFSET));
+	/*
+	 * Writing to WRITE Command RAM write higher address to WRITE addr RAM
+	 */
+	if (where >=  XTG_WRITE_COMMAND_RAM_OFFSET &&
+	    where < XTG_COMMAND_RAM_MSB_OFFSET)
+		writel(data[MSB_INDEX],	tg->regs +
+			XTG_WRITE_COMMAND_RAM_OFFSET +
+			(where - XTG_WRITE_COMMAND_RAM_OFFSET) / 4 +
+			(XTG_COMMAND_RAM_MSB_OFFSET - XTG_COMMAND_RAM_OFFSET) +
+			XTG_EXTCMD_RAM_BLOCK_SIZE - XTG_CMD_RAM_BLOCK_SIZE);
+#endif
+		break;
+	case XTG_READ_RAM:
+		for (index = 0; count > 0; index++, count -= 4)
+			data[index] = readl(tg->regs + where + index * 4);
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	if (where >= XTG_COMMAND_RAM_OFFSET &&
+	    where < XTG_WRITE_COMMAND_RAM_OFFSET)
+		data[MSB_INDEX] = readl(tg->regs + XTG_COMMAND_RAM_OFFSET +
+			(where - XTG_COMMAND_RAM_OFFSET) / 4 +
+			(XTG_COMMAND_RAM_MSB_OFFSET - XTG_COMMAND_RAM_OFFSET));
+
+	if (where >=  XTG_WRITE_COMMAND_RAM_OFFSET &&
+	    where < XTG_COMMAND_RAM_MSB_OFFSET)
+		data[MSB_INDEX] = readl(tg->regs +
+			XTG_WRITE_COMMAND_RAM_OFFSET +
+			(where - XTG_WRITE_COMMAND_RAM_OFFSET) / 4 +
+			(XTG_COMMAND_RAM_MSB_OFFSET - XTG_COMMAND_RAM_OFFSET) +
+			XTG_EXTCMD_RAM_BLOCK_SIZE - XTG_CMD_RAM_BLOCK_SIZE);
+#endif
+		break;
+	}
+}
+
+/**
+ * xtg_prepare_cmd_words - Prepares all four Command RAM words
+ * @tg: Pointer to xtg_dev_info structure
+ * @cmdp: Pointer to xtg_cram structure
+ * @cmd_words: Pointer to Command Words that needs to be prepared
+ */
+static void xtg_prepare_cmd_words(struct xtg_dev_info *tg,
+				  const struct xtg_cram *cmdp, u32 *cmd_words)
+{
+	/* Command Word 0 */
+	cmd_words[0] = lower_32_bits(cmdp->addr);
+
+	/* Command Word 4 */
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	cmd_words[MSB_INDEX] = upper_32_bits(cmdp->addr);
+#endif
+
+	/* Command Word 1 */
+	cmd_words[1] = 0;
+	cmd_words[1] |= (cmdp->length & XTG_LEN_MASK) << XTG_LEN_SHIFT;
+	cmd_words[1] |= (cmdp->lock & XTG_LOCK_MASK) << XTG_LOCK_SHIFT;
+	cmd_words[1] |= (cmdp->burst & XTG_BURST_MASK) << XTG_BURST_SHIFT;
+	cmd_words[1] |= (cmdp->size & XTG_SIZE_MASK) << XTG_SIZE_SHIFT;
+	cmd_words[1] |= (cmdp->id & XTG_ID_MASK) << XTG_ID_SHIFT;
+	cmd_words[1] |= (cmdp->prot & XTG_PROT_MASK) << XTG_PROT_SHIFT;
+	cmd_words[1] |= (cmdp->last_addr & XTG_LAST_ADDR_MASK) <<
+					XTG_LAST_ADDR_SHIFT;
+	cmd_words[1] |= (cmdp->valid_cmd & XTG_VALID_CMD_MASK) <<
+					XTG_VALID_CMD_SHIFT;
+
+	/* Command Word 2 */
+	cmd_words[2] = 0;
+	cmd_words[2] |= (cmdp->mram_idx & XTG_MSTRAM_INDEX_MASK) <<
+					XTG_MSTRAM_INDEX_SHIFT;
+	cmd_words[2] |= (cmdp->other_dpnd & XTG_OTHER_DEPEND_MASK) <<
+					XTG_OTHER_DEPEND_SHIFT;
+	cmd_words[2] |= (cmdp->my_dpnd & XTG_MY_DEPEND_MASK) <<
+					XTG_MY_DEPEND_SHIFT;
+
+	/* Command Word 3 */
+	cmd_words[3] = 0;
+	cmd_words[3] |= (cmdp->qos & XTG_QOS_MASK) << XTG_QOS_SHIFT;
+	cmd_words[3] |= (cmdp->user & XTG_USER_MASK) << XTG_USER_SHIFT;
+	cmd_words[3] |= (cmdp->cache & XTG_CACHE_MASK) << XTG_CACHE_SHIFT;
+	cmd_words[3] |= (cmdp->expected_resp & XTG_EXPECTED_RESP_MASK) <<
+					XTG_EXPECTED_RESP_SHIFT;
+}
+
+/**
+ * xtg_prepare_param_words - Prepares Parameter RAM word
+ * @tg: Pointer to xtg_dev_info structure
+ * @cmdp: Pointer to xtg_pram structure
+ * @param_word: Pointer to Param Word that needs to be prepared
+ */
+static void xtg_prepare_param_word(struct xtg_dev_info *tg,
+				   const struct xtg_pram *cmdp, u32 *param_word)
+{
+	*param_word = 0;
+	*param_word |= (cmdp->opcode & XTG_PARAM_OP_MASK) << XTG_PARAM_OP_SHIFT;
+	*param_word |= (cmdp->addr_mode & XTG_PARAM_ADDRMODE_MASK) <<
+					XTG_PARAM_ADDRMODE_SHIFT;
+	*param_word |= (cmdp->id_mode & XTG_PARAM_IDMODE_MASK) <<
+					XTG_PARAM_IDMODE_SHIFT;
+	*param_word |= (cmdp->interval_mode & XTG_PARAM_INTERVALMODE_MASK) <<
+					XTG_PARAM_INTERVALMODE_SHIFT;
+
+	switch (cmdp->opcode) {
+	case XTG_PARAM_OP_RPT:
+	case XTG_PARAM_OP_DELAY:
+		*param_word |= (cmdp->op_cntl0 & XTG_PARAM_COUNT_MASK) <<
+					XTG_PARAM_COUNT_SHIFT;
+		break;
+
+	case XTG_PARAM_OP_FIXEDRPT:
+		*param_word |= (cmdp->op_cntl0 & XTG_PARAM_ADDRRANGE_MASK) <<
+					XTG_PARAM_ADDRRANGE_SHIFT;
+		*param_word |= (cmdp->op_cntl1 & XTG_PARAM_DELAY_MASK) <<
+					XTG_PARAM_DELAY_SHIFT;
+		*param_word |= (cmdp->op_cntl2 & XTG_PARAM_DELAYRANGE_MASK) <<
+					XTG_PARAM_DELAYRANGE_SHIFT;
+		break;
+
+	case XTG_PARAM_OP_NOP:
+		*param_word = 0;
+		break;
+	}
+}
+
+/**
+ * xtg_sysfs_ioctl - Implements sysfs operations
+ * @dev: Device structure
+ * @buf: Value to write
+ * @opcode: Ioctl opcode
+ *
+ * Return: value read from the sysfs opcode.
+ */
+static ssize_t xtg_sysfs_ioctl(struct device *dev, const char *buf,
+			       enum xtg_sysfs_ioctl_opcode opcode)
+{
+	struct xtg_dev_info *tg = to_xtg_dev_info(dev);
+	unsigned long wrval;
+	ssize_t status, rdval = 0;
+
+	if (opcode > XTG_GET_STREAM_TRANSFERCNT) {
+		status = kstrtoul(buf, 0, &wrval);
+		if (status < 0)
+			return status;
+	}
+
+	switch (opcode) {
+	case XTG_GET_MASTER_CMP_STS:
+		rdval = (readl(tg->regs + XTG_MCNTL_OFFSET) &
+				XTG_MCNTL_MSTEN_MASK) ? 1 : 0;
+		break;
+
+	case XTG_GET_MASTER_LOOP_EN:
+		rdval = (readl(tg->regs + XTG_MCNTL_OFFSET) &
+				XTG_MCNTL_LOOPEN_MASK) ? 1 : 0;
+		break;
+
+	case XTG_GET_SLV_CTRL_REG:
+		rdval = readl(tg->regs + XTG_SCNTL_OFFSET);
+		break;
+
+	case XTG_GET_ERR_STS:
+		rdval = readl(tg->regs + XTG_ERR_STS_OFFSET) &
+				XTG_ERR_ALL_ERRS_MASK;
+		break;
+
+	case XTG_GET_CFG_STS:
+		rdval = readl(tg->regs + XTG_CFG_STS_OFFSET);
+		break;
+
+	case XTG_GET_LAST_VALID_INDEX:
+		rdval = (((tg->last_wr_valid_idx << 16) & 0xffff0000) |
+				(tg->last_rd_valid_idx & 0xffff));
+		break;
+
+	case XTG_GET_DEVICE_ID:
+		rdval = tg->id;
+		break;
+
+	case XTG_GET_RESOURCE:
+		rdval = (unsigned long)tg->regs;
+		break;
+
+	case XTG_GET_STATIC_ENABLE:
+		rdval = readl(tg->regs + XTG_STATIC_CNTL_OFFSET);
+		break;
+
+	case XTG_GET_STATIC_BURSTLEN:
+		rdval = readl(tg->regs + XTG_STATIC_LEN_OFFSET);
+		break;
+
+	case XTG_GET_STATIC_TRANSFERDONE:
+		rdval = (readl(tg->regs + XTG_STATIC_CNTL_OFFSET) &
+				XTG_STATIC_CNTL_TD_MASK);
+		break;
+
+	case XTG_GET_STREAM_ENABLE:
+		rdval = readl(tg->regs + XTG_STREAM_CNTL_OFFSET);
+		break;
+
+	case XTG_GET_STREAM_TRANSFERLEN:
+		rdval = (readl(tg->regs + XTG_STREAM_TL_OFFSET) &
+				XTG_STREAM_TL_TLEN_MASK);
+		break;
+
+	case XTG_GET_STREAM_TRANSFERCNT:
+		rdval = ((readl(tg->regs + XTG_STREAM_TL_OFFSET) &
+				XTG_STREAM_TL_TCNT_MASK) >>
+				XTG_STREAM_TL_TCNT_SHIFT);
+		break;
+
+	case XTG_GET_STREAM_TKTS1:
+		rdval = readl(tg->regs + XTG_STREAM_TKTS1_OFFSET);
+		break;
+	case XTG_GET_STREAM_TKTS2:
+		rdval = readl(tg->regs + XTG_STREAM_TKTS2_OFFSET);
+		break;
+	case XTG_GET_STREAM_TKTS3:
+		rdval = readl(tg->regs + XTG_STREAM_TKTS3_OFFSET);
+		break;
+	case XTG_GET_STREAM_TKTS4:
+		rdval = readl(tg->regs + XTG_STREAM_TKTS4_OFFSET);
+		break;
+
+	case XTG_GET_STREAM_CFG:
+		rdval = (readl(tg->regs + XTG_STREAM_CFG_OFFSET));
+		break;
+
+	case XTG_START_MASTER_LOGIC:
+		if (wrval)
+			writel(readl(tg->regs + XTG_MCNTL_OFFSET) |
+					XTG_MCNTL_MSTEN_MASK,
+				tg->regs + XTG_MCNTL_OFFSET);
+		break;
+
+	case XTG_MASTER_LOOP_EN:
+		if (wrval)
+			writel(readl(tg->regs + XTG_MCNTL_OFFSET) |
+					XTG_MCNTL_LOOPEN_MASK,
+				tg->regs + XTG_MCNTL_OFFSET);
+		else
+			writel(readl(tg->regs + XTG_MCNTL_OFFSET) &
+					~XTG_MCNTL_LOOPEN_MASK,
+				tg->regs + XTG_MCNTL_OFFSET);
+		break;
+
+	case XTG_SET_SLV_CTRL_REG:
+		writel(wrval, tg->regs + XTG_SCNTL_OFFSET);
+		break;
+
+	case XTG_ENABLE_ERRORS:
+		wrval &= XTG_ERR_ALL_ERRS_MASK;
+		writel(wrval, tg->regs + XTG_ERR_EN_OFFSET);
+		break;
+
+	case XTG_CLEAR_ERRORS:
+		wrval &= XTG_ERR_ALL_ERRS_MASK;
+		writel(readl(tg->regs + XTG_ERR_STS_OFFSET) | wrval,
+		       tg->regs + XTG_ERR_STS_OFFSET);
+		break;
+
+	case XTG_ENABLE_INTRS:
+		if (wrval & XTG_MASTER_CMP_INTR) {
+			pr_info("Enabling Master Complete Interrupt\n");
+			writel(readl(tg->regs + XTG_ERR_EN_OFFSET) |
+					XTG_ERR_EN_MSTIRQEN_MASK,
+				tg->regs + XTG_ERR_EN_OFFSET);
+		}
+		if (wrval & XTG_MASTER_ERR_INTR) {
+			pr_info("Enabling Interrupt on Master Errors\n");
+			writel(readl(tg->regs + XTG_MSTERR_INTR_OFFSET) |
+					XTG_MSTERR_INTR_MINTREN_MASK,
+				tg->regs + XTG_MSTERR_INTR_OFFSET);
+		}
+		if (wrval & XTG_SLAVE_ERR_INTR) {
+			pr_info("Enabling Interrupt on Slave Errors\n");
+			writel(readl(tg->regs + XTG_SCNTL_OFFSET) |
+					XTG_SCNTL_ERREN_MASK,
+				tg->regs + XTG_SCNTL_OFFSET);
+		}
+		break;
+
+	case XTG_CLEAR_MRAM:
+		xtg_access_rams(tg, tg->xtg_mram_offset,
+				XTG_MASTER_RAM_SIZE,
+				XTG_WRITE_RAM_ZERO, NULL);
+		break;
+
+	case XTG_CLEAR_CRAM:
+		xtg_access_rams(tg, XTG_COMMAND_RAM_OFFSET,
+				XTG_COMMAND_RAM_SIZE,
+				XTG_WRITE_RAM_ZERO, NULL);
+		break;
+
+	case XTG_CLEAR_PRAM:
+		xtg_access_rams(tg, XTG_PARAM_RAM_OFFSET,
+				XTG_PARAM_RAM_SIZE,
+				XTG_WRITE_RAM_ZERO, NULL);
+		break;
+
+	case XTG_SET_STATIC_ENABLE:
+		if (wrval) {
+			wrval &= XTG_STATIC_CNTL_STEN_MASK;
+			writel(readl(tg->regs + XTG_STATIC_CNTL_OFFSET) | wrval,
+			       tg->regs + XTG_STATIC_CNTL_OFFSET);
+		} else {
+			writel(readl(tg->regs + XTG_STATIC_CNTL_OFFSET) &
+				~XTG_STATIC_CNTL_STEN_MASK,
+				tg->regs + XTG_STATIC_CNTL_OFFSET);
+		}
+		break;
+
+	case XTG_SET_STATIC_BURSTLEN:
+		writel(wrval, tg->regs + XTG_STATIC_LEN_OFFSET);
+		break;
+
+	case XTG_SET_STATIC_TRANSFERDONE:
+		wrval |= XTG_STATIC_CNTL_TD_MASK;
+		writel(readl(tg->regs + XTG_STATIC_CNTL_OFFSET) | wrval,
+		       tg->regs + XTG_STATIC_CNTL_OFFSET);
+		break;
+
+	case XTG_SET_STREAM_ENABLE:
+		if (wrval) {
+			rdval = readl(tg->regs + XTG_STREAM_CNTL_OFFSET);
+			rdval |= XTG_STREAM_CNTL_STEN_MASK,
+			writel(rdval,
+			       tg->regs + XTG_STREAM_CNTL_OFFSET);
+		} else {
+			writel(readl(tg->regs + XTG_STREAM_CNTL_OFFSET) &
+			       ~XTG_STREAM_CNTL_STEN_MASK,
+			       tg->regs + XTG_STREAM_CNTL_OFFSET);
+		}
+		break;
+
+	case XTG_SET_STREAM_TRANSFERLEN:
+		wrval &= XTG_STREAM_TL_TLEN_MASK;
+		rdval = readl(tg->regs + XTG_STREAM_TL_OFFSET);
+		rdval &= ~XTG_STREAM_TL_TLEN_MASK;
+		writel(rdval | wrval,
+		       tg->regs + XTG_STREAM_TL_OFFSET);
+		break;
+
+	case XTG_SET_STREAM_TRANSFERCNT:
+		wrval = ((wrval << XTG_STREAM_TL_TCNT_SHIFT) &
+				XTG_STREAM_TL_TCNT_MASK);
+		rdval = readl(tg->regs + XTG_STREAM_TL_OFFSET);
+		rdval = rdval & ~XTG_STREAM_TL_TCNT_MASK;
+		writel(rdval | wrval,
+		       tg->regs + XTG_STREAM_TL_OFFSET);
+		break;
+
+	case XTG_SET_STREAM_TKTS1:
+		writel(wrval, tg->regs + XTG_STREAM_TKTS1_OFFSET);
+		break;
+	case XTG_SET_STREAM_TKTS2:
+		writel(wrval, tg->regs + XTG_STREAM_TKTS2_OFFSET);
+		break;
+	case XTG_SET_STREAM_TKTS3:
+		writel(wrval, tg->regs + XTG_STREAM_TKTS3_OFFSET);
+		break;
+	case XTG_SET_STREAM_TKTS4:
+		writel(wrval, tg->regs + XTG_STREAM_TKTS4_OFFSET);
+		break;
+
+	case XTG_SET_STREAM_CFG:
+		writel(wrval, tg->regs + XTG_STREAM_CFG_OFFSET);
+		break;
+
+	default:
+		break;
+	}
+
+	return rdval;
+}
+
+/* Sysfs functions */
+
+static ssize_t id_show(struct device *dev,
+		       struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_DEVICE_ID);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+static DEVICE_ATTR_RO(id);
+
+static ssize_t resource_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_RESOURCE);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+static DEVICE_ATTR_RO(resource);
+
+static ssize_t master_start_stop_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_MASTER_CMP_STS);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t master_start_stop_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_START_MASTER_LOGIC);
+
+	return size;
+}
+static DEVICE_ATTR_RW(master_start_stop);
+
+static ssize_t config_slave_status_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_SLV_CTRL_REG);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+
+static ssize_t config_slave_status_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_SLV_CTRL_REG);
+
+	return size;
+}
+static DEVICE_ATTR_RW(config_slave_status);
+
+static ssize_t err_sts_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_ERR_STS);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+
+static ssize_t err_sts_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_CLEAR_ERRORS);
+
+	return size;
+}
+static DEVICE_ATTR_RW(err_sts);
+
+static ssize_t err_en_store(struct device *dev,
+			    struct device_attribute *attr, const char *buf,
+			    size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_ENABLE_ERRORS);
+
+	return size;
+}
+static DEVICE_ATTR_WO(err_en);
+
+static ssize_t intr_en_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_ENABLE_INTRS);
+
+	return size;
+}
+static DEVICE_ATTR_WO(intr_en);
+
+static ssize_t last_valid_index_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_LAST_VALID_INDEX);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+static DEVICE_ATTR_RO(last_valid_index);
+
+static ssize_t config_sts_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_CFG_STS);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+static DEVICE_ATTR_RO(config_sts);
+
+static ssize_t mram_clear_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_CLEAR_MRAM);
+
+	return size;
+}
+static DEVICE_ATTR_WO(mram_clear);
+
+static ssize_t cram_clear_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_CLEAR_CRAM);
+
+	return size;
+}
+static DEVICE_ATTR_WO(cram_clear);
+
+static ssize_t pram_clear_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_CLEAR_CRAM);
+
+	return size;
+}
+static DEVICE_ATTR_WO(pram_clear);
+
+static ssize_t static_enable_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STATIC_ENABLE);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+
+static ssize_t static_enable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STATIC_ENABLE);
+
+	return size;
+}
+static DEVICE_ATTR_RW(static_enable);
+
+static ssize_t static_burstlen_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STATIC_BURSTLEN);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t static_burstlen_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STATIC_BURSTLEN);
+
+	return size;
+}
+static DEVICE_ATTR_RW(static_burstlen);
+
+static ssize_t stream_cfg_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_CFG);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_cfg_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_CFG);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_cfg);
+
+static ssize_t stream_tkts4_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TKTS4);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_tkts4_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TKTS4);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_tkts4);
+
+static ssize_t stream_tkts3_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TKTS3);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_tkts3_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TKTS3);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_tkts3);
+
+static ssize_t stream_tkts2_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TKTS2);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_tkts2_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TKTS2);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_tkts2);
+
+static ssize_t stream_tkts1_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TKTS1);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_tkts1_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TKTS1);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_tkts1);
+
+static ssize_t static_transferdone_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STATIC_TRANSFERDONE);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t static_transferdone_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STATIC_TRANSFERDONE);
+
+	return size;
+}
+static DEVICE_ATTR_RW(static_transferdone);
+
+static ssize_t reset_static_transferdone_show(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STATIC_TRANSFERDONE);
+
+	if (rdval == XTG_STATIC_CNTL_RESET_MASK)
+		rdval = 1;
+	else
+		rdval = 0;
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+static DEVICE_ATTR_RO(reset_static_transferdone);
+
+static ssize_t stream_enable_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_ENABLE);
+
+	return snprintf(buf, PAGE_SIZE, "0x%08zx\n", rdval);
+}
+
+static ssize_t stream_enable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_ENABLE);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_enable);
+
+static ssize_t stream_transferlen_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TRANSFERLEN);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_transferlen_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TRANSFERLEN);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_transferlen);
+
+static ssize_t stream_transfercnt_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_STREAM_TRANSFERCNT);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t stream_transfercnt_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_SET_STREAM_TRANSFERCNT);
+
+	return size;
+}
+static DEVICE_ATTR_RW(stream_transfercnt);
+
+static ssize_t loop_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	ssize_t rdval = xtg_sysfs_ioctl(dev, buf, XTG_GET_MASTER_LOOP_EN);
+
+	return snprintf(buf, PAGE_SIZE, "%zd\n", rdval);
+}
+
+static ssize_t loop_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	xtg_sysfs_ioctl(dev, buf, XTG_MASTER_LOOP_EN);
+
+	return size;
+}
+static DEVICE_ATTR_RW(loop_enable);
+
+static ssize_t xtg_pram_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr,
+			     char *buf, loff_t off, size_t count)
+{
+	pr_info("No read access to Parameter RAM\n");
+
+	return 0;
+}
+
+static ssize_t xtg_pram_write(struct file *filp, struct kobject *kobj,
+			      struct bin_attribute *bin_attr,
+			      char *buf, loff_t off, size_t count)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+	u32 *data = (u32 *)buf;
+
+	if (off >= XTG_PARAM_RAM_SIZE) {
+		pr_err("Requested Write len exceeds 2K PRAM size\n");
+		return -ENOMEM;
+	}
+
+	if (count >= XTG_PARAM_RAM_SIZE)
+		count = XTG_PARAM_RAM_SIZE;
+
+	/* Program each command */
+	if (count == sizeof(struct xtg_pram)) {
+		struct xtg_pram *cmdp = (struct xtg_pram *)buf;
+		u32 param_word;
+
+		if (!cmdp)
+			return -EINVAL;
+
+		if (cmdp->is_valid_req == VALID_SIG) {
+			/* Prepare parameter word */
+			xtg_prepare_param_word(tg, cmdp, &param_word);
+
+			count = XTG_PRAM_BYTES_PER_ENTRY;
+			data = &param_word;
+
+			/* Maximum command entries are 256 */
+			if (cmdp->index > MAX_NUM_ENTRIES)
+				return -EINVAL;
+
+			/* Calculate the block index */
+			if (cmdp->is_write_block)
+				off = XTG_PRM_RAM_BLOCK_SIZE +
+						cmdp->index * count;
+			else
+				off = cmdp->index * count;
+		}
+	}
+
+	off += XTG_PARAM_RAM_OFFSET;
+	xtg_access_rams(tg, off, count, XTG_WRITE_RAM, data);
+
+	return count;
+}
+
+static int xtg_pram_mmap(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *attr,
+			 struct vm_area_struct *vma)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+	int ret;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_flags |= VM_IO;
+
+	ret = remap_pfn_range(vma, vma->vm_start, (tg->phys_base_addr +
+			XTG_PARAM_RAM_OFFSET) >> PAGE_SHIFT,
+			XTG_PARAM_RAM_SIZE, vma->vm_page_prot);
+	return ret;
+}
+
+static struct bin_attribute xtg_pram_attr = {
+	.attr =	{
+		.name = "parameter_ram",
+		.mode = 0644,
+	},
+	.size = XTG_PARAM_RAM_SIZE,
+	.read = xtg_pram_read,
+	.write = xtg_pram_write,
+	.mmap = xtg_pram_mmap,
+};
+
+static ssize_t xtg_cram_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr,
+			     char *buf, loff_t off, size_t count)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+
+	off += XTG_COMMAND_RAM_OFFSET;
+	xtg_access_rams(tg, off, count, XTG_READ_RAM, (u32 *)buf);
+
+	return count;
+}
+
+static ssize_t xtg_cram_write(struct file *filp, struct kobject *kobj,
+			      struct bin_attribute *bin_attr,
+			      char *buf, loff_t off, size_t count)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+	u32 *data = (u32 *)buf;
+
+	if (off >= XTG_COMMAND_RAM_SIZE) {
+		pr_err("Requested Write len exceeds 8K CRAM size\n");
+		return -ENOMEM;
+	}
+
+	/* Program each command */
+	if (count == sizeof(struct xtg_cram)) {
+		struct xtg_cram *cmdp = (struct xtg_cram *)buf;
+		u32 cmd_words[CMD_WDS + EXT_WDS];
+
+		if (!cmdp)
+			return -EINVAL;
+
+		if (cmdp->is_valid_req == VALID_SIG) {
+			/* Prepare command words */
+			xtg_prepare_cmd_words(tg, cmdp, cmd_words);
+			count = XTG_CRAM_BYTES_PER_ENTRY;
+			data = cmd_words;
+
+			/* Maximum command entries are 256 */
+			if (cmdp->index > MAX_NUM_ENTRIES)
+				return -EINVAL;
+
+			/* Calculate the block index */
+			if (cmdp->is_write_block)
+				off = XTG_CMD_RAM_BLOCK_SIZE +
+						cmdp->index * count;
+			else
+				off = cmdp->index * count;
+
+			/* Store the valid command index */
+			if (cmdp->valid_cmd) {
+				if (cmdp->is_write_block)
+					tg->last_wr_valid_idx =
+							cmdp->index;
+				else
+					tg->last_rd_valid_idx =
+							cmdp->index;
+			}
+		}
+	}
+
+	off += XTG_COMMAND_RAM_OFFSET;
+	xtg_access_rams(tg, off, count, XTG_WRITE_RAM, data);
+
+	return count;
+}
+
+static int xtg_cram_mmap(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *attr,
+			 struct vm_area_struct *vma)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+	int ret;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_flags |= VM_IO;
+
+	ret = remap_pfn_range(vma, vma->vm_start, (tg->phys_base_addr +
+			XTG_COMMAND_RAM_OFFSET) >> PAGE_SHIFT,
+			XTG_COMMAND_RAM_SIZE + XTG_EXTCMD_RAM_SIZE,
+			vma->vm_page_prot);
+	return ret;
+}
+
+static struct bin_attribute xtg_cram_attr = {
+	.attr =	{
+		.name = "command_ram",
+		.mode = 0644,
+	},
+	.size = XTG_COMMAND_RAM_SIZE,
+	.read = xtg_cram_read,
+	.write = xtg_cram_write,
+	.mmap = xtg_cram_mmap,
+};
+
+static ssize_t xtg_mram_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr,
+			     char *buf, loff_t off, size_t count)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+
+	off += tg->xtg_mram_offset;
+	xtg_access_rams(tg, off, count, XTG_READ_RAM, (u32 *)buf);
+
+	return count;
+}
+
+static ssize_t xtg_mram_write(struct file *filp, struct kobject *kobj,
+			      struct bin_attribute *bin_attr,
+			      char *buf, loff_t off, size_t count)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+
+	if (off >= XTG_MASTER_RAM_SIZE) {
+		pr_err("Requested Write len exceeds 8K MRAM size\n");
+		return -ENOMEM;
+	}
+
+	off += tg->xtg_mram_offset;
+	xtg_access_rams(tg, off, count, XTG_WRITE_RAM, (u32 *)buf);
+
+	return count;
+}
+
+static int xtg_mram_mmap(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *attr,
+			 struct vm_area_struct *vma)
+{
+	struct xtg_dev_info *tg =
+		to_xtg_dev_info(container_of(kobj, struct device, kobj));
+	int ret;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_flags |= VM_IO;
+
+	ret = remap_pfn_range(vma, vma->vm_start, (tg->phys_base_addr +
+			tg->xtg_mram_offset) >> PAGE_SHIFT,
+			XTG_MASTER_RAM_SIZE,
+			vma->vm_page_prot);
+	return ret;
+}
+
+static struct bin_attribute xtg_mram_attr = {
+	.attr =	{
+		.name = "master_ram",
+		.mode = 0644,
+	},
+	.size = XTG_MASTER_RAM_SIZE,
+	.read = xtg_mram_read,
+	.write = xtg_mram_write,
+	.mmap = xtg_mram_mmap,
+};
+
+static struct bin_attribute *xtg_bin_attrs[] = {
+	&xtg_mram_attr,
+	&xtg_pram_attr,
+	&xtg_cram_attr,
+	NULL,
+};
+
+static const struct attribute *xtg_attrs[] = {
+	&dev_attr_id.attr,
+	&dev_attr_resource.attr,
+	&dev_attr_master_start_stop.attr,
+	&dev_attr_config_slave_status.attr,
+	&dev_attr_err_en.attr,
+	&dev_attr_err_sts.attr,
+	&dev_attr_intr_en.attr,
+	&dev_attr_last_valid_index.attr,
+	&dev_attr_config_sts.attr,
+	&dev_attr_mram_clear.attr,
+	&dev_attr_cram_clear.attr,
+	&dev_attr_pram_clear.attr,
+	&dev_attr_static_enable.attr,
+	&dev_attr_static_burstlen.attr,
+	&dev_attr_static_transferdone.attr,
+	&dev_attr_stream_transfercnt.attr,
+	&dev_attr_stream_transferlen.attr,
+	&dev_attr_stream_tkts1.attr,
+	&dev_attr_stream_tkts2.attr,
+	&dev_attr_stream_tkts3.attr,
+	&dev_attr_stream_tkts4.attr,
+	&dev_attr_stream_cfg.attr,
+	&dev_attr_stream_enable.attr,
+	&dev_attr_reset_static_transferdone.attr,
+	&dev_attr_loop_enable.attr,
+	NULL,
+};
+
+static const struct attribute_group xtg_attributes = {
+	.attrs = (struct attribute **)xtg_attrs,
+	.bin_attrs = xtg_bin_attrs,
+};
+
+/**
+ * xtg_cmp_intr_handler - Master Complete Interrupt handler
+ * @irq: IRQ number
+ * @data: Pointer to the xtg_dev_info structure
+ *
+ * Return: IRQ_HANDLED always
+ */
+static irqreturn_t xtg_cmp_intr_handler(int irq, void *data)
+{
+	struct xtg_dev_info *tg = (struct xtg_dev_info *)data;
+
+	writel(readl(tg->regs + XTG_ERR_STS_OFFSET) |
+	       XTG_ERR_STS_MSTDONE_MASK, tg->regs + XTG_ERR_STS_OFFSET);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * xtg_err_intr_handler - Master/Slave Error Interrupt handler
+ * @irq: IRQ number
+ * @data: Pointer to the xtg_dev_info structure
+ *
+ * Return: IRQ_HANDLED always
+ */
+static irqreturn_t xtg_err_intr_handler(int irq, void *data)
+{
+	struct xtg_dev_info *tg = (struct xtg_dev_info *)data;
+	u32 value;
+
+	value = readl(tg->regs + XTG_ERR_STS_OFFSET) &
+		      XTG_ERR_ALL_ERRS_MASK;
+
+	if (value) {
+		dev_err(tg->dev, "Found errors 0x%08x\n", value);
+		writel(readl(tg->regs + XTG_ERR_STS_OFFSET) | value,
+		       tg->regs + XTG_ERR_STS_OFFSET);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * xtg_probe - Driver probe function
+ * @pdev: Pointer to the platform_device structure
+ *
+ * This is the driver probe routine. It does all the memory
+ * allocation and creates sysfs entries for the device.
+ *
+ * Return: 0 on success and failure value on error
+ */
+static int xtg_probe(struct platform_device *pdev)
+{
+	struct xtg_dev_info *tg;
+	struct device_node *node;
+	struct resource *res;
+	struct device *dev;
+	int err, irq, var;
+
+	tg = devm_kzalloc(&pdev->dev, sizeof(*tg), GFP_KERNEL);
+	if (!tg)
+		return -ENOMEM;
+
+	tg->dev = &pdev->dev;
+	dev = tg->dev;
+	node = pdev->dev.of_node;
+
+	/* Map the registers */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	tg->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tg->regs))
+		return PTR_ERR(tg->regs);
+
+	/* Save physical base address */
+	tg->phys_base_addr = res->start;
+
+	/* Get the device instance id */
+	err = of_property_read_u32(node, "xlnx,device-id", &tg->id);
+	if (err < 0) {
+		dev_err(&pdev->dev, "unable to read property");
+		return err;
+	}
+
+	/* Map the error interrupt, if it exists in the device tree. */
+	irq = platform_get_irq_byname(pdev, "err-out");
+	if (irq < 0) {
+		dev_dbg(&pdev->dev, "unable to get err irq");
+	} else {
+		err = devm_request_irq(&pdev->dev, irq, xtg_err_intr_handler,
+				       0, dev_name(&pdev->dev), tg);
+		if (err < 0) {
+			dev_err(&pdev->dev, "unable to request irq %d", irq);
+			return err;
+		}
+	}
+
+	/* Map the completion interrupt, if it exists in the device tree. */
+	irq = platform_get_irq_byname(pdev, "irq-out");
+	if (irq < 0) {
+		dev_dbg(&pdev->dev, "unable to get cmp irq");
+	} else {
+		err = devm_request_irq(&pdev->dev, irq, xtg_cmp_intr_handler,
+				       0, dev_name(&pdev->dev), tg);
+		if (err < 0) {
+			dev_err(&pdev->dev, "unable to request irq %d", irq);
+			return err;
+		}
+	}
+
+	tg->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(tg->clk)) {
+		if (PTR_ERR(tg->clk) != -ENOENT) {
+			if (PTR_ERR(tg->clk) != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "input clock not found\n");
+			return PTR_ERR(tg->clk);
+		}
+		tg->clk = NULL;
+	}
+
+	err = clk_prepare_enable(tg->clk);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return err;
+	}
+
+	/*
+	 * Create sysfs file entries for the device
+	 */
+	err = sysfs_create_group(&dev->kobj, &xtg_attributes);
+	if (err < 0) {
+		dev_err(tg->dev, "unable to create sysfs entries\n");
+		clk_disable_unprepare(tg->clk);
+		return err;
+	}
+
+	/*
+	 * Initialize the write and read valid index values.
+	 * Possible range of values for these variables is <0 255>.
+	 */
+	tg->last_wr_valid_idx = -1;
+	tg->last_rd_valid_idx = -1;
+
+	dev_set_drvdata(&pdev->dev, tg);
+
+	/* Update the Proper MasterRam offset */
+	tg->xtg_mram_offset = XTG_MASTER_RAM_OFFSET;
+	var = readl(tg->regs + XTG_MCNTL_OFFSET) >> XTG_MCNTL_REV_SHIFT;
+	if (var == XTG_INIT_VERSION)
+		tg->xtg_mram_offset = XTG_MASTER_RAM_INIT_OFFSET;
+
+	dev_info(&pdev->dev, "Probing xilinx traffic generator success\n");
+
+	return 0;
+}
+
+/**
+ * xtg_remove - Driver remove function
+ * @pdev: Pointer to the platform_device structure
+ *
+ * This function frees all the resources allocated to the device.
+ *
+ * Return: 0 always
+ */
+static int xtg_remove(struct platform_device *pdev)
+{
+	struct xtg_dev_info *tg;
+	struct device *dev;
+
+	tg = dev_get_drvdata(&pdev->dev);
+	dev = tg->dev;
+	sysfs_remove_group(&dev->kobj, &xtg_attributes);
+	clk_disable_unprepare(tg->clk);
+
+	return 0;
+}
+
+static const struct of_device_id xtg_of_match[] = {
+	{ .compatible = "xlnx,axi-traffic-gen", },
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, xtg_of_match);
+
+static struct platform_driver xtg_driver = {
+	.driver = {
+		.name = "xilinx-trafgen",
+		.of_match_table = xtg_of_match,
+	},
+	.probe = xtg_probe,
+	.remove = xtg_remove,
+};
+
+module_platform_driver(xtg_driver);
+
+MODULE_AUTHOR("Xilinx Inc.");
+MODULE_DESCRIPTION("Xilinx Traffic Generator driver");
+MODULE_LICENSE("GPL");
-- 
2.1.1

