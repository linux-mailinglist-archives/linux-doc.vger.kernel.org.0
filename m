Return-Path: <linux-doc+bounces-77-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F17C562F
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 16:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51637282475
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 14:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F03F200D0;
	Wed, 11 Oct 2023 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioYLjO1H"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA420306;
	Wed, 11 Oct 2023 14:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42B9C433C8;
	Wed, 11 Oct 2023 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697032981;
	bh=v2U61JipGRAw5yHfVClf2xeZ1vepHEnTwO9csgoF7y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ioYLjO1HqpBapuo1S1iyxyyf0UcnmM6CGIlqx/8vb42Do3W/g40+2Uz6P9jaONP2W
	 n8LYIQVU185JW1CaKn5XFRz43CM6jAi9odXt1R1fV9Q7sMtyL5g/WfZ8cIkO+MlUT1
	 2BjnN+t2hWuuQCq+YScg6YL68GQ0CpyOXslq12lyp0MV90gVKkfblNZM5tJl+SvXV1
	 7/Sx6ECMSLnfm1EnCySyzR6YwocgBIEK7SxlLgctU3m13uAte80LR3/Sxcf2TS6aFi
	 h048r5MOVltjxnCJ7qTRzXwxyUpU0+AXNgXK7PoUyPSm5ppbgc5KMztdeuKfIAk9Y3
	 Z9G6PQDpzlx+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wpan@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rodolfo Zitellini <rwz@xhero.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 04/10] staging: ks7010: remove unused ioctl handler
Date: Wed, 11 Oct 2023 16:02:19 +0200
Message-Id: <20231011140225.253106-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011140225.253106-1-arnd@kernel.org>
References: <20231011140225.253106-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The ndo_do_ioctl function has no actual callers, and doesn't do much here,
so just remove it entirely as preparation for removing the callback pointer
from net_device_ops.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/ks7010/ks_wlan_net.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 0fb97a79ad0b3..ab7463bb25169 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -51,8 +51,6 @@ static int ks_wlan_close(struct net_device *dev);
 static void ks_wlan_set_rx_mode(struct net_device *dev);
 static struct net_device_stats *ks_wlan_get_stats(struct net_device *dev);
 static int ks_wlan_set_mac_address(struct net_device *dev, void *addr);
-static int ks_wlan_netdev_ioctl(struct net_device *dev, struct ifreq *rq,
-				int cmd);
 
 static atomic_t update_phyinfo;
 static struct timer_list update_phyinfo_timer;
@@ -2458,24 +2456,6 @@ static const struct iw_handler_def ks_wlan_handler_def = {
 	.get_wireless_stats = ks_get_wireless_stats,
 };
 
-static int ks_wlan_netdev_ioctl(struct net_device *dev, struct ifreq *rq,
-				int cmd)
-{
-	int ret;
-	struct iwreq *wrq = (struct iwreq *)rq;
-
-	switch (cmd) {
-	case SIOCIWFIRSTPRIV + 20:	/* KS_WLAN_SET_STOP_REQ */
-		ret = ks_wlan_set_stop_request(dev, NULL, &wrq->u, NULL);
-		break;
-		// All other calls are currently unsupported
-	default:
-		ret = -EOPNOTSUPP;
-	}
-
-	return ret;
-}
-
 static
 struct net_device_stats *ks_wlan_get_stats(struct net_device *dev)
 {
@@ -2608,7 +2588,6 @@ static const struct net_device_ops ks_wlan_netdev_ops = {
 	.ndo_start_xmit = ks_wlan_start_xmit,
 	.ndo_open = ks_wlan_open,
 	.ndo_stop = ks_wlan_close,
-	.ndo_do_ioctl = ks_wlan_netdev_ioctl,
 	.ndo_set_mac_address = ks_wlan_set_mac_address,
 	.ndo_get_stats = ks_wlan_get_stats,
 	.ndo_tx_timeout = ks_wlan_tx_timeout,
-- 
2.39.2


