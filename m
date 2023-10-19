Return-Path: <linux-doc+bounces-653-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D87CFCB8
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 16:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96C471C20E59
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 14:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E222FE30;
	Thu, 19 Oct 2023 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Or8Z4ZzP"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB417321B9;
	Thu, 19 Oct 2023 14:30:06 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911821A8;
	Thu, 19 Oct 2023 07:30:02 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77A9C60004;
	Thu, 19 Oct 2023 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697725800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UL3dPQ+WlkR8wmYXFv5cwsj7UFhnBxJy6YYHytPVUdQ=;
	b=Or8Z4ZzP+fceE8fXpWT9SuV8UMDkCUptCmK4tvvxWoWEFMPE7uIVTIY575vXDb2wTkgO+c
	/P/zFgSI0A/4M2Nq2VSxxjitAt7ar2J3WWTKwFbIvMEB4/DCb9t3d6HYwccNCptIWqdFRK
	MlMxMeLQ6k6spyTv35vGoHvwIGQdnKKYLmgnb6nwh2LJZQHEM9WyyqetpxvqHfgFZSWxLt
	8jwRnqc9EzqlREvXqbyarO4nh5medBUPomVwpQI/el0djGsdIphnL+mvqYzx2qaOqwxqMk
	pdwX1RF79hAp0AroBKR5nZhEDvthONnuYQOLk8TslpQcATjz8yZMc7e3WcexKA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 19 Oct 2023 16:29:30 +0200
Subject: [PATCH net-next v6 15/16] net ethtool: net: Let the active time
 stamping layer be selectable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231019-feature_ptp_netnext-v6-15-71affc27b0e5@bootlin.com>
References: <20231019-feature_ptp_netnext-v6-0-71affc27b0e5@bootlin.com>
In-Reply-To: <20231019-feature_ptp_netnext-v6-0-71affc27b0e5@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Radu Pirea <radu-nicolae.pirea@oss.nxp.com>, 
 Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: kory.maincent@bootlin.com

Now that the current timestamp is saved in a variable lets add the
ETHTOOL_MSG_TS_SET ethtool netlink socket to make it selectable.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- Move selected_timestamping_layer introduction in this patch.
- Replace strmcmp by sysfs_streq.
- Use the PHY timestamp only if available.

Changes in v3:
- Add a devicetree binding to select the preferred timestamp
- Replace the way to select timestamp through ethtool instead of sysfs
You can test it with the ethtool source on branch feature_ptp of:
https://github.com/kmaincent/ethtool

Changes in v4:
- Change the API to select MAC default time stamping instead of the PHY.
- Add a whitelist to no break the old timestamp PHY default preferences
  for current PHY.
- Replace the ethtool ioctl by netlink.
- Add a netdev notifier to allow network device to create trap on PTP
  packets. Not tested as it need to change the lan966x driver that
  implement packet traps. I will do after the hwtstamp management change
  to NDOs.

Changes in v5:
- Remove the netdev notifier added in v4.
- Extract the default timestamp API change in another patch.

Changes in v6:
- Update the error message.
- Put ndo_hwtstamp_set check first as it is most likely what most drivers
  currently do not support.
- Follow timestamping layer naming update.
- Update the timestamp layer check.
- Update timestamp set between MAC and software.
---
 Documentation/networking/ethtool-netlink.rst | 17 +++++
 include/uapi/linux/ethtool_netlink.h         |  1 +
 net/ethtool/netlink.c                        |  8 +++
 net/ethtool/netlink.h                        |  1 +
 net/ethtool/ts.c                             | 99 ++++++++++++++++++++++++++++
 5 files changed, 126 insertions(+)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index b8d00676ed82..530c1775e5f4 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -227,6 +227,7 @@ Userspace to kernel:
   ``ETHTOOL_MSG_MM_SET``                set MAC merge layer parameters
   ``ETHTOOL_MSG_TS_GET``                get current timestamping
   ``ETHTOOL_MSG_TS_LIST_GET``           list available timestampings
+  ``ETHTOOL_MSG_TS_SET``                set current timestamping
   ===================================== =================================
 
 Kernel to userspace:
