Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F50661B46
	for <lists+linux-doc@lfdr.de>; Mon,  9 Jan 2023 01:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbjAIAKa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 8 Jan 2023 19:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234145AbjAIAKV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Jan 2023 19:10:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DD4AE4A;
        Sun,  8 Jan 2023 16:10:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bs20so6635306wrb.3;
        Sun, 08 Jan 2023 16:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMrIM6YssKaEPoFZ9LOt30nqF6xMSq6D33IegihphN4=;
        b=TI58KKOWpgBG4GmfeCgfMCU/1TF5AWbCIyW0shN0AbPlnLPDzg5/W7MZai7V909ARK
         e8riTA6xqyBFnMXJzdxHMCYjahZFu5LuVIdgsm4Yr9B0eexvFoVUkK/xI5gA63ZC6dhp
         tJ9/oM3VHzkILAVBrQwKNXL9WccFaRcpMRB17Yc2wE1NGLfZSjJ9nvC3/XeKf4zmDWEb
         XKekmVvlBs8pnXh9NMc8IrLQcSLiVQDZXEu2P9ifESn5o6mpM23Dgv11JMQKOk+Oe+o/
         TV2W6xhaX5okgZ3YRuNN+LIioNz0suUtejxiaQXczMhklB3/ECNjf18QxKqu+D0VxPcX
         3PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMrIM6YssKaEPoFZ9LOt30nqF6xMSq6D33IegihphN4=;
        b=tEmBpZ5bYMct+8ESFIwrtELWfHsVFib9q56+Sz5WN72i/yhD5eifka/uxFE1tyVOYA
         DTFzrNIVxfW1kOqVU042xJsHKM9hEcIJtpDZ8oe6123PuB4ZwPR7VPrvBzRh6Qj7Ibv+
         fHhsTBt6oX3egzOLSwEbMw15dkBug2crZkXpEtJ0pVPXNoFslsvha4NrhP7cr+4KLspE
         KUns+zgkQ4PEgCAnsLGo/pGQL/OHLkZBmVKAAbDk3ugBSufwDKzxjo4Vjv+S6VcylPrb
         W4a3rAyUJfiexSqaV2ApC7rJhqMweaKRTakbrfO106UTIs/pmmDKdz4dtehsfiC9Bmg7
         MLnA==
X-Gm-Message-State: AFqh2kpi7LaI+oynTi7jmezdMXC70+MWThJd/o+RAHTmiCmkTTUKRYKH
        2bmi4mBU4t/lG78Gg1r2Co8=
X-Google-Smtp-Source: AMrXdXuKL//N12gXCkF3ldc7fGQT9NYa89ntmbMh4ybh8lOh60tSAFF9bpaKkPBvaLL3qhRVqgCjtg==
X-Received: by 2002:a5d:4ace:0:b0:2bb:dca3:b29 with SMTP id y14-20020a5d4ace000000b002bbdca30b29mr3211167wrs.36.1673223007294;
        Sun, 08 Jan 2023 16:10:07 -0800 (PST)
Received: from gvm01 (net-5-89-66-224.cust.vodafonedsl.it. [5.89.66.224])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm1636503wrv.11.2023.01.08.16.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:10:06 -0800 (PST)
Date:   Mon, 9 Jan 2023 01:10:05 +0100
From:   Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        mailhol.vincent@wanadoo.fr, sudheer.mogilappagari@intel.com,
        sbhatta@marvell.com, linux-doc@vger.kernel.org,
        wangjie125@huawei.com, corbet@lwn.net, lkp@intel.com,
        gal@nvidia.com, gustavoars@kernel.org, bagasdotme@gmail.com
Subject: [PATCH v3 net-next 2/5] drivers/net/phy: add the link modes for the
 10BASE-T1S Ethernet PHY
Message-ID: <5fb6ea1640198db2490b430f2fd297d9fb8aff7f.1673222807.git.piergiorgio.beruto@gmail.com>
References: <cover.1673222807.git.piergiorgio.beruto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673222807.git.piergiorgio.beruto@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds the link modes for the IEEE 802.3cg Clause 147 10BASE-T1S
Ethernet PHY. According to the specifications, the 10BASE-T1S supports
Point-To-Point Full-Duplex, Point-To-Point Half-Duplex and/or
Point-To-Multipoint (AKA Multi-Drop) Half-Duplex operations.

