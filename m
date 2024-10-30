Return-Path: <linux-doc+bounces-29275-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592E9B69F0
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 18:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA41D280D85
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B2F2296D7;
	Wed, 30 Oct 2024 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fiQA+V7W"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72652281D5;
	Wed, 30 Oct 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307254; cv=none; b=I7QfRUg+MiV4Ywh++6xADsjT/OruaNnTBAKwiRZ6uz6bZQRsdB9D8TimX2X+ifhooE9sXbbIr1hfCKw3bZcq6CJn3qtCIcyT2XRbRVpiiva+DBqMkTG1YYdOwNsUKEn5ljIlcdTfC6jHmAbshESeZb7w1x5Ovx5OzeXvLBJ3I3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307254; c=relaxed/simple;
	bh=bIbennVFQOoAbhfAkEzVVrAC6qa7AQEZgPtmaeHMieI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+9BU1+kSRRirF2K7VmgCWxWWxWKmXcjgLa4O6adq+HvmZQHYHFvQ/tOIYkG9QuoTwrE2rq28sv7u0ZAqvOZEZKW1x4sUFO5L7NTg7PaNHR9YsXZwHA6C8OPGpOkKAAIr4tvfo05nE1SIVYNQBsghJajA5GM+G/xPJcbX4lksSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fiQA+V7W; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E631C0015;
	Wed, 30 Oct 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730307249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PGDvkEewZhLHhVNOjTjRFkS3ITb9jjwAXpCdiJWZ98=;
	b=fiQA+V7W1Jn1SgX6g6/RLNpZMdrYookqhrdxKG0QKxm/tdl8/MOqdta0vjvtXIr3uk/FjN
	fyoMtoP9pIj3RMuRS5BjI2iuBbnxt4dgF74odYxkkC/Nf0ISFcizTvQ2+M9RVr5EMNuw+w
	DcCTNCEsN0molYDNwdpXOoMJtpsLTMlNYZXBYVHylYsx5esUnT/cVR2RgBuly2pr8Usf0Y
	NGaHD5dhFgLbpfNVpTGnGt0HEkdVGtE34t6gio2aCWY7FySz24eWS1ZWgAdrr5daYXIXoB
	EEoqWbkgH8iO/vFIvIMT96rm9leFwmG8Jtt90rMcCB/RbigEnC8PdjPP52eDtQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 30 Oct 2024 17:53:15 +0100
Subject: [PATCH RFC net-next v2 13/18] net: pse-pd: Add support for PSE
 power domains
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-feature_poe_port_prio-v2-13-9559622ee47a@bootlin.com>
References: <20241030-feature_poe_port_prio-v2-0-9559622ee47a@bootlin.com>
In-Reply-To: <20241030-feature_poe_port_prio-v2-0-9559622ee47a@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Donald Hunter <donald.hunter@gmail.com>, 
 Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>, 
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-Sasl: kory.maincent@bootlin.com

From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

Introduce PSE power domain support in preparation for future port
priority features. Multiple PSE PIs are grouped under a PSE power
domain, which defines the available power budget. This setup allows
the system to check whether activating a port would exceed the
budget, helping prevent over-budget states.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- new patch.
---
 drivers/net/pse-pd/pse_core.c | 121 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pse-pd/pse.h    |   2 +
 2 files changed, 123 insertions(+)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 712cb2d9c7c4..13f6ddcfca10 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -15,6 +15,7 @@
 static DEFINE_MUTEX(pse_list_mutex);
 static LIST_HEAD(pse_controller_list);
 static DEFINE_IDA(pse_ida);
