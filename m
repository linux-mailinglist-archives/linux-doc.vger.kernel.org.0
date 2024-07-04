Return-Path: <linux-doc+bounces-20052-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1435927159
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 10:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32F9EB21B8A
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 08:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177C61AAE20;
	Thu,  4 Jul 2024 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bho9Q2AX"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335C1A3BAE;
	Thu,  4 Jul 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720080748; cv=none; b=u2LkCb6YrB7iX+b+rfK3auXFgGHQJ07PeDtzQpdNheHmZB6IRZYK/n1l6aZxFG+j2fSm4wnUYOEmHl8hbrNe+7HJI2mrHjJlt0NYkHiKMIg5W9RX/6vC+1kJrF38gGRwZ7KTmvS4ji/7qZh1aNfUiEloQFg32I6QSZ1WCyy2xdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720080748; c=relaxed/simple;
	bh=auS28cjAhrlZl34MKXkbzT+KdXcavVODNqeJc+tuh2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI6lQwM0UlsXaJspzldmb9xjeaGbvs+cLnDvGdzwfcTK0/bGfG4NBh/zesB6Y3tAbTQh+anXZPlmoCuypXZlEU+8MA8W9lZZYUqMoAQwzEjRW9Ru0Gf17w3HcUOHIKlLFAbt4sd4YS944nqbBuKeKdKHnvaKfki5q9xOotcG7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bho9Q2AX; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDE021BF20D;
	Thu,  4 Jul 2024 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720080738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMpHcQ2j+VlDL0txVbbCcO3+dDvA0atDrQObxT86lgw=;
	b=bho9Q2AXVJmziesnnYPfjZ7QRv1uGq1V18NXDupxIKQ/rlVtKMpHniNeAgPqrMeOoQwZoZ
	htTeHMZGSN/EJBeUYp8F4fm7dJnHDRg1lQDL4SUt9b8s/pOJ/eV+teUROyb+1jj3kE5qdZ
	yUz1ooiVfHxP8l6Yk1QVNN2l0rxsalKbIVlnoez4Kqg36KQcsbIeKT0VwhOmW34LSV2Wdv
	QIHiNyrP3J0T9Jhr++u4xjNUvD5jB4Azrbc3v/orXFLrzZpcw8ozhh8r2rk07LGQZUH+/q
	r8WM/SGmz3QeJ7jGe2ZQtMIHhyPaK8aVXzeKb2q/ntgAMQruUu++bjmt4eK9kg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 04 Jul 2024 10:12:00 +0200
Subject: [PATCH net-next v6 5/7] net: ethtool: Add new power limit get and
 set features
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-feature_poe_power_cap-v6-5-320003204264@bootlin.com>
References: <20240704-feature_poe_power_cap-v6-0-320003204264@bootlin.com>
In-Reply-To: <20240704-feature_poe_power_cap-v6-0-320003204264@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de, 
 linux-doc@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-Sasl: kory.maincent@bootlin.com

From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

This patch expands the status information provided by ethtool for PSE c33
with available power limit and available power limit ranges. It also adds
a call to pse_ethtool_set_pw_limit() to configure the PSE control power
limit.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v3:
- Add ethtool netlink documentation.

Change in v4:
- Update documentation
- Add support for c33 pse power limit ranges.
---
 Documentation/networking/ethtool-netlink.rst | 64 ++++++++++++++------
 include/linux/ethtool.h                      |  5 ++
 include/uapi/linux/ethtool_netlink.h         |  8 +++
 net/ethtool/pse-pd.c                         | 89 +++++++++++++++++++++++++---
 4 files changed, 141 insertions(+), 25 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 0656ad4be000..3ab423b80e91 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1730,24 +1730,28 @@ Request contents:
 
 Kernel response contents:
 
