Return-Path: <linux-doc+bounces-8663-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180E84DDFF
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 11:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 465811C2712E
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 10:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39F36D1AD;
	Thu,  8 Feb 2024 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="kfyTY0kn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4A6E2CA;
	Thu,  8 Feb 2024 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387547; cv=none; b=hO+iqTXU6NBXu0fq20XPVKJaD0S5XhDK2sXLVhIWx0TSzs5b/4+EzThreWMlRY6RNsXFHmL9UhoHvaPdnuxIpYlPucPJm+vgFRIqi04OvWQnoY/0Gk2ixUdFFcqDak4+34WPi9B+97tpnhB+QBv2nykKQjtD0eQIqhO1IrMm+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387547; c=relaxed/simple;
	bh=IudSft82J5bh0vU6smrPXuwB3up+uxat83+QZVVUCSE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t326ECo5lCn7TmtG8v5HgEHYr2QxxYDeKAXTRI1au77SNvkTMfB8es4s+WOHJvIbslwU7d+ujNpjnDsGXYPo0UOeld727u1BecG+SQrOCs7QnEqzZhW94mCanFB1WymryMi50ga/gv+veaPICbYHjYXaYs1yA+2AX6ccCtYP5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=kfyTY0kn; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4184Gl8j001166;
	Thu, 8 Feb 2024 02:18:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=Q4kGmOXe
	SE3YSc9uti9XSX1GdBtx2l5z+ZGBjuldvmM=; b=kfyTY0knQW+sLSdyIsZLr6GW
	agt1LagYoqDuqUw0ViKs3123EJSk32I4rJ1U47rq2uWjYEI4QZhwZ8NiwSdsIZjN
	bHnST/aaJ3498jnc1oZkcl49zHuVxGL2Hz9Udp+wOUFx5z0TTwPbtyL83wvf2Y8U
	Pa1r10xUK1mP4E0yYH/syarQ1HaRBClQS1xn0bRwRYkLZnC5Z5NB87a+Ny4D/pNB
	g15lqeu/eP11dJG9EXtqYNVvKZWpPvpvG00FSOHu65N5HttnK01CIqE542UBo5rX
	nKNBxVYDeRiF/H0JyX9KrLPAVCGW7UZO5iKY6EtasMEBjBKipWAErvMa3XST8w==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3w4qsq0wf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 02:18:48 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 8 Feb
 2024 02:18:46 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 8 Feb 2024 02:18:46 -0800
Received: from ubuntu-PowerEdge-T110-II.sclab.marvell.com (unknown [10.106.27.86])
	by maili.marvell.com (Postfix) with ESMTP id 136B83F7072;
	Thu,  8 Feb 2024 02:18:46 -0800 (PST)
From: Shinas Rasheed <srasheed@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <hgani@marvell.com>, <vimleshk@marvell.com>,
        <sedara@marvell.com>, <srasheed@marvell.com>, <egallen@redhat.com>,
        <mschmidt@redhat.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <horms@kernel.org>, <wizhao@redhat.com>, <kheib@redhat.com>,
        <konguyen@redhat.com>
Subject: [PATCH net-next v7 0/8] add octeon_ep_vf driver
Date: Thu, 8 Feb 2024 02:18:32 -0800
Message-ID: <20240208101841.3108103-1-srasheed@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gYjQGXERyoE6Y2nD4P611mI-VRFbosNR
X-Proofpoint-GUID: gYjQGXERyoE6Y2nD4P611mI-VRFbosNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02

This driver implements networking functionality of Marvell's Octeon
PCI Endpoint NIC VF.

This driver support following devices:
 * Network controller: Cavium, Inc. Device b203
 * Network controller: Cavium, Inc. Device b403
 * Network controller: Cavium, Inc. Device b103
 * Network controller: Cavium, Inc. Device b903
 * Network controller: Cavium, Inc. Device ba03
 * Network controller: Cavium, Inc. Device bc03
 * Network controller: Cavium, Inc. Device bd03

Changes:
V7:
  - Separated octep_vf_get_if_stats from octep_vf_main.h to later patch
    in [1/8]
  - Moved introducing ndo_ops from [3/8] to [5/8]

V6: https://lore.kernel.org/all/20240207065207.3092004-1-srasheed@marvell.com/
  - Removed reuse of netif_tx_stop_all_queues, called implicitly in
    netif_tx_disable, when stopping netdev
  - Corrected error jump labels to have proper action-specific names in
    probe function
  - Removed singlethreaded workqueue implementation, since only tx
    timeout task is run. Run the same in the system workqueue
  - netdev_hold when tx_timeout happens to protect against free_netdev
    if race occurs between rmmod and a tx timeout. netdev_put the
    reference when timeout task ends to progress freeing netdev
 