@@ -2038,6 +2039,21 @@ Kernel response contents:
 
 This command lists all the possible timestamp layer available.
 
+TS_SET
+======
+
+Modify the selected timestamping.
+
+Request contents:
+
+  =======================  ======  ===================
+  ``ETHTOOL_A_TS_HEADER``  nested  reply header
+  ``ETHTOOL_A_TS_LAYER``   u32     timestamping
+  =======================  ======  ===================
+
+This command set the timestamping with one that should be listed by the
+TSLIST_GET command.
+
 Request translation
 ===================
 
@@ -2146,4 +2162,5 @@ are netlink only.
   n/a                                 ``ETHTOOL_MSG_MM_SET``
   n/a                                 ``ETHTOOL_MSG_TS_GET``
   n/a                                 ``ETHTOOL_MSG_TS_LIST_GET``
+  n/a                                 ``ETHTOOL_MSG_TS_SET``
   =================================== =====================================
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index 62b885d44d06..df6c4fcc62c1 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -59,6 +59,7 @@ enum {
 	ETHTOOL_MSG_MM_SET,
 	ETHTOOL_MSG_TS_GET,
 	ETHTOOL_MSG_TS_LIST_GET,
+	ETHTOOL_MSG_TS_SET,
 
 	/* add new constants above here */
 	__ETHTOOL_MSG_USER_CNT,
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 842c9db1531f..8322bf71f80d 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -308,6 +308,7 @@ ethnl_default_requests[__ETHTOOL_MSG_USER_CNT] = {
 	[ETHTOOL_MSG_MM_SET]		= &ethnl_mm_request_ops,
 	[ETHTOOL_MSG_TS_GET]		= &ethnl_ts_request_ops,
 	[ETHTOOL_MSG_TS_LIST_GET]	= &ethnl_ts_list_request_ops,
+	[ETHTOOL_MSG_TS_SET]		= &ethnl_ts_request_ops,
 };
 
 static struct ethnl_dump_ctx *ethnl_dump_context(struct netlink_callback *cb)
@@ -1148,6 +1149,13 @@ static const struct genl_ops ethtool_genl_ops[] = {
 		.policy = ethnl_ts_get_policy,
 		.maxattr = ARRAY_SIZE(ethnl_ts_get_policy) - 1,
 	},
+	{
+		.cmd	= ETHTOOL_MSG_TS_SET,
+		.flags	= GENL_UNS_ADMIN_PERM,
+		.doit	= ethnl_default_set_doit,
+		.policy = ethnl_ts_set_policy,
+		.maxattr = ARRAY_SIZE(ethnl_ts_set_policy) - 1,
+	},
 };
 
 static const struct genl_multicast_group ethtool_nl_mcgrps[] = {
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index ea8c312db3af..8fedf234b824 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -444,6 +444,7 @@ extern const struct nla_policy ethnl_plca_get_status_policy[ETHTOOL_A_PLCA_HEADE
 extern const struct nla_policy ethnl_mm_get_policy[ETHTOOL_A_MM_HEADER + 1];
 extern const struct nla_policy ethnl_mm_set_policy[ETHTOOL_A_MM_MAX + 1];
 extern const struct nla_policy ethnl_ts_get_policy[ETHTOOL_A_TS_HEADER + 1];
+extern const struct nla_policy ethnl_ts_set_policy[ETHTOOL_A_TS_MAX + 1];
 
 int ethnl_set_features(struct sk_buff *skb, struct genl_info *info);
 int ethnl_act_cable_test(struct sk_buff *skb, struct genl_info *info);
diff --git a/net/ethtool/ts.c b/net/ethtool/ts.c
index bd219512b8de..357265e74e08 100644
--- a/net/ethtool/ts.c
+++ b/net/ethtool/ts.c
@@ -59,6 +59,102 @@ static int ts_fill_reply(struct sk_buff *skb,
 	return nla_put_u32(skb, ETHTOOL_A_TS_LAYER, data->ts_layer);
 }
 
+/* TS_SET */
+const struct nla_policy ethnl_ts_set_policy[] = {
+	[ETHTOOL_A_TS_HEADER]	= NLA_POLICY_NESTED(ethnl_header_policy),
+	[ETHTOOL_A_TS_LAYER]	= NLA_POLICY_RANGE(NLA_U32, 0,
+						   __TIMESTAMPING_COUNT - 1)
+};
+
+static int ethnl_set_ts_validate(struct ethnl_req_info *req_info,
+				 struct genl_info *info)
+{
+	struct nlattr **tb = info->attrs;
+	const struct net_device_ops *ops = req_info->dev->netdev_ops;
+
+	if (!ops->ndo_hwtstamp_set)
+		return -EOPNOTSUPP;
+
+	if (!tb[ETHTOOL_A_TS_LAYER])
+		return 0;
+
+	return 1;
+}
+
+static int ethnl_set_ts(struct ethnl_req_info *req_info, struct genl_info *info)
+{
+	struct net_device *dev = req_info->dev;
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct kernel_hwtstamp_config config = {0};
+	struct nlattr **tb = info->attrs;
+	enum timestamping_layer ts_layer;
+	bool mod = false;
+	int ret;
+
+	ts_layer = dev->ts_layer;
+	ethnl_update_u32(&ts_layer, tb[ETHTOOL_A_TS_LAYER], &mod);
+
+	if (!mod)
+		return 0;
+
+	if (ts_layer == SOFTWARE_TIMESTAMPING) {
+		struct ethtool_ts_info ts_info = {0};
+
+		if (!ops->get_ts_info) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[ETHTOOL_A_TS_LAYER],
+					    "this net device cannot support timestamping");
+			return -EINVAL;
+		}
+
+		ops->get_ts_info(dev, &ts_info);
+		if ((ts_info.so_timestamping &
+		    SOF_TIMESTAMPING_SOFTWARE_MASK) !=
+		    SOF_TIMESTAMPING_SOFTWARE_MASK) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[ETHTOOL_A_TS_LAYER],
+					    "this net device cannot support software timestamping");
+			return -EINVAL;
+		}
+	} else if (ts_layer == MAC_TIMESTAMPING) {
+		struct ethtool_ts_info ts_info = {0};
+
+		if (!ops->get_ts_info) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[ETHTOOL_A_TS_LAYER],
+					    "this net device cannot support timestamping");
+			return -EINVAL;
+		}
+
+		ops->get_ts_info(dev, &ts_info);
+		if ((ts_info.so_timestamping &
+		    SOF_TIMESTAMPING_HARDWARE_MASK) !=
+		    SOF_TIMESTAMPING_HARDWARE_MASK) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[ETHTOOL_A_TS_LAYER],
+					    "this net device cannot support hardware timestamping");
+			return -EINVAL;
+		}
+	} else if (ts_layer == PHY_TIMESTAMPING && !phy_has_tsinfo(dev->phydev)) {
+		NL_SET_ERR_MSG_ATTR(info->extack, tb[ETHTOOL_A_TS_LAYER],
+				    "this phy device cannot support timestamping");
+		return -EINVAL;
+	}
+
+	/* Disable time stamping in the current layer. */
+	if (netif_device_present(dev) &&
+	    (dev->ts_layer == PHY_TIMESTAMPING ||
+	    dev->ts_layer == MAC_TIMESTAMPING)) {
+		ret = dev_set_hwtstamp_phylib(dev, &config, info->extack);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev->ts_layer = ts_layer;
+
+	return 1;
+}
+
 const struct ethnl_request_ops ethnl_ts_request_ops = {
 	.request_cmd		= ETHTOOL_MSG_TS_GET,
 	.reply_cmd		= ETHTOOL_MSG_TS_GET_REPLY,
@@ -69,6 +165,9 @@ const struct ethnl_request_ops ethnl_ts_request_ops = {
 	.prepare_data		= ts_prepare_data,
 	.reply_size		= ts_reply_size,
 	.fill_reply		= ts_fill_reply,
+
+	.set_validate		= ethnl_set_ts_validate,
+	.set			= ethnl_set_ts,
 };
 
 /* TS_LIST_GET */

-- 
2.25.1