-  ======================================  ======  =============================
-  ``ETHTOOL_A_PSE_HEADER``                nested  reply header
-  ``ETHTOOL_A_PODL_PSE_ADMIN_STATE``         u32  Operational state of the PoDL
-                                                  PSE functions
-  ``ETHTOOL_A_PODL_PSE_PW_D_STATUS``         u32  power detection status of the
-                                                  PoDL PSE.
-  ``ETHTOOL_A_C33_PSE_ADMIN_STATE``          u32  Operational state of the PoE
-                                                  PSE functions.
-  ``ETHTOOL_A_C33_PSE_PW_D_STATUS``          u32  power detection status of the
-                                                  PoE PSE.
-  ``ETHTOOL_A_C33_PSE_PW_CLASS``             u32  power class of the PoE PSE.
-  ``ETHTOOL_A_C33_PSE_ACTUAL_PW``            u32  actual power drawn on the
-                                                  PoE PSE.
-  ``ETHTOOL_A_C33_PSE_EXT_STATE``            u32  power extended state of the
-                                                  PoE PSE.
-  ``ETHTOOL_A_C33_PSE_EXT_SUBSTATE``         u32  power extended substatus of
-                                                  the PoE PSE.
-  ======================================  ======  =============================
+  ==========================================  ======  =============================
+  ``ETHTOOL_A_PSE_HEADER``                    nested  reply header
+  ``ETHTOOL_A_PODL_PSE_ADMIN_STATE``             u32  Operational state of the PoDL
+                                                      PSE functions
+  ``ETHTOOL_A_PODL_PSE_PW_D_STATUS``             u32  power detection status of the
+                                                      PoDL PSE.
+  ``ETHTOOL_A_C33_PSE_ADMIN_STATE``              u32  Operational state of the PoE
+                                                      PSE functions.
+  ``ETHTOOL_A_C33_PSE_PW_D_STATUS``              u32  power detection status of the
+                                                      PoE PSE.
+  ``ETHTOOL_A_C33_PSE_PW_CLASS``                 u32  power class of the PoE PSE.
+  ``ETHTOOL_A_C33_PSE_ACTUAL_PW``                u32  actual power drawn on the
+                                                      PoE PSE.
+  ``ETHTOOL_A_C33_PSE_EXT_STATE``                u32  power extended state of the
+                                                      PoE PSE.
+  ``ETHTOOL_A_C33_PSE_EXT_SUBSTATE``             u32  power extended substatus of
+                                                      the PoE PSE.
+  ``ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT``           u32  currently configured power
+                                                      limit of the PoE PSE.
+  ``ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES``       nested  Supported power limit
+                                                      configuration ranges.
+  ==========================================  ======  =============================
 
 When set, the optional ``ETHTOOL_A_PODL_PSE_ADMIN_STATE`` attribute identifies
 the operational state of the PoDL PSE functions.  The operational state of the
@@ -1809,6 +1813,16 @@ Possible values are:
 		  ethtool_c33_pse_ext_substate_power_not_available
 		  ethtool_c33_pse_ext_substate_short_detected
 
+When set, the optional ``ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT`` attribute
+identifies the C33 PSE power limit in mW.
+
+When set the optional ``ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES`` nested attribute
+identifies the C33 PSE power limit ranges through
+``ETHTOOL_A_C33_PSE_PWR_VAL_LIMIT_RANGE_MIN`` and
+``ETHTOOL_A_C33_PSE_PWR_VAL_LIMIT_RANGE_MAX``.
+If the controller works with fixed classes, the min and max values will be
+equal.
+
 PSE_SET
 =======
 
@@ -1820,6 +1834,8 @@ Request contents:
   ``ETHTOOL_A_PSE_HEADER``                nested  request header
   ``ETHTOOL_A_PODL_PSE_ADMIN_CONTROL``       u32  Control PoDL PSE Admin state
   ``ETHTOOL_A_C33_PSE_ADMIN_CONTROL``        u32  Control PSE Admin state
+  ``ETHTOOL_A_C33_PSE_AVAIL_PWR_LIMIT``      u32  Control PoE PSE available
+                                                  power limit
   ======================================  ======  =============================
 
 When set, the optional ``ETHTOOL_A_PODL_PSE_ADMIN_CONTROL`` attribute is used