V5: https://lore.kernel.org/all/20240129050254.3047778-1-srasheed@marvell.com/
  - Changed unchecked return types to void and removed unnecessary
    initializations in [2/8] patch.

V4: https://lore.kernel.org/all/20240108124213.2966536-1-srasheed@marvell.com/
  - Moved some stats from ethtool and added more to ndo_get_stats64
  - Replaced code in IQ full check function to use helper from
    net/netdev_queues.h
  - Refactored code so that NETDEV_TX_BUSY is avoided

V3: https://lore.kernel.org/all/20240105203823.2953604-1-srasheed@marvell.com/
  - Removed UINT64_MAX, which is unused
  - Replaced masks and ULL declarations with GENMASK_ULL(), ULL() and
    other linux/bits.h macros, corrected declarations to conform to xmas tree format in patch [2/8]
  - Moved vfree and vzalloc null pointer casting corrections to patch
    [3/8], and corrected return values to follow standard kernel error codes in same
   - Set static budget of 64 for tx completion processing in NAPI
  - Replaces napi_complete and build_skb APIs to napi_complete_done and
    napi_build_skb APIs respectively
  - Replaced code with helper from net/netdev_queues.h to wake queues in TX completion
    processing
  - Removed duplicate reporting of TX/RX packets/bytes, which is already
    done during ndo_get_stats64

V2: https://lore.kernel.org/all/20231223134000.2906144-1-srasheed@marvell.com/
  - Removed linux/version.h header file from inclusion in
    octep_vf_main.c
  - Corrected Makefile entry to include building octep_vf_mbox.c in
    [6/8] patch.
  - Removed redundant vzalloc pointer cast and vfree pointer check in
    [6/8] patch.

V1: https://lore.kernel.org/all/20231221092844.2885872-1-srasheed@marvell.com/

Shinas Rasheed (8):
  octeon_ep_vf: Add driver framework and device initialization
  octeon_ep_vf: add hardware configuration APIs
  octeon_ep_vf: add VF-PF mailbox communication.
  octeon_ep_vf: add Tx/Rx ring resource setup and cleanup
  octeon_ep_vf: add support for ndo ops
  octeon_ep_vf: add Tx/Rx processing and interrupt support
  octeon_ep_vf: add ethtool support
  octeon_ep_vf: update MAINTAINERS

 .../device_drivers/ethernet/index.rst         |    1 +
 .../ethernet/marvell/octeon_ep_vf.rst         |   24 +
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/marvell/Kconfig          |    1 +
 drivers/net/ethernet/marvell/Makefile         |    1 +
 .../net/ethernet/marvell/octeon_ep_vf/Kconfig |   19 +
 .../ethernet/marvell/octeon_ep_vf/Makefile    |   10 +
 .../marvell/octeon_ep_vf/octep_vf_cn9k.c      |  489 +++++++
 .../marvell/octeon_ep_vf/octep_vf_cnxk.c      |  500 +++++++
 .../marvell/octeon_ep_vf/octep_vf_config.h    |  160 +++
 .../marvell/octeon_ep_vf/octep_vf_ethtool.c   |  273 ++++
 .../marvell/octeon_ep_vf/octep_vf_main.c      | 1231 +++++++++++++++++
 .../marvell/octeon_ep_vf/octep_vf_main.h      |  334 +++++
 .../marvell/octeon_ep_vf/octep_vf_mbox.c      |  430 ++++++
 .../marvell/octeon_ep_vf/octep_vf_mbox.h      |  166 +++
 .../marvell/octeon_ep_vf/octep_vf_regs_cn9k.h |  154 +++
 .../marvell/octeon_ep_vf/octep_vf_regs_cnxk.h |  162 +++
 .../marvell/octeon_ep_vf/octep_vf_rx.c        |  510 +++++++
 .../marvell/octeon_ep_vf/octep_vf_rx.h        |  224 +++
 .../marvell/octeon_ep_vf/octep_vf_tx.c        |  330 +++++
 .../marvell/octeon_ep_vf/octep_vf_tx.h        |  276 ++++
 21 files changed, 5305 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/Makefile
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cn9k.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cnxk.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_config.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_ethtool.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cn9k.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cnxk.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.h

-- 
2.25.1


