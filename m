Return-Path: <linux-doc+bounces-36881-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79893A27DA9
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 22:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B5D1882D18
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 21:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7AF21CA03;
	Tue,  4 Feb 2025 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MgWeM643"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f97.google.com (mail-lf1-f97.google.com [209.85.167.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E921C17B
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705313; cv=none; b=djfW+IUreHWciId4KJOXakvT8ah0U9cWQKr0NC3WOL+/T2m3ud5Q2h7t+1cX83sHR6NjHU2FcyDABFXmZOOOCCcBRro7WcmM0iCppy2fLcIXfeeBLF3+rYw3UvAnKkg/2DcCmkV9qOGT/kQfryM0OjAnpfNqTFklw0RoNek1UWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705313; c=relaxed/simple;
	bh=SkkgRL+aWhhRmH4pjJumNwBZl/4orWE7TU6iXYsD5o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5tdUe0NM/8CDqpjjQa/mbQiG0VF8eSNKLYp1YKulmP4/Xy6I25h5mvOY4+TrJZmThjXknaNOP3cv9rRbd6ZWFzflpQJSjJRRuBrtVsC64HdB1cHsSWLEojUuQvutCNK5ql1qJCuLLA63pt2ADtChcdM08N5DLi7DF5PH+ExfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MgWeM643; arc=none smtp.client-ip=209.85.167.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-lf1-f97.google.com with SMTP id 2adb3069b0e04-53f22fd6832so6699698e87.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738705308; x=1739310108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YkZDn5aiP46G0YmGmDePlUKCzJbx9gAEyIeepD9Ze8=;
        b=MgWeM6435d1eCDBJBaUGAog7dG8SftIWeb2+0FaTP/YPNyAFe9HB/KEPy2jYiuqAPj
         eXoEaoqlHCHlVtVRHo2lyf7sLkUWl7dVcuSVMAVS4poQTZ6wPdeOwIYLwKxywXQNmpeF
         GqwgQGwuaPmLM4XTz2d49LIIaVVpbDjrukBL92meKEm6ikk/7/ZH5PCJ9GaQn54m3+X0
         ojseNaOlnLAoDa1CG+v07tZUWWvFodpNEuXIIgTg6g0rERVBGxljjKi7svF5zDuveYXr
         09xti8ecVs0vnThXSHMDYC+fOyWViKKYeHCIxEcNYI8kFDSC57LOK2Z89Pnaxo5QjoCD
         9VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738705308; x=1739310108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YkZDn5aiP46G0YmGmDePlUKCzJbx9gAEyIeepD9Ze8=;
        b=SQlsr/d27RM0R4T3QPiSFzLHiWXeka/+fKyg94BABMPbSrbj7v3YL3JLwk7h7lbSam
         jheO/G0l6K4u6UfJgM13Sv7URmBc6k0w1V7zxiyYZ93n6IOAlPbUA2X/VoK9iQPv0X82
         717AHjZyRCjWsJDkmBCtJ5vGjoLo/3op0Fej0eZNhWBLv8qF4NUbg1yUVB1SBjTWyY/w
         TmnE6IzBvXw4Ehg+h9Ur5S/Uzd7hDaWWQm5eE6my+C53OEOBUTXAtyWJ+4NNmcTVxlCl
         RyR3HhPfxCVOAbXPKnLDNcFWKRmzCHRUl1bRCjIhALlCMLTsNys+dJOuFxTj4g6y1k+8
         o5wA==
X-Forwarded-Encrypted: i=1; AJvYcCXs7Pjy0Q2nWknBu6Fn4cgOgNTzAkLkUm697yF5akOWbrD6QaJOaft1kvunH87Fkik5pl7NJiIxjJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7D1TQKKzejm0Qqmr1jJwu70A+AY2naz0Xa/wpNpvhtwJKyNea
	44IIVoaWty+8gOYefHDk+3xdJcv+B+gz6jJw8VffcIRC70+bmI1CuphI1ymdfyjc2/yDO6Z8nA7
	dcng4dGCngqlqXCFFs8oKueHjeFLExQK3
X-Gm-Gg: ASbGncsVqP2XDbk3pVjXDk/nTSCNE3fXzSVEmkbNmyxTgoCWtgyUWbCL0W9MtVidIIo
	6IJkzsy58Mven8JqAv8RHmwoTZzQjd2r+Z69xaP//xRCd3C6fnXzGdQgTzgZsAQlOb0eP7i9VCw
	oZ6Q3DYARwXeoQ4VcIoFNIQIAB12B5LzCT3icxr9JPL9onjN5tyDqo7tMlrpqF8DpBtOXxMXo4k
	H/KQZKHOZoE3s4EAvjodkg8ZWKEJf5ysae7xSGNQjowlU85K40QSDFpqlrLezkVbfXAf14RkNf0
	O8Jzi1pSrZtJiw05r+7E6/G/69BYeVKIe+E8iHI=