Signed-off-by: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/phy-core.c   |  5 ++++-
 drivers/net/phy/phy_device.c | 14 ++++++++++++++
 drivers/net/phy/phylink.c    |  6 +++++-
 include/linux/phy.h          | 14 ++++++++++++++
 include/uapi/linux/ethtool.h |  3 +++
 net/ethtool/common.c         |  8 ++++++++
 6 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 5d08c627a516..a64186dc53f8 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -13,7 +13,7 @@
  */
 const char *phy_speed_to_str(int speed)
 {
-	BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 99,
+	BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 102,
 		"Enum ethtool_link_mode_bit_indices and phylib are out of sync. "
 		"If a speed or mode has been added please update phy_speed_to_str "
 		"and the PHY settings array.\n");
@@ -260,6 +260,9 @@ static const struct phy_setting settings[] = {
 	PHY_SETTING(     10, FULL,     10baseT_Full		),
 	PHY_SETTING(     10, HALF,     10baseT_Half		),
 	PHY_SETTING(     10, FULL,     10baseT1L_Full		),
+	PHY_SETTING(     10, FULL,     10baseT1S_Full		),
+	PHY_SETTING(     10, HALF,     10baseT1S_Half		),
+	PHY_SETTING(     10, HALF,     10baseT1S_P2MP_Half	),
 };
 #undef PHY_SETTING
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 716870a4499c..8e48b3cec5e7 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -45,6 +45,9 @@ EXPORT_SYMBOL_GPL(phy_basic_features);
 __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_basic_t1_features) __ro_after_init;
 EXPORT_SYMBOL_GPL(phy_basic_t1_features);
 
+__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_basic_t1s_p2mp_features) __ro_after_init;
+EXPORT_SYMBOL_GPL(phy_basic_t1s_p2mp_features);
+
 __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_gbit_features) __ro_after_init;
 EXPORT_SYMBOL_GPL(phy_gbit_features);
 
@@ -98,6 +101,12 @@ const int phy_basic_t1_features_array[3] = {
 };
 EXPORT_SYMBOL_GPL(phy_basic_t1_features_array);
 
+const int phy_basic_t1s_p2mp_features_array[2] = {
+	ETHTOOL_LINK_MODE_TP_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT,
+};
+EXPORT_SYMBOL_GPL(phy_basic_t1s_p2mp_features_array);
+
 const int phy_gbit_features_array[2] = {
 	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
 	ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
@@ -138,6 +147,11 @@ static void features_init(void)
 			       ARRAY_SIZE(phy_basic_t1_features_array),
 			       phy_basic_t1_features);
 
+	/* 10 half, P2MP, TP */
+	linkmode_set_bit_array(phy_basic_t1s_p2mp_features_array,
+			       ARRAY_SIZE(phy_basic_t1s_p2mp_features_array),
+			       phy_basic_t1s_p2mp_features);
+
 	/* 10/100 half/full + 1000 half/full */
 	linkmode_set_bit_array(phy_basic_ports_array,
 			       ARRAY_SIZE(phy_basic_ports_array),
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 09cc65c0da93..319790221d7f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -241,12 +241,16 @@ void phylink_caps_to_linkmodes(unsigned long *linkmodes, unsigned long caps)
 	if (caps & MAC_ASYM_PAUSE)
 		__set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, linkmodes);
 
-	if (caps & MAC_10HD)
+	if (caps & MAC_10HD) {
 		__set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, linkmodes);
+		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_Half_BIT, linkmodes);
+		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT, linkmodes);
+	}
 
 	if (caps & MAC_10FD) {
 		__set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, linkmodes);
 		__set_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT, linkmodes);
+		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_Full_BIT, linkmodes);
 	}
 
 	if (caps & MAC_100HD) {
diff --git a/include/linux/phy.h b/include/linux/phy.h
index c2c04b989cc2..1e87d3f05209 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -45,6 +45,7 @@
 
 extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_basic_features) __ro_after_init;
 extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_basic_t1_features) __ro_after_init;
+extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_basic_t1s_p2mp_features) __ro_after_init;
 extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_gbit_features) __ro_after_init;
 extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_gbit_fibre_features) __ro_after_init;
 extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_gbit_all_ports_features) __ro_after_init;