@@ -1830,6 +1846,18 @@ to control PoDL PSE Admin functions. This option is implementing
 The same goes for ``ETHTOOL_A_C33_PSE_ADMIN_CONTROL`` implementing
 ``IEEE 802.3-2022`` 30.9.1.2.1 acPSEAdminControl.
 
+When set, the optional ``ETHTOOL_A_C33_PSE_AVAIL_PWR_LIMIT`` attribute is
+used to control the available power value limit for C33 PSE in milliwatts.
+This attribute corresponds  to the `pse_available_power` variable described in
+``IEEE 802.3-2022`` 33.2.4.4 Variables  and `pse_avail_pwr` in 145.2.5.4
+Variables, which are described in power classes.
+
+It was decided to use milliwatts for this interface to unify it with other
+power monitoring interfaces, which also use milliwatts, and to align with
+various existing products that document power consumption in watts rather than
+classes. If power limit configuration based on classes is needed, the
+conversion can be done in user space, for example by ethtool.
+
 RSS_GET
 =======
 
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 4d1fc0679d5d..784e63102c3a 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1286,4 +1286,9 @@ struct ethtool_c33_pse_ext_state_info {
 		u32 __c33_pse_ext_substate;
 	};
 };
+
+struct ethtool_c33_pse_pw_limit_range {
+	u32 min;
+	u32 max;
+};
 #endif /* _LINUX_ETHTOOL_H */
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index b8895da001bc..6d5bdcc67631 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -930,6 +930,12 @@ enum {
 };
 
 /* Power Sourcing Equipment */
+enum {
+	ETHTOOL_A_C33_PSE_PW_LIMIT_UNSPEC,
+	ETHTOOL_A_C33_PSE_PW_LIMIT_MIN,	/* u32 */
+	ETHTOOL_A_C33_PSE_PW_LIMIT_MAX,	/* u32 */
+};
+
 enum {
 	ETHTOOL_A_PSE_UNSPEC,
 	ETHTOOL_A_PSE_HEADER,			/* nest - _A_HEADER_* */
@@ -943,6 +949,8 @@ enum {
 	ETHTOOL_A_C33_PSE_ACTUAL_PW,		/* u32 */
 	ETHTOOL_A_C33_PSE_EXT_STATE,		/* u32 */
 	ETHTOOL_A_C33_PSE_EXT_SUBSTATE,		/* u32 */
+	ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT,	/* u32 */
+	ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES,	/* nest - _C33_PSE_PW_LIMIT_* */
 
 	/* add new constants above here */
 	__ETHTOOL_A_PSE_CNT,
diff --git a/net/ethtool/pse-pd.c b/net/ethtool/pse-pd.c
index d2a1c14d789f..ba46c9c8b12d 100644
--- a/net/ethtool/pse-pd.c
+++ b/net/ethtool/pse-pd.c
@@ -96,9 +96,46 @@ static int pse_reply_size(const struct ethnl_req_info *req_base,
 			/* _C33_PSE_EXT_SUBSTATE */
 			len += nla_total_size(sizeof(u32));
 	}
+	if (st->c33_avail_pw_limit > 0)
+		/* _C33_AVAIL_PSE_PW_LIMIT */
+		len += nla_total_size(sizeof(u32));
+	if (st->c33_pw_limit_nb_ranges > 0)
+		/* _C33_PSE_PW_LIMIT_RANGES */
+		len += st->c33_pw_limit_nb_ranges *
+		       (nla_total_size(0) +
+			nla_total_size(sizeof(u32)) * 2);
+
 	return len;
 }
 
+static int pse_put_pw_limit_ranges(struct sk_buff *skb,
+				   const struct pse_control_status *st)
+{
+	const struct ethtool_c33_pse_pw_limit_range *pw_limit_ranges;
+	int i;
+
+	pw_limit_ranges = st->c33_pw_limit_ranges;
+	for (i = 0; i < st->c33_pw_limit_nb_ranges; i++) {
+		struct nlattr *nest;
+
+		nest = nla_nest_start(skb, ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES);
+		if (!nest)
+			return -EMSGSIZE;
+
+		if (nla_put_u32(skb, ETHTOOL_A_C33_PSE_PW_LIMIT_MIN,
+				pw_limit_ranges->min) ||
+		    nla_put_u32(skb, ETHTOOL_A_C33_PSE_PW_LIMIT_MAX,
+				pw_limit_ranges->max)) {
+			nla_nest_cancel(skb, nest);
+			return -EMSGSIZE;
+		}
+		nla_nest_end(skb, nest);
+		pw_limit_ranges++;
+	}
+
+	return 0;
+}
+
 static int pse_fill_reply(struct sk_buff *skb,
 			  const struct ethnl_req_info *req_base,
 			  const struct ethnl_reply_data *reply_base)
@@ -147,9 +184,25 @@ static int pse_fill_reply(struct sk_buff *skb,
 			return -EMSGSIZE;
 	}
 
+	if (st->c33_avail_pw_limit > 0 &&
+	    nla_put_u32(skb, ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT,
+			st->c33_avail_pw_limit))
+		return -EMSGSIZE;
+
+	if (st->c33_pw_limit_nb_ranges > 0 &&
+	    pse_put_pw_limit_ranges(skb, st))
+		return -EMSGSIZE;
+
 	return 0;
 }
 
