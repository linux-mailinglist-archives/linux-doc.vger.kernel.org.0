Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FE99E51C
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2019 12:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfH0KAh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Aug 2019 06:00:37 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:63472 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727633AbfH0KAg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Aug 2019 06:00:36 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7R9tAVC014777;
        Tue, 27 Aug 2019 03:00:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0818;
 bh=0378haLIb72PJrqQjEVfa0u6COwfUb+r7B/6R9GqokU=;
 b=lL36sXuxzch3FEm71Q+dB2q4eIBytiZajUpLZGQ8oiAbHDl5hMsfKjIKgvZzeDDwK0w/
 eUggn9TSeTq2GfwpUAR2f0YZXGCPH4te/Y6xH9rSDF34DAvcmZ1HNy8MNBOEvGcvN92n
 L9jwjtHq+n84GmBS2OkVOaNGWvLLI0y1EIjb9whZGxCoxqkX9cneom7YNxc3h4GjKDwA
 86qElh4jJiaHIXA2Wh6wbh1SZuiJTVdswMUXXGpF7iJdKMCAwC5vuNoZAdm4g3DCQbX+
 eQpjOEY3HVMEBvrhcOc4YAzEEZA82PmsrjK6lDbT0BdBbKAYsDGQ/tQHtSXB+yNrIA9q Zg== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
        by mx0b-0016f401.pphosted.com with ESMTP id 2uk4rkj2c0-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 27 Aug 2019 03:00:19 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 27 Aug
 2019 03:00:18 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (104.47.32.59) by
 SC-EXCH04.marvell.com (10.93.176.84) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 27 Aug 2019 03:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIZ1YfIVcJ8fEhDcZmcS/x/4zTUp8XWeIPojIg2pHseqrUHdJQVfH3YAwP/OG/rmcTwzoe74Uds1m6E11l98v1ft8qwYBodUmU1NdZ0wVihKrCyo726Gbbzwhce00Sk3AbjG+3Y56XeceRif2pF4ZpuLMzL7cXn/gYjocSzAI6/vFqKbcHCVSDloe8xTin8UFQwzl837oNHVkX0SB6gHVW7fQrF6UAebfqMXcdsXIDZF88cDYYRKENXXuu1oXizMXCx40GmbpjqejaPZ4K3xLieNwgzL7R3aK4LJafIQw1aal8J8JVNZWPHq1EwVDCN/FRz5d+ND6VmW7zlsYV8dbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0378haLIb72PJrqQjEVfa0u6COwfUb+r7B/6R9GqokU=;
 b=bTNNaT5Dcxzd898RKPJ/qUkv89wh6eEWF+PKH8xU01qgDaCEd+6E5ni79OeaoHP9aOEfV72kPqzjnNcdX7/y19JqjnaXcjRmS0iHWaFqKBamMKpFKfP38Ha0ZNWNvxxGmReTCnfEjCXyfhL3oHEIrLfwHyDQUDkQ/2/T9CQma+XZoCoUlUoXLQ/DKk5OArzy4YIUJPQWLrpoNKqzwJj2C0d8NDOhne2/c4bSnb+bPeDSdIq6fm1yN1Y6etONWQbjPB4z4dn+7ewixr3Q9YM9WTwoj0GvGalN0BDqpLMxwxqtZt+R3GKQ9l+QKKjcrnOxxt3GT5xMVaWyRwEKapooWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector2-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0378haLIb72PJrqQjEVfa0u6COwfUb+r7B/6R9GqokU=;
 b=TYhszhCsygZB4EeZXiTgycaCoNcOcgYbo+53qyDrJl0qauRXsQJEjsgWeF6P5edN6cJyqM7P31BAe8HZfXYiNvqLp8xB81gj6Yd5Fg2c/O1k6V9dYXtsIABuIxOX5098gOrciyNRCMNklhp92cFJ6CfAphT7tOlpIGghIci0ipM=
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
 DM5PR18MB1675.namprd18.prod.outlook.com (10.175.224.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 10:00:16 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
 ([fe80::3cbf:34d2:5b36:e127]) by DM5PR18MB1355.namprd18.prod.outlook.com
 ([fe80::3cbf:34d2:5b36:e127%12]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 10:00:16 +0000
From:   Ganapatrao Kulkarni <gkulkarni@marvell.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "will@kernel.org" <will@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "Jayachandran Chandrasekharan Nair" <jnair@marvell.com>,
        Robert Richter <rrichter@marvell.com>,
        Jan Glauber <jglauber@marvell.com>,
        "gklkml16@gmail.com" <gklkml16@gmail.com>
Subject: [PATCH v4 2/2] drivers/perf: Add CCPI2 PMU support in ThunderX2
 UNCORE driver.
Thread-Topic: [PATCH v4 2/2] drivers/perf: Add CCPI2 PMU support in ThunderX2
 UNCORE driver.
Thread-Index: AQHVXL46oZYwh/XuRUGtr0Udu4xvlQ==
Date:   Tue, 27 Aug 2019 10:00:16 +0000
Message-ID: <1566899990-18277-3-git-send-email-gkulkarni@marvell.com>
References: <1566899990-18277-1-git-send-email-gkulkarni@marvell.com>
In-Reply-To: <1566899990-18277-1-git-send-email-gkulkarni@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To DM5PR18MB1355.namprd18.prod.outlook.com
 (2603:10b6:3:14a::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.8.3.1
x-originating-ip: [199.233.59.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a325350c-dfc9-4359-46a1-08d72ad55be8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR18MB1675;
x-ms-traffictypediagnostic: DM5PR18MB1675:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB16754827EBD1B0908EBB9001B2A00@DM5PR18MB1675.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(7736002)(53946003)(8936002)(305945005)(4720700003)(8676002)(50226002)(81166006)(81156014)(66476007)(66446008)(5660300002)(64756008)(66556008)(6486002)(4326008)(2501003)(102836004)(14454004)(386003)(6506007)(26005)(186003)(6436002)(76176011)(99286004)(6512007)(52116002)(86362001)(2201001)(110136005)(53936002)(256004)(486006)(54906003)(316002)(6116002)(3846002)(66946007)(25786009)(476003)(71190400001)(71200400001)(11346002)(30864003)(14444005)(446003)(36756003)(66066001)(478600001)(2616005)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR18MB1675;H:DM5PR18MB1355.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ghlDMrfiFtwoxFkxExEyXj922a46v0ZUKriEzMzDNBsnaPwuQF8GpVXSSjcmN3Sqy4n8M7u137fOLm+QmMmCrT825Lrznt9tX5WefHWzljdkE1k+gsWZQWVR3hjEkqy61v/4cqv0Hq3NsY7p8A7FdRTN2bGoBsuKil9Zv58XYHLA2odtZGUhLgJ4iugGlHga112U/+I9JfBZvl16O4GG4HSkSfD0bhZulERdHotXFQnwqzHhX8OXT7MjyUWlnlNRTxO+qdAWob094tPR6zQvdCOwVpvnl5y5ICMEPHOoxgAMnQWxmsCTcvKpNHQrTFmuTJVXZ7xQaFdyEv7a2nshArwqievQPXbCjgY0U0EO5FANxIYGX3FBAAhGkAviUfZ63jdFC1w0A5JH9uZEF1Mr8AR9EKcqTmdF5QiDiXWfIA8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a325350c-dfc9-4359-46a1-08d72ad55be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 10:00:16.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjLASeQFPEwfbbSb1QWR4hZ10f0rl71YuxPXi2tELgFePCqF3/8mCzIoURHrMUeqYiZN5BtVdD/NhEvl+z8e4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1675
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-27_01:2019-08-26,2019-08-27 signatures=0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CCPI2 is a low-latency high-bandwidth serial interface for inter socket
connectivity of ThunderX2 processors.

CCPI2 PMU supports up to 8 counters per socket. Counters are
independently programmable to different events and can be started and
stopped individually. The CCPI2 counters are 64-bit and do not overflow
in normal operation.

Signed-off-by: Ganapatrao Kulkarni <gkulkarni@marvell.com>
---
 drivers/perf/thunderx2_pmu.c | 258 ++++++++++++++++++++++++++++++-----
 1 file changed, 225 insertions(+), 33 deletions(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 43d76c85da56..d290d8ebbd53 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -16,23 +16,36 @@
  * they need to be sampled before overflow(i.e, at every 2 seconds).
  */
=20
-#define TX2_PMU_MAX_COUNTERS		4
+#define TX2_PMU_DMC_L3C_MAX_COUNTERS	4
+#define TX2_PMU_CCPI2_MAX_COUNTERS	8
+#define TX2_PMU_MAX_COUNTERS		TX2_PMU_CCPI2_MAX_COUNTERS
+
+
 #define TX2_PMU_DMC_CHANNELS		8
 #define TX2_PMU_L3_TILES		16
=20
 #define TX2_PMU_HRTIMER_INTERVAL	(2 * NSEC_PER_SEC)
-#define GET_EVENTID(ev)			((ev->hw.config) & 0x1f)
-#define GET_COUNTERID(ev)		((ev->hw.idx) & 0x3)
+#define GET_EVENTID(ev, mask)		((ev->hw.config) & mask)
+#define GET_COUNTERID(ev, mask)		((ev->hw.idx) & mask)
  /* 1 byte per counter(4 counters).
   * Event id is encoded in bits [5:1] of a byte,
   */
 #define DMC_EVENT_CFG(idx, val)		((val) << (((idx) * 8) + 1))
=20
+/* bits[3:0] to select counters, are indexed from 8 to 15. */
+#define CCPI2_COUNTER_OFFSET		8
+
 #define L3C_COUNTER_CTL			0xA8
 #define L3C_COUNTER_DATA		0xAC
 #define DMC_COUNTER_CTL			0x234
 #define DMC_COUNTER_DATA		0x240
=20
+#define CCPI2_PERF_CTL			0x108
+#define CCPI2_COUNTER_CTL		0x10C
+#define CCPI2_COUNTER_SEL		0x12c
+#define CCPI2_COUNTER_DATA_L		0x130
+#define CCPI2_COUNTER_DATA_H		0x134
+
 /* L3C event IDs */
 #define L3_EVENT_READ_REQ		0xD
 #define L3_EVENT_WRITEBACK_REQ		0xE
@@ -51,15 +64,28 @@
 #define DMC_EVENT_READ_TXNS		0xF
 #define DMC_EVENT_MAX			0x10
=20
+#define CCPI2_EVENT_REQ_PKT_SENT	0x3D
+#define CCPI2_EVENT_SNOOP_PKT_SENT	0x65
+#define CCPI2_EVENT_DATA_PKT_SENT	0x105
+#define CCPI2_EVENT_GIC_PKT_SENT	0x12D
+#define CCPI2_EVENT_MAX			0x200
+
+#define CCPI2_PERF_CTL_ENABLE		BIT(0)
+#define CCPI2_PERF_CTL_START		BIT(1)
+#define CCPI2_PERF_CTL_RESET		BIT(4)
+#define CCPI2_EVENT_LEVEL_RISING_EDGE	BIT(10)
+#define CCPI2_EVENT_TYPE_EDGE_SENSITIVE	BIT(11)
+
 enum tx2_uncore_type {
 	PMU_TYPE_L3C,
 	PMU_TYPE_DMC,
+	PMU_TYPE_CCPI2,
 	PMU_TYPE_INVALID,
 };
=20
 /*
- * pmu on each socket has 2 uncore devices(dmc and l3c),
- * each device has 4 counters.
+ * Each socket has 3 uncore devices associated with a PMU. The DMC and
+ * L3C have 4 32-bit counters and the CCPI2 has 8 64-bit counters.
  */
 struct tx2_uncore_pmu {
 	struct hlist_node hpnode;
@@ -69,8 +95,10 @@ struct tx2_uncore_pmu {
 	int node;
 	int cpu;
 	u32 max_counters;
+	u32 counters_mask;
 	u32 prorate_factor;
 	u32 max_events;
+	u32 events_mask;
 	u64 hrtimer_interval;
 	void __iomem *base;
 	DECLARE_BITMAP(active_counters, TX2_PMU_MAX_COUNTERS);
@@ -92,7 +120,21 @@ static inline struct tx2_uncore_pmu *pmu_to_tx2_pmu(str=
uct pmu *pmu)
 	return container_of(pmu, struct tx2_uncore_pmu, pmu);
 }
=20
-PMU_FORMAT_ATTR(event,	"config:0-4");
+#define TX2_PMU_FORMAT_ATTR(_var, _name, _format)			\
+static ssize_t								\
+__tx2_pmu_##_var##_show(struct device *dev,				\
+			       struct device_attribute *attr,		\
+			       char *page)				\
+{									\
+	BUILD_BUG_ON(sizeof(_format) >=3D PAGE_SIZE);			\
+	return sprintf(page, _format "\n");				\
+}									\
+									\
+static struct device_attribute format_attr_##_var =3D			\
+	__ATTR(_name, 0444, __tx2_pmu_##_var##_show, NULL)
+
+TX2_PMU_FORMAT_ATTR(event, event, "config:0-4");
+TX2_PMU_FORMAT_ATTR(event_ccpi2, event, "config:0-9");
=20
 static struct attribute *l3c_pmu_format_attrs[] =3D {
 	&format_attr_event.attr,
@@ -104,6 +146,11 @@ static struct attribute *dmc_pmu_format_attrs[] =3D {
 	NULL,
 };
=20
+static struct attribute *ccpi2_pmu_format_attrs[] =3D {
+	&format_attr_event_ccpi2.attr,
+	NULL,
+};
+
 static const struct attribute_group l3c_pmu_format_attr_group =3D {
 	.name =3D "format",
 	.attrs =3D l3c_pmu_format_attrs,
@@ -114,6 +161,11 @@ static const struct attribute_group dmc_pmu_format_att=
r_group =3D {
 	.attrs =3D dmc_pmu_format_attrs,
 };
=20
+static const struct attribute_group ccpi2_pmu_format_attr_group =3D {
+	.name =3D "format",
+	.attrs =3D ccpi2_pmu_format_attrs,
+};
+
 /*
  * sysfs event attributes
  */
@@ -164,6 +216,19 @@ static struct attribute *dmc_pmu_events_attrs[] =3D {
 	NULL,
 };
=20
+TX2_EVENT_ATTR(req_pktsent, CCPI2_EVENT_REQ_PKT_SENT);
+TX2_EVENT_ATTR(snoop_pktsent, CCPI2_EVENT_SNOOP_PKT_SENT);
+TX2_EVENT_ATTR(data_pktsent, CCPI2_EVENT_DATA_PKT_SENT);
+TX2_EVENT_ATTR(gic_pktsent, CCPI2_EVENT_GIC_PKT_SENT);
+
+static struct attribute *ccpi2_pmu_events_attrs[] =3D {
+	&tx2_pmu_event_attr_req_pktsent.attr.attr,
+	&tx2_pmu_event_attr_snoop_pktsent.attr.attr,
+	&tx2_pmu_event_attr_data_pktsent.attr.attr,
+	&tx2_pmu_event_attr_gic_pktsent.attr.attr,
+	NULL,
+};
+
 static const struct attribute_group l3c_pmu_events_attr_group =3D {
 	.name =3D "events",
 	.attrs =3D l3c_pmu_events_attrs,
@@ -174,6 +239,11 @@ static const struct attribute_group dmc_pmu_events_att=
r_group =3D {
 	.attrs =3D dmc_pmu_events_attrs,
 };
=20
+static const struct attribute_group ccpi2_pmu_events_attr_group =3D {
+	.name =3D "events",
+	.attrs =3D ccpi2_pmu_events_attrs,
+};
+
 /*
  * sysfs cpumask attributes
  */
@@ -213,6 +283,13 @@ static const struct attribute_group *dmc_pmu_attr_grou=
ps[] =3D {
 	NULL
 };
=20
+static const struct attribute_group *ccpi2_pmu_attr_groups[] =3D {
+	&ccpi2_pmu_format_attr_group,
+	&pmu_cpumask_attr_group,
+	&ccpi2_pmu_events_attr_group,
+	NULL
+};
+
 static inline u32 reg_readl(unsigned long addr)
 {
 	return readl((void __iomem *)addr);
@@ -245,33 +322,58 @@ static void init_cntr_base_l3c(struct perf_event *eve=
nt,
 		struct tx2_uncore_pmu *tx2_pmu)
 {
 	struct hw_perf_event *hwc =3D &event->hw;
+	u32 cmask;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	cmask =3D tx2_pmu->counters_mask;
=20
 	/* counter ctrl/data reg offset at 8 */
 	hwc->config_base =3D (unsigned long)tx2_pmu->base
-		+ L3C_COUNTER_CTL + (8 * GET_COUNTERID(event));
+		+ L3C_COUNTER_CTL + (8 * GET_COUNTERID(event, cmask));
 	hwc->event_base =3D  (unsigned long)tx2_pmu->base
-		+ L3C_COUNTER_DATA + (8 * GET_COUNTERID(event));
+		+ L3C_COUNTER_DATA + (8 * GET_COUNTERID(event, cmask));
 }
=20
 static void init_cntr_base_dmc(struct perf_event *event,
 		struct tx2_uncore_pmu *tx2_pmu)
 {
 	struct hw_perf_event *hwc =3D &event->hw;
+	u32 cmask;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	cmask =3D tx2_pmu->counters_mask;
=20
 	hwc->config_base =3D (unsigned long)tx2_pmu->base
 		+ DMC_COUNTER_CTL;
 	/* counter data reg offset at 0xc */
 	hwc->event_base =3D (unsigned long)tx2_pmu->base
-		+ DMC_COUNTER_DATA + (0xc * GET_COUNTERID(event));
+		+ DMC_COUNTER_DATA + (0xc * GET_COUNTERID(event, cmask));
+}
+
+static void init_cntr_base_ccpi2(struct perf_event *event,
+		struct tx2_uncore_pmu *tx2_pmu)
+{
+	struct hw_perf_event *hwc =3D &event->hw;
+	u32 cmask;
+
+	cmask =3D tx2_pmu->counters_mask;
+
+	hwc->config_base =3D (unsigned long)tx2_pmu->base
+		+ CCPI2_COUNTER_CTL + (4 * GET_COUNTERID(event, cmask));
+	hwc->event_base =3D  (unsigned long)tx2_pmu->base;
 }
=20
 static void uncore_start_event_l3c(struct perf_event *event, int flags)
 {
-	u32 val;
+	u32 val, emask;
 	struct hw_perf_event *hwc =3D &event->hw;
+	struct tx2_uncore_pmu *tx2_pmu;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	emask =3D tx2_pmu->events_mask;
=20
 	/* event id encoded in bits [07:03] */
-	val =3D GET_EVENTID(event) << 3;
+	val =3D GET_EVENTID(event, emask) << 3;
 	reg_writel(val, hwc->config_base);
 	local64_set(&hwc->prev_count, 0);
 	reg_writel(0, hwc->event_base);
@@ -284,10 +386,17 @@ static inline void uncore_stop_event_l3c(struct perf_=
event *event)
=20
 static void uncore_start_event_dmc(struct perf_event *event, int flags)
 {
-	u32 val;
+	u32 val, cmask, emask;
 	struct hw_perf_event *hwc =3D &event->hw;
-	int idx =3D GET_COUNTERID(event);
-	int event_id =3D GET_EVENTID(event);
+	struct tx2_uncore_pmu *tx2_pmu;
+	int idx, event_id;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	cmask =3D tx2_pmu->counters_mask;
+	emask =3D tx2_pmu->events_mask;
+
+	idx =3D GET_COUNTERID(event, cmask);
+	event_id =3D GET_EVENTID(event, emask);
=20
 	/* enable and start counters.
 	 * 8 bits for each counter, bits[05:01] of a counter to set event type.
@@ -302,9 +411,14 @@ static void uncore_start_event_dmc(struct perf_event *=
event, int flags)
=20
 static void uncore_stop_event_dmc(struct perf_event *event)
 {
-	u32 val;
+	u32 val, cmask;
 	struct hw_perf_event *hwc =3D &event->hw;
-	int idx =3D GET_COUNTERID(event);
+	struct tx2_uncore_pmu *tx2_pmu;
+	int idx;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	cmask =3D tx2_pmu->counters_mask;
+	idx =3D GET_COUNTERID(event, cmask);
=20
 	/* clear event type(bits[05:01]) to stop counter */
 	val =3D reg_readl(hwc->config_base);
@@ -312,27 +426,72 @@ static void uncore_stop_event_dmc(struct perf_event *=
event)
 	reg_writel(val, hwc->config_base);
 }
=20
+static void uncore_start_event_ccpi2(struct perf_event *event, int flags)
+{
+	u32 emask;
+	struct hw_perf_event *hwc =3D &event->hw;
+	struct tx2_uncore_pmu *tx2_pmu;
+
+	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
+	emask =3D tx2_pmu->events_mask;
+
+	/* Bit [09:00] to set event id.
+	 * Bits [10], set level to rising edge.
+	 * Bits [11], set type to edge sensitive.
+	 */
+	reg_writel((CCPI2_EVENT_TYPE_EDGE_SENSITIVE |
+			CCPI2_EVENT_LEVEL_RISING_EDGE |
+			GET_EVENTID(event, emask)), hwc->config_base);
+
+	/* reset[4], enable[0] and start[1] counters */
+	reg_writel(CCPI2_PERF_CTL_RESET |
+			CCPI2_PERF_CTL_START |
+			CCPI2_PERF_CTL_ENABLE,
+			hwc->event_base + CCPI2_PERF_CTL);
+	local64_set(&event->hw.prev_count, 0ULL);
+}
+
+static void uncore_stop_event_ccpi2(struct perf_event *event)
+{
+	struct hw_perf_event *hwc =3D &event->hw;
+
+	/* disable and stop counter */
+	reg_writel(0, hwc->event_base + CCPI2_PERF_CTL);
+}
+
 static void tx2_uncore_event_update(struct perf_event *event)
 {
-	s64 prev, delta, new =3D 0;
+	u64 prev, delta, new =3D 0;
 	struct hw_perf_event *hwc =3D &event->hw;
 	struct tx2_uncore_pmu *tx2_pmu;
 	enum tx2_uncore_type type;
 	u32 prorate_factor;
+	u32 cmask, emask;
=20
 	tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
 	type =3D tx2_pmu->type;
+	cmask =3D tx2_pmu->counters_mask;
+	emask =3D tx2_pmu->events_mask;
 	prorate_factor =3D tx2_pmu->prorate_factor;
-
-	new =3D reg_readl(hwc->event_base);
-	prev =3D local64_xchg(&hwc->prev_count, new);
-
-	/* handles rollover of 32 bit counter */
-	delta =3D (u32)(((1UL << 32) - prev) + new);
+	if (type =3D=3D PMU_TYPE_CCPI2) {
+		reg_writel(CCPI2_COUNTER_OFFSET +
+				GET_COUNTERID(event, cmask),
+				hwc->event_base + CCPI2_COUNTER_SEL);
+		new =3D reg_readl(hwc->event_base + CCPI2_COUNTER_DATA_H);
+		new =3D (new << 32) +
+			reg_readl(hwc->event_base + CCPI2_COUNTER_DATA_L);
+		prev =3D local64_xchg(&hwc->prev_count, new);
+		delta =3D new - prev;
+	} else {
+		new =3D reg_readl(hwc->event_base);
+		prev =3D local64_xchg(&hwc->prev_count, new);
+		/* handles rollover of 32 bit counter */
+		delta =3D (u32)(((1UL << 32) - prev) + new);
+	}
=20
 	/* DMC event data_transfers granularity is 16 Bytes, convert it to 64 */
 	if (type =3D=3D PMU_TYPE_DMC &&
-			GET_EVENTID(event) =3D=3D DMC_EVENT_DATA_TRANSFERS)
+			GET_EVENTID(event, emask) =3D=3D DMC_EVENT_DATA_TRANSFERS)
 		delta =3D delta/4;
=20
 	/* L3C and DMC has 16 and 8 interleave channels respectively.
@@ -351,6 +510,7 @@ static enum tx2_uncore_type get_tx2_pmu_type(struct acp=
i_device *adev)
 	} devices[] =3D {
 		{"CAV901D", PMU_TYPE_L3C},
 		{"CAV901F", PMU_TYPE_DMC},
+		{"CAV901E", PMU_TYPE_CCPI2},
 		{"", PMU_TYPE_INVALID}
 	};
=20
@@ -380,7 +540,8 @@ static bool tx2_uncore_validate_event(struct pmu *pmu,
  * Make sure the group of events can be scheduled at once
  * on the PMU.
  */
-static bool tx2_uncore_validate_event_group(struct perf_event *event)
+static bool tx2_uncore_validate_event_group(struct perf_event *event,
+		int max_counters)
 {
 	struct perf_event *sibling, *leader =3D event->group_leader;
 	int counters =3D 0;
@@ -403,7 +564,7 @@ static bool tx2_uncore_validate_event_group(struct perf=
_event *event)
 	 * If the group requires more counters than the HW has,
 	 * it cannot ever be scheduled.
 	 */
-	return counters <=3D TX2_PMU_MAX_COUNTERS;
+	return counters <=3D max_counters;
 }
=20
=20
@@ -439,7 +600,7 @@ static int tx2_uncore_event_init(struct perf_event *eve=
nt)
 	hwc->config =3D event->attr.config;
=20
 	/* Validate the group */
-	if (!tx2_uncore_validate_event_group(event))
+	if (!tx2_uncore_validate_event_group(event, tx2_pmu->max_counters))
 		return -EINVAL;
=20
 	return 0;
@@ -456,6 +617,10 @@ static void tx2_uncore_event_start(struct perf_event *=
event, int flags)
 	tx2_pmu->start_event(event, flags);
 	perf_event_update_userpage(event);
=20
+	/* No hrtimer needed for CCPI2, 64-bit counters */
+	if (!tx2_pmu->hrtimer.function)
+		return;
+
 	/* Start timer for first event */
 	if (bitmap_weight(tx2_pmu->active_counters,
 				tx2_pmu->max_counters) =3D=3D 1) {
@@ -510,11 +675,13 @@ static void tx2_uncore_event_del(struct perf_event *e=
vent, int flags)
 {
 	struct tx2_uncore_pmu *tx2_pmu =3D pmu_to_tx2_pmu(event->pmu);
 	struct hw_perf_event *hwc =3D &event->hw;
+	u32 cmask;
=20
+	cmask =3D tx2_pmu->counters_mask;
 	tx2_uncore_event_stop(event, PERF_EF_UPDATE);
=20
 	/* clear the assigned counter */
-	free_counter(tx2_pmu, GET_COUNTERID(event));
+	free_counter(tx2_pmu, GET_COUNTERID(event, cmask));
=20
 	perf_event_update_userpage(event);
 	tx2_pmu->events[hwc->idx] =3D NULL;
@@ -580,8 +747,10 @@ static int tx2_uncore_pmu_add_dev(struct tx2_uncore_pm=
u *tx2_pmu)
 			cpu_online_mask);
=20
 	tx2_pmu->cpu =3D cpu;
-	hrtimer_init(&tx2_pmu->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	tx2_pmu->hrtimer.function =3D tx2_hrtimer_callback;
+
+	if (tx2_pmu->hrtimer.function)
+		hrtimer_init(&tx2_pmu->hrtimer,
+				CLOCK_MONOTONIC, HRTIMER_MODE_REL);
=20
 	ret =3D tx2_uncore_pmu_register(tx2_pmu);
 	if (ret) {
@@ -653,10 +822,13 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev=
(struct device *dev,
=20
 	switch (tx2_pmu->type) {
 	case PMU_TYPE_L3C:
-		tx2_pmu->max_counters =3D TX2_PMU_MAX_COUNTERS;
+		tx2_pmu->max_counters =3D TX2_PMU_DMC_L3C_MAX_COUNTERS;
+		tx2_pmu->counters_mask =3D 0x3;
 		tx2_pmu->prorate_factor =3D TX2_PMU_L3_TILES;
 		tx2_pmu->max_events =3D L3_EVENT_MAX;
+		tx2_pmu->events_mask =3D 0x1f;
 		tx2_pmu->hrtimer_interval =3D TX2_PMU_HRTIMER_INTERVAL;
+		tx2_pmu->hrtimer.function =3D tx2_hrtimer_callback;
 		tx2_pmu->attr_groups =3D l3c_pmu_attr_groups;
 		tx2_pmu->name =3D devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_l3c_%d", tx2_pmu->node);
@@ -665,10 +837,13 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev=
(struct device *dev,
 		tx2_pmu->stop_event =3D uncore_stop_event_l3c;
 		break;
 	case PMU_TYPE_DMC:
-		tx2_pmu->max_counters =3D TX2_PMU_MAX_COUNTERS;
+		tx2_pmu->max_counters =3D TX2_PMU_DMC_L3C_MAX_COUNTERS;
+		tx2_pmu->counters_mask =3D 0x3;
 		tx2_pmu->prorate_factor =3D TX2_PMU_DMC_CHANNELS;
 		tx2_pmu->max_events =3D DMC_EVENT_MAX;
+		tx2_pmu->events_mask =3D 0x1f;
 		tx2_pmu->hrtimer_interval =3D TX2_PMU_HRTIMER_INTERVAL;
+		tx2_pmu->hrtimer.function =3D tx2_hrtimer_callback;
 		tx2_pmu->attr_groups =3D dmc_pmu_attr_groups;
 		tx2_pmu->name =3D devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_dmc_%d", tx2_pmu->node);
@@ -676,6 +851,21 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(=
struct device *dev,
 		tx2_pmu->start_event =3D uncore_start_event_dmc;
 		tx2_pmu->stop_event =3D uncore_stop_event_dmc;
 		break;
+	case PMU_TYPE_CCPI2:
+		/* CCPI2 has 8 counters */
+		tx2_pmu->max_counters =3D TX2_PMU_CCPI2_MAX_COUNTERS;
+		tx2_pmu->counters_mask =3D 0x7;
+		tx2_pmu->prorate_factor =3D 1;
+		tx2_pmu->max_events =3D CCPI2_EVENT_MAX;
+		tx2_pmu->events_mask =3D 0x1ff;
+		tx2_pmu->attr_groups =3D ccpi2_pmu_attr_groups;
+		tx2_pmu->name =3D devm_kasprintf(dev, GFP_KERNEL,
+				"uncore_ccpi2_%d", tx2_pmu->node);
+		tx2_pmu->init_cntr_base =3D init_cntr_base_ccpi2;
+		tx2_pmu->start_event =3D uncore_start_event_ccpi2;
+		tx2_pmu->stop_event =3D uncore_stop_event_ccpi2;
+		tx2_pmu->hrtimer.function =3D NULL;
+		break;
 	case PMU_TYPE_INVALID:
 		devm_kfree(dev, tx2_pmu);
 		return NULL;
@@ -744,7 +934,9 @@ static int tx2_uncore_pmu_offline_cpu(unsigned int cpu,
 	if (cpu !=3D tx2_pmu->cpu)
 		return 0;
=20
-	hrtimer_cancel(&tx2_pmu->hrtimer);
+	if (tx2_pmu->hrtimer.function)
+		hrtimer_cancel(&tx2_pmu->hrtimer);
+
 	cpumask_copy(&cpu_online_mask_temp, cpu_online_mask);
 	cpumask_clear_cpu(cpu, &cpu_online_mask_temp);
 	new_cpu =3D cpumask_any_and(
--=20
2.17.1

