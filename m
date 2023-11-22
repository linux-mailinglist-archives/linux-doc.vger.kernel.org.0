Return-Path: <linux-doc+bounces-2893-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC87F482A
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 14:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A55DB20E84
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1657D4AF6A;
	Wed, 22 Nov 2023 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F71wM0ZV"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9A7D4A;
	Wed, 22 Nov 2023 05:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3OHE7ZdmUEVM9THMWofu4nvogjVTtn042bBHio16xPzTzjvic6AbtapAyZpNLCfhrE4a89GscXRxEMSwpdmRlrg3xeNBEMQ4ts6tm5YJokJR/R2U0uL/wQQQsvubnoHQZCrossd/4csYh4oO8wOXQ61HFEwgcFTOEFdMIOURE52Cet86mXWPlAN81KmLaHSvZgZHQihpBBSgACfTRjNyEdWcRNagn5VpEOV73yk121mukv1u06JTyUrpNjL08tMmPhf8UlcGAz0OWuOgDWrQd7/lXzfY5ky2wEE/iItkWlZIBtf8kX99UaoiOtGkGCOojPNtMGOPccSTdlFf3V1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VQBdu4VHnehIsecUBYIJ/66ByaOYXQ9Fd5W1YCrDSc=;
 b=U1qXq/m6Q16DETizsFUEFovWs/+s4KmoML57KZXfUD+7HSvWDxOdzr5PIKGKWuhQ6OPeLSGPf7He+7GNB8P6v+CsrvxGaX7Ycv4A0vKEYglUFLf5mppEjkg/btmZ1+iONc4ZrebSYAAFyl6LChPeiQ/TzdxLsD/hPMiT63hix1o7JUOnXwOTdzeUyaLP9fEIKgvquvlUk9Uh3PFWcSYl00CkUgKjO91utUTea88LHOejyVoEDOLUXIY2wHtmkInaksnn3rT+J4iAuRvLocbp6QHZRcmXsdHclFMmdFF+iq/8KBtW+8btpYipgK6NfcxfIAx6NMZwiKusO4rjeBWn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VQBdu4VHnehIsecUBYIJ/66ByaOYXQ9Fd5W1YCrDSc=;
 b=F71wM0ZV9Tti8wBYWmfwW3x/NXX9toSpKud6Du6OnPPUcK5yMcLj/zpTMN30nhYkEX3+incVO9pcs8pTbObO9a58FIGqTX6+o7Dt0TJW+npKGYIMe/T2GcGAg61Pa20gx37IqY94fcWincOKbIxlwf5fm59gODWXbeA88ip3Xul0GI3kRrjJBX1pJP5ZsIds4M9hAzOSgObtVkaPnGXLXhrRkE1xtoXWhTwP60QbIbzyEe8H+wQMx7BuXkxLj1sKvv4q+/nXT1nBSj51NeAE6c/3FR0TZ/5SnRcjbHwczrD+ozvrEzJ1wLFYSWP17SnXylGbz2wUgKmAtsM8Z84xdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 13:49:24 +0000