+static void pse_cleanup_data(struct ethnl_reply_data *reply_base)
+{
+	const struct pse_reply_data *data = PSE_REPDATA(reply_base);
+
+	kfree(data->status.c33_pw_limit_ranges);
+}
+
 /* PSE_SET */
 
 const struct nla_policy ethnl_pse_set_policy[ETHTOOL_A_PSE_MAX + 1] = {
@@ -160,6 +213,7 @@ const struct nla_policy ethnl_pse_set_policy[ETHTOOL_A_PSE_MAX + 1] = {
 	[ETHTOOL_A_C33_PSE_ADMIN_CONTROL] =
 		NLA_POLICY_RANGE(NLA_U32, ETHTOOL_C33_PSE_ADMIN_STATE_DISABLED,
 				 ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED),
+	[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT] = { .type = NLA_U32 },
 };
 
 static int
@@ -202,19 +256,39 @@ static int
 ethnl_set_pse(struct ethnl_req_info *req_info, struct genl_info *info)
 {
 	struct net_device *dev = req_info->dev;
-	struct pse_control_config config = {};
 	struct nlattr **tb = info->attrs;
 	struct phy_device *phydev;
+	int ret = 0;
 
 	phydev = dev->phydev;
+
+	if (tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]) {
+		unsigned int pw_limit;
+
+		pw_limit = nla_get_u32(tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]);
+		ret = pse_ethtool_set_pw_limit(phydev->psec, info->extack,
+					       pw_limit);
+		if (ret)
+			return ret;
+	}
+
 	/* These values are already validated by the ethnl_pse_set_policy */
-	if (pse_has_podl(phydev->psec))
-		config.podl_admin_control = nla_get_u32(tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL]);
-	if (pse_has_c33(phydev->psec))
-		config.c33_admin_control = nla_get_u32(tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]);
+	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] ||
+	    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]) {
+		struct pse_control_config config = {};
+
+		if (pse_has_podl(phydev->psec))
+			config.podl_admin_control = nla_get_u32(tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL]);
+		if (pse_has_c33(phydev->psec))
+			config.c33_admin_control = nla_get_u32(tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]);
+
+		ret = pse_ethtool_set_config(phydev->psec, info->extack,
+					     &config);
+		if (ret)
+			return ret;
+	}
 
-	/* Return errno directly - PSE has no notification */
-	return pse_ethtool_set_config(phydev->psec, info->extack, &config);
+	return ret;
 }
 
 const struct ethnl_request_ops ethnl_pse_request_ops = {
@@ -227,6 +301,7 @@ const struct ethnl_request_ops ethnl_pse_request_ops = {
 	.prepare_data		= pse_prepare_data,
 	.reply_size		= pse_reply_size,
 	.fill_reply		= pse_fill_reply,
+	.cleanup_data		= pse_cleanup_data,
 
 	.set_validate		= ethnl_set_pse_validate,
 	.set			= ethnl_set_pse,

-- 
2.34.1