+static DEFINE_XARRAY_ALLOC(pse_pw_d_map);
 
 /**
  * struct pse_control - a PSE control
@@ -35,6 +36,12 @@ struct pse_control {
 	struct phy_device *attached_phydev;
 };
 
+struct pse_power_domain {
+	int id;
+	struct regulator *supply;
+	int pw_budget;
+};
+
 static int of_load_single_pse_pi_pairset(struct device_node *node,
 					 struct pse_pi *pi,
 					 int pairset_num)
@@ -431,6 +438,115 @@ devm_pse_pi_regulator_register(struct pse_controller_dev *pcdev,
 	return 0;
 }
 
+static void pse_flush_pw_ds(struct pse_controller_dev *pcdev)
+{
+	struct pse_power_domain *pw_d;
+	int i;
+
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		pw_d = xa_load(&pse_pw_d_map, pcdev->pi[i].pw_d->id);
+		if (pw_d) {
+			regulator_put(pw_d->supply);
+			xa_erase(&pse_pw_d_map, pw_d->id);
+		}
+	}
+}
+
+static struct pse_power_domain *devm_pse_alloc_pw_d(struct device *dev)
+{
+	struct pse_power_domain *pw_d;
+	int index, ret;
+
+	pw_d = devm_kzalloc(dev, sizeof(*pw_d), GFP_KERNEL);
+	if (!pw_d)
+		return ERR_PTR(-ENOMEM);
+
+	ret = xa_alloc(&pse_pw_d_map, &index, pw_d, xa_limit_31b, GFP_KERNEL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pw_d->id = index;
+	return pw_d;
+}
+
+static int pse_get_power_budget(struct regulator *supply)
+{
+	int ret, uV;
+	s64 tmp_64;
+
+	ret = regulator_get_voltage(supply);
+	if (ret < 0)
+		return ret;
+
+	uV = ret;
+	ret = regulator_get_power_budget(supply);
+	if (ret < 0)
+		return ret;
+
+	tmp_64 = ret;
+	tmp_64 *= uV;
+	/* mW = uV * uA / 1000000000 */
+	return DIV_ROUND_CLOSEST_ULL(tmp_64, 1000000000);
+}
+
+static int pse_register_pw_ds(struct pse_controller_dev *pcdev)
+{
+	int i, ret;
+
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		struct regulator_dev *rdev = pcdev->pi[i].rdev;
+		struct pse_power_domain *pw_d;
+		struct regulator *supply;
+		bool present = false;
+		unsigned long index;
+		int pw_budget;
+
+		/* No regulator or regulator parent supply registered.
+		 * We need a regulator parent to register a PSE power domain
+		 */
+		if (!rdev || !rdev->supply)
+			continue;
+
+		xa_for_each(&pse_pw_d_map, index, pw_d) {
+			/* Power supply already registered as a PSE power
+			 * domain.
+			 */
+			if (pw_d->supply == rdev->supply) {
+				present = true;
+				pcdev->pi[i].pw_d = pw_d;
+				break;
+			}
+		}
+		if (present)
+			break;
+
+		ret = pse_get_power_budget(rdev->supply);
+		if (ret < 0) {
+			dev_warn(pcdev->dev,
+				 "can't read power budget from PI %d, no power domain will be associated\n",
+				 i);
+			continue;
+		}
+		pw_budget = ret;
+
+		pw_d = devm_pse_alloc_pw_d(pcdev->dev);
+		if (IS_ERR_OR_NULL(pw_d))
+			return PTR_ERR(pw_d);
+
+		pw_d->pw_budget = pw_budget;
+		supply = regulator_get(pcdev->dev, rdev->supply_name);
+		if (IS_ERR(supply)) {
+			xa_erase(&pse_pw_d_map, pw_d->id);
+			return PTR_ERR(supply);
+		}
+
+		pw_d->supply = rdev->supply;
+		pcdev->pi[i].pw_d = pw_d;
+	}
+
+	return 0;
+}
+
 /**
  * pse_controller_register - register a PSE controller device
  * @pcdev: a pointer to the initialized PSE controller device
@@ -489,6 +605,10 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 			goto free_pse_ida;
 	}
 
+	ret = pse_register_pw_ds(pcdev);
+	if (ret)
+		goto free_pse_ida;
+
 	mutex_lock(&pse_list_mutex);
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
@@ -508,6 +628,7 @@ EXPORT_SYMBOL_GPL(pse_controller_register);
 void pse_controller_unregister(struct pse_controller_dev *pcdev)
 {
 	pse_release_pis(pcdev);
+	pse_flush_pw_ds(pcdev);
 	ida_free(&pse_ida, pcdev->id);
 	mutex_lock(&pse_list_mutex);
 	list_del(&pcdev->list);
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index ce8737c2219a..3b35dc0f8dc3 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -138,12 +138,14 @@ struct pse_pi_pairset {
  * @np: device node pointer of the PSE PI node
  * @rdev: regulator represented by the PSE PI
  * @admin_state_enabled: PI enabled state
+ * @pw_d: Power domain of the PSE PI
  */
 struct pse_pi {
 	struct pse_pi_pairset pairset[2];
 	struct device_node *np;
 	struct regulator_dev *rdev;
 	bool admin_state_enabled;
+	struct pse_power_domain *pw_d;
 };
 
 /**

-- 
2.34.1


