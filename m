Return-Path: <linux-doc+bounces-97-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B87C5F39
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 23:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF5A282438
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 21:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07B221A09;
	Wed, 11 Oct 2023 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Tvwv7/4u"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C651C6AF
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 21:41:29 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC92B8
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 14:41:26 -0700 (PDT)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C19703FA78
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 21:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697060479;
	bh=8c9V3didGgZr1dEvLAHGSBgXLRfbYqmGbrTtJne4KKc=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=Tvwv7/4uLadaLyYbeGER6fI5yudsGCo41O+e8OVrr8rhfDW7QOHGi4fnOpky3WpjZ
	 LqCmLKiF+Sf7mkLp05QJwFO1+mpgPWFE8LnWvCl1qit7ddfQeK7dOLRTfU5EnGq+HE
	 boFX/k5AQemheSnknqGr+FIQQkob/w64mITvWAQ3ap9J0h2QsXE1rNIsPfrYanHqoi
	 jlWSJclVXe1OGVUYPqmCv/HgRXMMZXIF2smS5dThWZej2J/YeQGvyAR4Ke2uTLUJcE
	 x80LAzt9OYdj0NOI24/UY9l5smDC8Ci4ccfsMEsE6rsnCt4/XIbKr4PZFMDblzrUA4
	 QJH0kbK9W0YBA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6c6370774e8so444950a34.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 14:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060477; x=1697665277;
        h=message-id:date:content-transfer-encoding:mime-version:comments
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8c9V3didGgZr1dEvLAHGSBgXLRfbYqmGbrTtJne4KKc=;
        b=C7c+K0wgKAEsDMvGakReLKLdZIjtSb7P1JPZGwClD6sMCdiw2Q5c+UYfqKT9Vx7NaX
         lH3KQAbqcgHNPThiHP+RyyIBWcajoOcOOS8AtdaAB4ClaD1t0BIX6euyI/4SVxJbvc3c
         8Qspp/vX0WPz7XuNIFQYolBnHPodpqGTpyqKylu0uuqkI2nmCa9H2fBe4XNbzVnjhPWs
         K5P0GuzoY8AS+SrqUikcm35t3u4KrcAI9dge1BO+k/bfXK1geipwOkC6Xpo0v4odUZcu
         v/HqdGkWmEgdVW4UdUI1bBRD9yYgVziFIvAewX+IB7qzHnYeTVZIDoeSFf3yAMjCGBwJ
         nSfQ==
X-Gm-Message-State: AOJu0YzEqrmCkDGYAub1/3mCi2UG0bsHMGVe0gspGoQeNX+z9IpZY6bd
	aFBrBjhfppIdLTwvGBd76nOsxJCtZ/dOR0zBe+M4PShwZL+4jg4rFjAzEQFilazKbVGG99pCLH9
	R+R/35Yx8Ou7uFdNNfp1RLkDHek8BjcEBHfOmpw==
X-Received: by 2002:a9d:7752:0:b0:6c4:ac5b:1f83 with SMTP id t18-20020a9d7752000000b006c4ac5b1f83mr23842680otl.2.1697060476989;
        Wed, 11 Oct 2023 14:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeUgaCLM4r4E7EIRY77A2tpgZEwaMVadBVsTAjMEJ1hYHnnbk5izDCCrfUOg1RkbR/jJmlQw==
X-Received: by 2002:a9d:7752:0:b0:6c4:ac5b:1f83 with SMTP id t18-20020a9d7752000000b006c4ac5b1f83mr23842670otl.2.1697060476720;
        Wed, 11 Oct 2023 14:41:16 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id x2-20020a62fb02000000b006889348ba6esm10502819pfm.127.2023.10.11.14.41.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 14:41:16 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
	id DDD3F5FECD; Wed, 11 Oct 2023 14:41:15 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id D77999FA77;
	Wed, 11 Oct 2023 14:41:15 -0700 (PDT)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
    "David S . Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
    Andy Gospodarek <andy@greyhouse.net>,
    Nicolas Ferre <nicolas.ferre@microchip.com>,
    Claudiu Beznea <claudiu.beznea@tuxon.dev>,
    Horatiu Vultur <horatiu.vultur@microchip.com>,
    UNGLinuxDriver@microchip.com,
    Florian Fainelli <florian.fainelli@broadcom.com>,
    Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
    Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
    Russell King <linux@armlinux.org.uk>,
    Richard Cochran <richardcochran@gmail.com>,
    Radu Pirea <radu-nicolae.pirea@oss.nxp.com>,
    Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
    Vladimir Oltean <vladimir.oltean@nxp.com>,
    Michael Walle <michael@walle.cc>,
    Jacob Keller <jacob.e.keller@intel.com>,
    Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v5 03/16] net: ethtool: Refactor identical get_ts_info implementations.