Received: from SJ1PR12MB6075.namprd12.prod.outlook.com
 ([fe80::eb39:938e:7503:c21e]) by SJ1PR12MB6075.namprd12.prod.outlook.com
 ([fe80::eb39:938e:7503:c21e%3]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 13:49:24 +0000
From: Aurelien Aptel <aaptel@nvidia.com>
To: linux-nvme@lists.infradead.org,
	netdev@vger.kernel.org,
	sagi@grimberg.me,
	hch@lst.de,
	kbusch@kernel.org,
	axboe@fb.com,
	chaitanyak@nvidia.com,
	davem@davemloft.net,
	kuba@kernel.org
Cc: Yoray Zack <yorayz@nvidia.com>,
	aaptel@nvidia.com,
	aurelien.aptel@gmail.com,
	smalin@nvidia.com,
	malin1024@gmail.com,
	ogerlitz@nvidia.com,
	borisp@nvidia.com,
	galshalom@nvidia.com,
	mgurtovoy@nvidia.com,
	linux-doc@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	corbet@lwn.net
Subject: [PATCH v20 09/20] Documentation: add ULP DDP offload documentation
Date: Wed, 22 Nov 2023 13:48:22 +0000
Message-Id: <20231122134833.20825-10-aaptel@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122134833.20825-1-aaptel@nvidia.com>
References: <20231122134833.20825-1-aaptel@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ1PR12MB6075.namprd12.prod.outlook.com
 (2603:10b6:a03:45e::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6075:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: bdaccacf-3c03-4fd8-a631-08dbeb61d651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fWkvcMg8mAttKmdrGusff5TDiyPxH0E2VcZ1C3++pPF/icxgSpUwbSTzZgIrpVCmZ90bc0slfFp27D9UIrVC2Q4B0GNZmAtVvBQ6CvPehz28BCALsV4a9M2IhSUPPxlvZEWjWFnIS/p1E1D13fc678mYH6SwvA8Q07y/wRlOAOhwL70F7hsQj2tL7fvyPqJQGvqo6qbzVXqkbkH1FfjmQUr5fQZQPTRHDLrDfHhvUZ/Mgc3KvX7wgYVrqUguUjukgz8Cw6qQRoknLAws812sL2odNa60HnMrJ552eJX33L4pa6sA/ASyJzZ20vRloCOb3W4kNLftiSG0xdxLVo+jLtASkTPbq2M31HK3IJQSq3+Yga7K1l/o/Jo4gvAQG2IZNVS5uIDshU9PeakKL3ZCp3cj5lqpfn//3wAmtuXUwBK1Fko60mqFbUBuWDPajuo9qRAFe8urRN5QqLo4bc6gKzhtE4F75+bTMDi03iR0GNlp+VI9gvSvfyZjJSnN58jadxvVhlUzFyG182niOfSmB/qvSHar65MtE8jVj/op76/33pdFoWoY2v12FJ4IEO1f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(66476007)(66946007)(2616005)(38100700002)(36756003)(86362001)(26005)(83380400001)(1076003)(6506007)(6512007)(7416002)(6486002)(478600001)(2906002)(30864003)(316002)(5660300002)(8676002)(8936002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lxWWaawfmm9KC35DIcE2FhHpTQo4RaLu9kTnTwQ8UDfNRgYx0WOSUBMo8zZZ?=
 =?us-ascii?Q?GmczGUcuI2YSsinsYG4lJwNT+gjylAqJot026qnpTua9u6DnXhZK9g3hqeu/?=
 =?us-ascii?Q?C2NoA+ItvhjpcoWGVCOOUS8OvP1wpYS71O5+lFzz+cq5YdQK5pfCThBuEEu0?=
 =?us-ascii?Q?qms8qTuLNhHFvkw0k37Wk7TokWEe4s6/WZfPWuyOF+fA58B4K8DXLJqcy8Dc?=
 =?us-ascii?Q?ZZnnYpFL0NVxdIEpeaSJ284gIVY+bgWFMDlnSPRmYjrqXsjGlwWsoGVEAJy6?=
 =?us-ascii?Q?YN1SJO6DMN7LBECFrhV/+KJOZKFX9kBlrazHSkkkM4bHdzjNAVr7wcfRvwzH?=
 =?us-ascii?Q?ciJlGgedtfwTFFMpkv0RjdwOZoYw7aXMooP4nrIbVbTWPeHbZUBYmqvks5dn?=
 =?us-ascii?Q?+bcomsax4/k6tXSp8qx4bGlQz5s+elXNMeNwZ5zb7gUdd6LElcKpLZlyOfvc?=
 =?us-ascii?Q?xwMC6IEG/ZZUyyPq8j76O5ngLFivmHwSHO0xCkl1YPuHx8g1VKzdWYlhL7RR?=
 =?us-ascii?Q?o7ysd4ftTyfN2NVsvOQgdMOoNF3KSztJ6m0LCLZJ0/Ow4MgydTwd58ktpW5l?=
 =?us-ascii?Q?voTx7zmWaiC2AteymnqToWxCVZ8nKzlnA3wnRNu7Xm6z31RoXlg3lOR2sIyK?=
 =?us-ascii?Q?WaCdh+B7c/48XEGmQRGXvMSVr1FCeKw7BOsv96PnOqu3rKFAUGDpaUuB8XV2?=
 =?us-ascii?Q?Xf+dG6S/dokpyf/hn3IV0LmWTdKxZ/OQdm56Lo2MwyTQ1O8eHqjHSNfMgr1d?=
 =?us-ascii?Q?52xC9gcIoOproxqSZAyjvqwho7hXDUJ2OZ1MQTeJKlVVQK94RTQEoiDoofTg?=
 =?us-ascii?Q?F1pedAXvyKfUTwk6L3h7Eiu/bv4dAoXdcPGb2uMaGLBQEBn/KCoEUO8S9SQ8?=
 =?us-ascii?Q?HATQdk40B1HhDVnGUqLoLaTf7KQBkChbjCdJFNu5h6rHfsW38dW3SkdXcKJa?=
 =?us-ascii?Q?+n/89IaTNJcaBi1EMiehkGhckoQsyFoFCv4i1krAC3tUSRByG8iyVZypJBX6?=
 =?us-ascii?Q?H7fRadbUR315zGM9xpxF8YNPlFWUgky/lBxyYbSM9Xpw7o47eI0VKyz1MIci?=
 =?us-ascii?Q?uxYK+T9PiXhGqoIpxW7wVtES0DKu4hvXa15mCR55ZIHSiLEWVXeNm31ImXb3?=
 =?us-ascii?Q?otOBz5X28KAraWuJhU8Wf/xtUxnl5NO04oflJgoInTTAIoXAt7l0oTI+L4Nm?=
 =?us-ascii?Q?SSnni5jw97v/QF13MyWA730TyJPf10gBJHk/BqY/hhI4W1cqv+wutdCY6LqA?=
 =?us-ascii?Q?nKv/w+kEHG/A0C4VXOIoml/pTQB9Aoz4omMJiLaIxGDYtcchEzlT7JVugsRQ?=
 =?us-ascii?Q?KtTy9iNrY/uzqX4fYgXvHP7eLE3v2mwy+lShKLbphbzRLWyxdp6So1BpM1xp?=
 =?us-ascii?Q?yCebW83ak3d2Tlb675ErtHXUhlbmSib/+ja2AMixudMSXVyvfVxXQz2+dr3W?=
 =?us-ascii?Q?ya8CvxbWU8pQC12GQjbQer6i5ol06JKH+O555f7tUAe+yk/frjxiOgZkVyDx?=
 =?us-ascii?Q?fj5hEmXbygLhQQCb7LPMD7QvtOEYmidIzBeGXkaJA7uvBiUWu6ZnXjKLH4Vw?=
 =?us-ascii?Q?3kbIdDHFaUx2ue2pCF2Fsa/F3qiHaNjmFvTiEx7L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaccacf-3c03-4fd8-a631-08dbeb61d651
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 13:49:24.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9g1MQUEHTAATn1A7oitPQ7TiBX2X1hS7Zz5Rls094i6YNL5H+lHgPzBw2D7I2IkDR6cT4KHmL7zFQc7HSq10w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800

From: Yoray Zack <yorayz@nvidia.com>

Document the new ULP DDP API and add it under "networking".
Use NVMe-TCP implementation as an example.

Signed-off-by: Boris Pismenny <borisp@nvidia.com>
Signed-off-by: Ben Ben-Ishay <benishay@nvidia.com>
Signed-off-by: Or Gerlitz <ogerlitz@nvidia.com>
Signed-off-by: Yoray Zack <yorayz@nvidia.com>
Signed-off-by: Shai Malin <smalin@nvidia.com>
Signed-off-by: Aurelien Aptel <aaptel@nvidia.com>
---
 Documentation/networking/index.rst           |   1 +
 Documentation/networking/ulp-ddp-offload.rst | 374 +++++++++++++++++++
 2 files changed, 375 insertions(+)
 create mode 100644 Documentation/networking/ulp-ddp-offload.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 683eb42309cc..e099781e611f 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -108,6 +108,7 @@ Contents:
    tc-queue-filters
    tcp_ao
    tcp-thin
+   ulp-ddp-offload
    team
    timestamping
    tipc
diff --git a/Documentation/networking/ulp-ddp-offload.rst b/Documentation/networking/ulp-ddp-offload.rst
new file mode 100644
index 000000000000..438f060e9af4
--- /dev/null
+++ b/Documentation/networking/ulp-ddp-offload.rst
@@ -0,0 +1,374 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+=================================
+ULP direct data placement offload
+=================================
+
+Overview
+========
+
+The Linux kernel ULP direct data placement (DDP) offload infrastructure
+provides tagged request-response protocols, such as NVMe-TCP, the ability to
+place response data directly in pre-registered buffers according to header
+tags. DDP is particularly useful for data-intensive pipelined protocols whose
+responses may be reordered.
+
+For example, in NVMe-TCP numerous read requests are sent together and each
+request is tagged using the PDU header CID field. Receiving servers process
+requests as fast as possible and sometimes responses for smaller requests
+bypasses responses to larger requests, e.g., 4KB reads bypass 1GB reads.
+Thereafter, clients correlate responses to requests using PDU header CID tags.
+The processing of each response requires copying data from SKBs to read
+request destination buffers; The offload avoids this copy. The offload is
+oblivious to destination buffers which can reside either in userspace
+(O_DIRECT) or in kernel pagecache.
+
+Request TCP byte-stream:
+
+.. parsed-literal::
+
+ +---------------+-------+---------------+-------+---------------+-------+
+ | PDU hdr CID=1 | Req 1 | PDU hdr CID=2 | Req 2 | PDU hdr CID=3 | Req 3 |
+ +---------------+-------+---------------+-------+---------------+-------+
+
+Response TCP byte-stream:
+
+.. parsed-literal::
+
+ +---------------+--------+---------------+--------+---------------+--------+
+ | PDU hdr CID=2 | Resp 2 | PDU hdr CID=3 | Resp 3 | PDU hdr CID=1 | Resp 1 |
+ +---------------+--------+---------------+--------+---------------+--------+
+
+The driver builds SKB page fragments that point to destination buffers.
+Consequently, SKBs represent the original data on the wire, which enables
+*transparent* inter-operation with the network stack. To avoid copies between
+SKBs and destination buffers, the layer-5 protocol (L5P) will check
+``if (src == dst)`` for SKB page fragments, success indicates that data is
+already placed there by NIC hardware and copy should be skipped.
+
+In addition, L5P might have DDGST which ensures data integrity over
+the network.  If not offloaded, ULP DDP might not be efficient as L5P
+will need to go over the data and calculate it by itself, cancelling
+out the benefits of the DDP copy skip.  ULP DDP has support for Rx/Tx
+DDGST offload. On the received side the NIC will verify DDGST for
+received PDUs and update SKB->ulp_ddp and SKB->ulp_crc bits.  If all the SKBs
+making up a L5P PDU have crc on, L5P will skip on calculating and
+verifying the DDGST for the corresponding PDU. On the Tx side, the NIC
+will be responsible for calculating and filling the DDGST fields in
+the sent PDUs.
+
+Offloading does require NIC hardware to track L5P protocol framing, similarly
+to RX TLS offload (see Documentation/networking/tls-offload.rst).  NIC hardware
+will parse PDU headers, extract fields such as operation type, length, tag
+identifier, etc. and only offload segments that correspond to tags registered
+with the NIC, see the :ref:`buf_reg` section.
+
+Device configuration
+====================
+
+During driver initialization the driver sets the ULP DDP operations
+for the :c:type:`struct net_device <net_device>` via
+`netdev->netdev_ops->ulp_ddp_ops`.
+
+The :c:member:`get_caps` operation returns the ULP DDP capabilities
+enabled and/or supported by the device to the caller. The current list
+of capabilities is represented as a bitset:
+
+.. code-block:: c
+
+  enum ulp_ddp_cap {
+	ULP_DDP_CAP_NVME_TCP,
+	ULP_DDP_CAP_NVME_TCP_DDGST,
+  };
+
+The enablement of capabilities can be controlled via the
+:c:member:`set_caps` operation. This operation is exposed to userspace
+via netlink. See Documentation/netlink/specs/ulp_ddp.yaml for more
+details.
+
+Later, after the L5P completes its handshake, the L5P queries the
+driver for its runtime limitations via the :c:member:`limits` operation:
+
+.. code-block:: c
+
+ int (*limits)(struct net_device *netdev,
+	       struct ulp_ddp_limits *lim);
+
+
+All L5P share a common set of limits and parameters (:c:type:`struct ulp_ddp_limits <ulp_ddp_limits>`):
+
+.. code-block:: c
+
+ /**
+  * struct ulp_ddp_limits - Generic ulp ddp limits: tcp ddp
+  * protocol limits.
+  * Add new instances of ulp_ddp_limits in the union below (nvme-tcp, etc.).
+  *
+  * @type:		type of this limits struct
+  * @max_ddp_sgl_len:	maximum sgl size supported (zero means no limit)
+  * @io_threshold:	minimum payload size required to offload
+  * @tls:		support for ULP over TLS
+  * @nvmeotcp:		NVMe-TCP specific limits
+  */
+ struct ulp_ddp_limits {
+	enum ulp_ddp_type	type;
+	int			max_ddp_sgl_len;
+	int			io_threshold;
+	bool			tls:1;
+	union {
+		/* ... protocol-specific limits ... */
+		struct nvme_tcp_ddp_limits nvmeotcp;
+	};
+ };
+
+But each L5P can also add protocol-specific limits e.g.:
+
+.. code-block:: c
+
+ /**
+  * struct nvme_tcp_ddp_limits - nvme tcp driver limitations
+  *
+  * @full_ccid_range:	true if the driver supports the full CID range
+  */
+ struct nvme_tcp_ddp_limits {
+	bool			full_ccid_range;
+ };
+
+Once the L5P has made sure the device is supported the offload
+operations are installed on the socket.
+
+If offload installation fails, then the connection is handled by software as if
+offload was not attempted.
+
+To request offload for a socket `sk`, the L5P calls :c:member:`sk_add`:
+
+.. code-block:: c
+
+ int (*sk_add)(struct net_device *netdev,
+	       struct sock *sk,
+	       struct ulp_ddp_config *config);
+
+The function return 0 for success. In case of failure, L5P software should
+fallback to normal non-offloaded operations.  The `config` parameter indicates
+the L5P type and any metadata relevant for that protocol. For example, in
+NVMe-TCP the following config is used:
+
+.. code-block:: c
+
+ /**
+  * struct nvme_tcp_ddp_config - nvme tcp ddp configuration for an IO queue
+  *
+  * @pfv:        pdu version (e.g., NVME_TCP_PFV_1_0)
+  * @cpda:       controller pdu data alignment (dwords, 0's based)
+  * @dgst:       digest types enabled.
+  *              The netdev will offload crc if L5P data digest is supported.
+  * @queue_size: number of nvme-tcp IO queue elements
+  * @queue_id:   queue identifier
+  */
+ struct nvme_tcp_ddp_config {
+	u16			pfv;
+	u8			cpda;
+	u8			dgst;
+	int			queue_size;
+	int			queue_id;
+ };
+
+When offload is not needed anymore, e.g. when the socket is being released, the L5P
+calls :c:member:`sk_del` to release device contexts:
+
+.. code-block:: c
+
+ void (*sk_del)(struct net_device *netdev,
+	        struct sock *sk);
+
+Normal operation
+================
+
+At the very least, the device maintains the following state for each connection:
+
+ * 5-tuple
+ * expected TCP sequence number
+ * mapping between tags and corresponding buffers
+ * current offset within PDU, PDU length, current PDU tag
+
+NICs should not assume any correlation between PDUs and TCP packets.
+If TCP packets arrive in-order, offload will place PDU payloads
+directly inside corresponding registered buffers. NIC offload should
+not delay packets. If offload is not possible, than the packet is
+passed as-is to software. To perform offload on incoming packets
+without buffering packets in the NIC, the NIC stores some inter-packet
+state, such as partial PDU headers.
+
+RX data-path
+------------
+
+After the device validates TCP checksums, it can perform DDP offload.  The
+packet is steered to the DDP offload context according to the 5-tuple.
+Thereafter, the expected TCP sequence number is checked against the packet
+TCP sequence number. If there is a match, offload is performed: the PDU payload
+is DMA written to the corresponding destination buffer according to the PDU header
+tag.  The data should be DMAed only once, and the NIC receive ring will only
+store the remaining TCP and PDU headers.
+
+We remark that a single TCP packet may have numerous PDUs embedded inside. NICs
+can choose to offload one or more of these PDUs according to various
+trade-offs. Possibly, offloading such small PDUs is of little value, and it is
+better to leave it to software.
+
+Upon receiving a DDP offloaded packet, the driver reconstructs the original SKB
+using page frags, while pointing to the destination buffers whenever possible.
+This method enables seamless integration with the network stack, which can
+inspect and modify packet fields transparently to the offload.
+
+.. _buf_reg:
+
+Destination buffer registration
+-------------------------------
+
+To register the mapping between tags and destination buffers for a socket
+`sk`, the L5P calls :c:member:`setup` of :c:type:`struct ulp_ddp_dev_ops
+<ulp_ddp_dev_ops>`:
+
+.. code-block:: c
+
+ int (*setup)(struct net_device *netdev,
+	      struct sock *sk,
+	      struct ulp_ddp_io *io);
+
+
+The `io` provides the buffer via scatter-gather list (`sg_table`) and
+corresponding tag (`command_id`):
+
+.. code-block:: c
+
+ /**
+  * struct ulp_ddp_io - tcp ddp configuration for an IO request.
+  *
+  * @command_id:  identifier on the wire associated with these buffers
+  * @nents:       number of entries in the sg_table
+  * @sg_table:    describing the buffers for this IO request
+  * @first_sgl:   first SGL in sg_table
+  */
+ struct ulp_ddp_io {
+	u32			command_id;
+	int			nents;
+	struct sg_table		sg_table;
+	struct scatterlist	first_sgl[SG_CHUNK_SIZE];
+ };
+
+After the buffers have been consumed by the L5P, to release the NIC mapping of
+buffers the L5P calls :c:member:`teardown` of :c:type:`struct
+ulp_ddp_dev_ops <ulp_ddp_dev_ops>`:
+
+.. code-block:: c
+
+ void (*teardown)(struct net_device *netdev,
+		  struct sock *sk,
+		  struct ulp_ddp_io *io,
+		  void *ddp_ctx);
+
+`teardown` receives the same `io` context and an additional opaque
+`ddp_ctx` that is used for asynchronous teardown, see the :ref:`async_release`
+section.
+
+.. _async_release:
+
+Asynchronous teardown
+---------------------
+
+To teardown the association between tags and buffers and allow tag reuse NIC HW
+is called by the NIC driver during `teardown`. This operation may be
+performed either synchronously or asynchronously. In asynchronous teardown,
+`teardown` returns immediately without unmapping NIC HW buffers. Later,
+when the unmapping completes by NIC HW, the NIC driver will call up to L5P
+using :c:member:`ddp_teardown_done` of :c:type:`struct ulp_ddp_ulp_ops <ulp_ddp_ulp_ops>`:
+
+.. code-block:: c
+
+ void (*ddp_teardown_done)(void *ddp_ctx);
+
+The `ddp_ctx` parameter passed in `ddp_teardown_done` is the same on provided
+in `teardown` and it is used to carry some context about the buffers
+and tags that are released.
+
+Resync handling
+===============
+
+RX
+--
+In presence of packet drops or network packet reordering, the device may lose
+synchronization between the TCP stream and the L5P framing, and require a
+resync with the kernel's TCP stack. When the device is out of sync, no offload
+takes place, and packets are passed as-is to software. Resync is very similar
+to TLS offload (see documentation at Documentation/networking/tls-offload.rst)
+
+If only packets with L5P data are lost or reordered, then resynchronization may
+be avoided by NIC HW that keeps tracking PDU headers. If, however, PDU headers
+are reordered, then resynchronization is necessary.
+
+To resynchronize hardware during traffic, we use a handshake between hardware
+and software. The NIC HW searches for a sequence of bytes that identifies L5P
+headers (i.e., magic pattern).  For example, in NVMe-TCP, the PDU operation
+type can be used for this purpose.  Using the PDU header length field, the NIC
+HW will continue to find and match magic patterns in subsequent PDU headers. If
+the pattern is missing in an expected position, then searching for the pattern
+starts anew.
+
+The NIC will not resume offload when the magic pattern is first identified.
+Instead, it will request L5P software to confirm that indeed this is a PDU
+header. To request confirmation the NIC driver calls up to L5P using
+:c:member:`resync_request` of :c:type:`struct ulp_ddp_ulp_ops <ulp_ddp_ulp_ops>`:
+
+.. code-block:: c
+
+  bool (*resync_request)(struct sock *sk, u32 seq, u32 flags);
+
+The `seq` parameter contains the TCP sequence of the last byte in the PDU header.
+The `flags` parameter contains a flag (`ULP_DDP_RESYNC_PENDING`) indicating whether
+a request is pending or not.
+L5P software will respond to this request after observing the packet containing
+TCP sequence `seq` in-order. If the PDU header is indeed there, then L5P
+software calls the NIC driver using the :c:member:`resync` function of
+the :c:type:`struct ulp_ddp_dev_ops <ulp_ddp_ops>` inside the :c:type:`struct
+net_device <net_device>` while passing the same `seq` to confirm it is a PDU
+header.
+
+.. code-block:: c
+
+ void (*resync)(struct net_device *netdev,
+		struct sock *sk, u32 seq);
+
+Statistics
+==========
+
+Per L5P protocol, the NIC driver must report statistics for the above
+netdevice operations and packets processed by offload.
+These statistics are per-device and can be retrieved from userspace
+via netlink (see Documentation/netlink/specs/ulp_ddp.yaml).
+
+For example, NVMe-TCP offload reports:
+
+ * ``rx_nvme_tcp_sk_add`` - number of NVMe-TCP Rx offload contexts created.
+ * ``rx_nvme_tcp_sk_add_fail`` - number of NVMe-TCP Rx offload context creation
+   failures.
+ * ``rx_nvme_tcp_sk_del`` - number of NVMe-TCP Rx offload contexts destroyed.
+ * ``rx_nvme_tcp_setup`` - number of DDP buffers mapped.
+ * ``rx_nvme_tcp_setup_fail`` - number of DDP buffers mapping that failed.
+ * ``rx_nvme_tcp_teardown`` - number of DDP buffers unmapped.
+ * ``rx_nvme_tcp_drop`` - number of packets dropped in the driver due to fatal
+   errors.
+ * ``rx_nvme_tcp_resync`` - number of packets with resync requests.
+ * ``rx_nvme_tcp_packets`` - number of packets that used offload.
+ * ``rx_nvme_tcp_bytes`` - number of bytes placed in DDP buffers.
+
+NIC requirements
+================
+
+NIC hardware should meet the following requirements to provide this offload:
+
+ * Offload must never buffer TCP packets.
+ * Offload must never modify TCP packet headers.
+ * Offload must never reorder TCP packets within a flow.
+ * Offload must never drop TCP packets.
+ * Offload must not depend on any TCP fields beyond the
+   5-tuple and TCP sequence number.
-- 
2.34.1


