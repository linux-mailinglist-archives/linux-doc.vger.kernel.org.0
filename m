Return-Path: <linux-doc+bounces-79228-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKC5Lf3Es2mEagAAu9opvQ
	(envelope-from <linux-doc+bounces-79228-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 09:04:13 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092127F344
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 09:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17350316E650
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 07:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36F8376491;
	Fri, 13 Mar 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="PXTzQzVM"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB57374E5B;
	Fri, 13 Mar 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388486; cv=none; b=Bv1VHSwbPrU5/18UsGwNRXrpglFkXLH81ZHsuJiX97lXQYO79HrXm0IJTrm9PLKBomsVpa2U4N6e/nMpPF1y6OHswbL7pQeq5lN//Mbb2E5W3iYDIA0lM3BAgsW1W0plYGOCxLQxtv3s6IUamwaFZ92l+Pqz+KPBsTjQUahsXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388486; c=relaxed/simple;
	bh=QRhEPZwjQDtEWaSiZlJrNtdi2sKM7nwMBk2HChG5od4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhSfbIBINvykD60TcsVmaLZiD3eh7z+3WCLjudU2pj6TL1PaBo5N2NHJ19/l+suUnPMdKjOB861CgyhlQKRxGOb0cMBSOeHU8udPb8uh4JRR2nqLfNY/F0SADEf07JSCa77h1qd8ZJAuXk3jAVOToWzlqm/tJHEYDMdIc3rIBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=PXTzQzVM; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=svJIAhrgiJf58cEj6r705yb0LBLCIOwwoPtKekJIkBg=;
	b=PXTzQzVM1AMqm1fdWFO1TEUkfGXCkCNhqC06j0ckaWUjYhC1+cbN4GIATuLQbM2hRe71y4ZWa
	FC4stnyp+L5xhiORz3iShxvzfYHnruFeSI8WReMuTYoMELihU3ruiMrPgPlMOlZkt8YxxqZ2Zqi
	+UF6sucjluPv68E58jneEP0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fXGpq3HcfzmV6J;
	Fri, 13 Mar 2026 15:49:39 +0800 (CST)
Received: from kwepemf100013.china.huawei.com (unknown [7.202.181.12])
	by mail.maildlp.com (Postfix) with ESMTPS id E06A54056B;
	Fri, 13 Mar 2026 15:54:36 +0800 (CST)
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.189.124) by
 kwepemf100013.china.huawei.com (7.202.181.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 13 Mar 2026 15:54:35 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
	<netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Ioana Ciornei <ioana.ciornei@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, luosifu
	<luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>, Shi Jing
	<shijing34@huawei.com>, Zheng Jiezhen <zhengjiezhen@h-partners.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v01 6/7] hinic3: Configure netdev->watchdog_timeo to set nic tx timeout
Date: Fri, 13 Mar 2026 15:54:13 +0800
Message-ID: <ff2360a7a57f94f3770eb6cd0da98b4231f5fd48.1773387649.git.zhuyikai1@h-partners.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <cover.1773387649.git.zhuyikai1@h-partners.com>
References: <cover.1773387649.git.zhuyikai1@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100013.china.huawei.com (7.202.181.12)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79228-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gongfan1@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[h-partners.com:email,h-partners.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:email]
X-Rspamd-Queue-Id: 3092127F344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Configure netdev watchdog timeout to improve transmission reliability.

Co-developed-by: Zhu Yikai <zhuyikai1@h-partners.com>
Signed-off-by: Zhu Yikai <zhuyikai1@h-partners.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
index de3e71f75f0c..73e6831f5237 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
@@ -33,6 +33,8 @@
 #define HINIC3_RX_PENDING_LIMIT_LOW   2
 #define HINIC3_RX_PENDING_LIMIT_HIGH  8
 
+#define HINIC3_WATCHDOG_TIMEOUT       5
+
 static void init_intr_coal_param(struct net_device *netdev)
 {
 	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
@@ -244,6 +246,8 @@ static void hinic3_assign_netdev_ops(struct net_device *netdev)
 {
 	hinic3_set_netdev_ops(netdev);
 	hinic3_set_ethtool_ops(netdev);
+
+	netdev->watchdog_timeo = HINIC3_WATCHDOG_TIMEOUT * HZ;
 }
 
 static void netdev_feature_init(struct net_device *netdev)
-- 
2.43.0