@@ -54,6 +55,7 @@ extern __ETHTOOL_DECLARE_LINK_MODE_MASK(phy_10gbit_full_features) __ro_after_ini
 
 #define PHY_BASIC_FEATURES ((unsigned long *)&phy_basic_features)
 #define PHY_BASIC_T1_FEATURES ((unsigned long *)&phy_basic_t1_features)
+#define PHY_BASIC_T1S_P2MP_FEATURES ((unsigned long *)&phy_basic_t1s_p2mp_features)
 #define PHY_GBIT_FEATURES ((unsigned long *)&phy_gbit_features)
 #define PHY_GBIT_FIBRE_FEATURES ((unsigned long *)&phy_gbit_fibre_features)
 #define PHY_GBIT_ALL_PORTS_FEATURES ((unsigned long *)&phy_gbit_all_ports_features)
@@ -66,6 +68,7 @@ extern const int phy_fibre_port_array[1];
 extern const int phy_all_ports_features_array[7];
 extern const int phy_10_100_features_array[4];
 extern const int phy_basic_t1_features_array[3];
+extern const int phy_basic_t1s_p2mp_features_array[2];
 extern const int phy_gbit_features_array[2];
 extern const int phy_10gbit_features_array[1];
 
@@ -1036,6 +1039,17 @@ struct phy_driver {
 	int (*get_sqi)(struct phy_device *dev);
 	/** @get_sqi_max: Get the maximum signal quality indication */
 	int (*get_sqi_max)(struct phy_device *dev);
+
+	/* PLCA RS interface */
+	/** @get_plca_cfg: Return the current PLCA configuration */
+	int (*get_plca_cfg)(struct phy_device *dev,
+			    struct phy_plca_cfg *plca_cfg);
+	/** @set_plca_cfg: Set the PLCA configuration */
+	int (*set_plca_cfg)(struct phy_device *dev,
+			    const struct phy_plca_cfg *plca_cfg);
+	/** @get_plca_status: Return the current PLCA status info */
+	int (*get_plca_status)(struct phy_device *dev,
+			       struct phy_plca_status *plca_st);
 };
 #define to_phy_driver(d) container_of(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index 58e587ba0450..5f414deacf23 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -1741,6 +1741,9 @@ enum ethtool_link_mode_bit_indices {
 	ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT	 = 96,
 	ETHTOOL_LINK_MODE_800000baseSR8_Full_BIT	 = 97,
 	ETHTOOL_LINK_MODE_800000baseVR8_Full_BIT	 = 98,
+	ETHTOOL_LINK_MODE_10baseT1S_Full_BIT		 = 99,
+	ETHTOOL_LINK_MODE_10baseT1S_Half_BIT		 = 100,
+	ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT	 = 101,
 
 	/* must be last entry */
 	__ETHTOOL_LINK_MODE_MASK_NBITS
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 6f399afc2ff2..5fb19050991e 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -208,6 +208,9 @@ const char link_mode_names[][ETH_GSTRING_LEN] = {
 	__DEFINE_LINK_MODE_NAME(800000, DR8_2, Full),
 	__DEFINE_LINK_MODE_NAME(800000, SR8, Full),
 	__DEFINE_LINK_MODE_NAME(800000, VR8, Full),
+	__DEFINE_LINK_MODE_NAME(10, T1S, Full),
+	__DEFINE_LINK_MODE_NAME(10, T1S, Half),
+	__DEFINE_LINK_MODE_NAME(10, T1S_P2MP, Half),
 };
 static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 
@@ -244,6 +247,8 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_X		1
 #define __LINK_MODE_LANES_FX		1
 #define __LINK_MODE_LANES_T1L		1
+#define __LINK_MODE_LANES_T1S		1
+#define __LINK_MODE_LANES_T1S_P2MP	1
 #define __LINK_MODE_LANES_VR8		8
 #define __LINK_MODE_LANES_DR8_2		8
 
@@ -366,6 +371,9 @@ const struct link_mode_info link_mode_params[] = {
 	__DEFINE_LINK_MODE_PARAMS(800000, DR8_2, Full),
 	__DEFINE_LINK_MODE_PARAMS(800000, SR8, Full),
 	__DEFINE_LINK_MODE_PARAMS(800000, VR8, Full),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S, Full),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S, Half),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S_P2MP, Half),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 
-- 
2.37.4