X-Google-Smtp-Source: AGHT+IFYytsAx7QnkQuNjUJtxyv3Dx96zeS9SwWEsuo4ceOYnCkESLc0Ls7mDKdivbKiWU1TQz2zgZ3ZQ6LP
X-Received: by 2002:a05:6512:2245:b0:542:6f78:2ace with SMTP id 2adb3069b0e04-54405a68b4cmr81688e87.47.1738705307937;
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 2adb3069b0e04-543ebeb0459sm506587e87.89.2025.02.04.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 286A934063A;
	Tue,  4 Feb 2025 14:41:46 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 03F44E41434; Tue,  4 Feb 2025 14:41:46 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 04 Feb 2025 14:41:44 -0700
Subject: [PATCH v2 1/2] net, treewide: define and use MAC_ADDR_LEN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-netconsole-v2-1-5ef5eb5f6056@purestorage.com>
References: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
In-Reply-To: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

There are a few places in the tree which compute the length of the
string representation of a MAC address as 3 * ETH_ALEN - 1. Define a
constant for this and use it where relevant. No functionality changes
are expected.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 drivers/net/netconsole.c           | 2 +-
 drivers/nvmem/brcm_nvram.c         | 2 +-
 drivers/nvmem/layouts/u-boot-env.c | 2 +-
 include/linux/if_ether.h           | 3 +++
 lib/net_utils.c                    | 4 +---
 net/mac80211/debugfs_sta.c         | 5 +++--
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 86ab4a42769a49eebe5dd6f01dafafc6c86ec54f..78c143e65a3f337929f91f70b77e5bc88365eea7 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -675,7 +675,7 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
 
 	if (!mac_pton(buf, remote_mac))
 		goto out_unlock;
-	if (buf[3 * ETH_ALEN - 1] && buf[3 * ETH_ALEN - 1] != '\n')
+	if (buf[MAC_ADDR_LEN] && buf[MAC_ADDR_LEN] != '\n')
 		goto out_unlock;
 	memcpy(nt->np.remote_mac, remote_mac, ETH_ALEN);
 
diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
index b810df727b446b1762a1851750f743e0de6e8788..43608e45c58aa96a505d82733de1b24ef8d18a1b 100644
--- a/drivers/nvmem/brcm_nvram.c
+++ b/drivers/nvmem/brcm_nvram.c
@@ -100,7 +100,7 @@ static int brcm_nvram_read_post_process_macaddr(void *context, const char *id, i
 {
 	u8 mac[ETH_ALEN];
 
-	if (bytes != 3 * ETH_ALEN - 1)
+	if (bytes != MAC_ADDR_LEN)
 		return -EINVAL;
 
 	if (!mac_pton(buf, mac))
diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 731e6f4f12b2bf28e4547d128954a095545ad461..4a6c0d0e6dc90a138bfbb402d401d41f59c021f8 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -37,7 +37,7 @@ static int u_boot_env_read_post_process_ethaddr(void *context, const char *id, i
 {
 	u8 mac[ETH_ALEN];
 
-	if (bytes != 3 * ETH_ALEN - 1)
+	if (bytes != MAC_ADDR_LEN)
 		return -EINVAL;
 
 	if (!mac_pton(buf, mac))
diff --git a/include/linux/if_ether.h b/include/linux/if_ether.h
index 8a9792a6427ad9cf58b50c79cbfe185615800dcb..afb2fdc0af653626034ae5e19309c8427272a828 100644
--- a/include/linux/if_ether.h
+++ b/include/linux/if_ether.h
@@ -19,6 +19,9 @@
 #include <linux/skbuff.h>
 #include <uapi/linux/if_ether.h>
 
+/* XX:XX:XX:XX:XX:XX */
+#define MAC_ADDR_LEN (3 * ETH_ALEN - 1)
+
 static inline struct ethhdr *eth_hdr(const struct sk_buff *skb)
 {
 	return (struct ethhdr *)skb_mac_header(skb);
diff --git a/lib/net_utils.c b/lib/net_utils.c
index 42bb0473fb22f977409f7a6792bb1340f4e911c3..0aedd4854d85ba89dbf0e7451b3f6b197cfac1de 100644
--- a/lib/net_utils.c
+++ b/lib/net_utils.c
@@ -7,11 +7,9 @@
 
 bool mac_pton(const char *s, u8 *mac)
 {
-	size_t maxlen = 3 * ETH_ALEN - 1;
 	int i;
 
-	/* XX:XX:XX:XX:XX:XX */
-	if (strnlen(s, maxlen) < maxlen)
+	if (strnlen(s, MAC_ADDR_LEN) < MAC_ADDR_LEN)
 		return false;
 
 	/* Don't dirty result unless string is valid MAC. */
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index a67a9d3160086ac492d77092a0c8a74d2384b28c..29f45382367e4f6cceb0e0b5f04db1c408da712e 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -457,11 +457,12 @@ static ssize_t link_sta_addr_read(struct file *file, char __user *userbuf,
 				  size_t count, loff_t *ppos)
 {
 	struct link_sta_info *link_sta = file->private_data;
-	u8 mac[3 * ETH_ALEN + 1];
+	u8 mac[MAC_ADDR_LEN + 2];
 
 	snprintf(mac, sizeof(mac), "%pM\n", link_sta->pub->addr);
 
-	return simple_read_from_buffer(userbuf, count, ppos, mac, 3 * ETH_ALEN);
+	return simple_read_from_buffer(userbuf, count, ppos, mac,
+				       MAC_ADDR_LEN + 1);
 }
 
 LINK_STA_OPS(addr);

-- 
2.34.1