In-reply-to: <20231009155138.86458-4-kory.maincent@bootlin.com>
References: <20231009155138.86458-1-kory.maincent@bootlin.com> <20231009155138.86458-4-kory.maincent@bootlin.com>
Comments: In-reply-to =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
   message dated "Mon, 09 Oct 2023 17:51:25 +0200."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Oct 2023 14:41:15 -0700
Message-ID: <6355.1697060475@famine>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:

>From: Richard Cochran <richardcochran@gmail.com>
>
>The vlan, macvlan and the bonding drivers call their "real" device driver
>in order to report the time stamping capabilities.  Provide a core
>ethtool helper function to avoid copy/paste in the stack.
>
>Signed-off-by: Richard Cochran <richardcochran@gmail.com>
>Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

	For the bonding portion:

Reviewed-by: Jay Vosburgh <jay.vosburgh@canonical.com>


>---
>
>Change in v5:
>- Fixe typo
>---
> drivers/net/bonding/bond_main.c | 27 ++-------------------------
> drivers/net/macvlan.c           | 14 +-------------
> include/linux/ethtool.h         |  8 ++++++++
> net/8021q/vlan_dev.c            | 15 +--------------
> net/ethtool/common.c            |  6 ++++++
> 5 files changed, 18 insertions(+), 52 deletions(-)
>
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_ma=
in.c
>index ed7212e61c54..18af563d20b2 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -5763,29 +5763,12 @@ static int bond_ethtool_get_ts_info(struct net_dev=
ice *bond_dev,
> 	rcu_read_unlock();
>=20
> 	if (real_dev) {
>-		ops =3D real_dev->ethtool_ops;
>-		phydev =3D real_dev->phydev;
>-
>-		if (phy_has_tsinfo(phydev)) {
>-			ret =3D phy_ts_info(phydev, info);
>-			goto out;
>-		} else if (ops->get_ts_info) {
>-			ret =3D ops->get_ts_info(real_dev, info);
>-			goto out;
>-		}
>+		ret =3D ethtool_get_ts_info_by_layer(real_dev, info);
> 	} else {
> 		/* Check if all slaves support software tx timestamping */
> 		rcu_read_lock();
> 		bond_for_each_slave_rcu(bond, slave, iter) {
>-			ret =3D -1;
>-			ops =3D slave->dev->ethtool_ops;
>-			phydev =3D slave->dev->phydev;
>-
>-			if (phy_has_tsinfo(phydev))
>-				ret =3D phy_ts_info(phydev, &ts_info);
>-			else if (ops->get_ts_info)
>-				ret =3D ops->get_ts_info(slave->dev, &ts_info);
>-
>+			ret =3D ethtool_get_ts_info_by_layer(slave->dev, &ts_info);
> 			if (!ret && (ts_info.so_timestamping & SOF_TIMESTAMPING_TX_SOFTWARE)) {
> 				sw_tx_support =3D true;
> 				continue;
>@@ -5797,15 +5780,9 @@ static int bond_ethtool_get_ts_info(struct net_devi=
ce *bond_dev,
> 		rcu_read_unlock();
> 	}
>=20
>-	ret =3D 0;
>-	info->so_timestamping =3D SOF_TIMESTAMPING_RX_SOFTWARE |
>-				SOF_TIMESTAMPING_SOFTWARE;
> 	if (sw_tx_support)
> 		info->so_timestamping |=3D SOF_TIMESTAMPING_TX_SOFTWARE;
>=20
>-	info->phc_index =3D -1;
>-
>-out:
> 	dev_put(real_dev);
> 	return ret;
> }
>diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
>index 02bd201bc7e5..759406fbaea8 100644
>--- a/drivers/net/macvlan.c
>+++ b/drivers/net/macvlan.c
>@@ -1086,20 +1086,8 @@ static int macvlan_ethtool_get_ts_info(struct net_d=
evice *dev,
> 				       struct ethtool_ts_info *info)
> {
> 	struct net_device *real_dev =3D macvlan_dev_real_dev(dev);
>-	const struct ethtool_ops *ops =3D real_dev->ethtool_ops;
>-	struct phy_device *phydev =3D real_dev->phydev;
>=20
>-	if (phy_has_tsinfo(phydev)) {
>-		return phy_ts_info(phydev, info);
>-	} else if (ops->get_ts_info) {
>-		return ops->get_ts_info(real_dev, info);
>-	} else {
>-		info->so_timestamping =3D SOF_TIMESTAMPING_RX_SOFTWARE |
>-			SOF_TIMESTAMPING_SOFTWARE;
>-		info->phc_index =3D -1;
>-	}
>-
>-	return 0;
>+	return ethtool_get_ts_info_by_layer(real_dev, info);
> }
>=20
> static netdev_features_t macvlan_fix_features(struct net_device *dev,
>diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
>index 62b61527bcc4..1159daac776e 100644
>--- a/include/linux/ethtool.h
>+++ b/include/linux/ethtool.h
>@@ -1043,6 +1043,14 @@ static inline int ethtool_mm_frag_size_min_to_add(u=
32 val_min, u32 *val_add,
> 	return -EINVAL;
> }
>=20
>+/**
>+ * ethtool_get_ts_info_by_layer - Obtains time stamping capabilities from=
 the MAC or PHY layer.
>+ * @dev: pointer to net_device structure
>+ * @info: buffer to hold the result
>+ * Returns zero on success, non-zero otherwise.
>+ */
>+int ethtool_get_ts_info_by_layer(struct net_device *dev, struct ethtool_t=
s_info *info);
>+
> /**
>  * ethtool_sprintf - Write formatted string to ethtool string data
>  * @data: Pointer to start of string to update
>diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
>index 2a7f1b15714a..407b2335f091 100644
>--- a/net/8021q/vlan_dev.c
>+++ b/net/8021q/vlan_dev.c
>@@ -702,20 +702,7 @@ static int vlan_ethtool_get_ts_info(struct net_device=
 *dev,
> 				    struct ethtool_ts_info *info)
> {
> 	const struct vlan_dev_priv *vlan =3D vlan_dev_priv(dev);
>-	const struct ethtool_ops *ops =3D vlan->real_dev->ethtool_ops;
>-	struct phy_device *phydev =3D vlan->real_dev->phydev;
>-
>-	if (phy_has_tsinfo(phydev)) {
>-		return phy_ts_info(phydev, info);
>-	} else if (ops->get_ts_info) {
>-		return ops->get_ts_info(vlan->real_dev, info);
>-	} else {
>-		info->so_timestamping =3D SOF_TIMESTAMPING_RX_SOFTWARE |
>-			SOF_TIMESTAMPING_SOFTWARE;
>-		info->phc_index =3D -1;
>-	}
>-
>-	return 0;
>+	return ethtool_get_ts_info_by_layer(vlan->real_dev, info);
> }
>=20
> static void vlan_dev_get_stats64(struct net_device *dev,
>diff --git a/net/ethtool/common.c b/net/ethtool/common.c
>index f5598c5f50de..e2315e24d695 100644
>--- a/net/ethtool/common.c
>+++ b/net/ethtool/common.c
>@@ -661,6 +661,12 @@ int ethtool_get_phc_vclocks(struct net_device *dev, i=
nt **vclock_index)
> }
> EXPORT_SYMBOL(ethtool_get_phc_vclocks);
>=20
>+int ethtool_get_ts_info_by_layer(struct net_device *dev, struct ethtool_t=
s_info *info)
>+{
>+	return __ethtool_get_ts_info(dev, info);
>+}
>+EXPORT_SYMBOL(ethtool_get_ts_info_by_layer);
>+
> const struct ethtool_phy_ops *ethtool_phy_ops;
>=20
> void ethtool_set_ethtool_phy_ops(const struct ethtool_phy_ops *ops)
>--=20
>2.25.1
>
>

