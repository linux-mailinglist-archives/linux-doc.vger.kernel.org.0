Return-Path: <linux-doc+bounces-33925-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F85FA00F4D
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jan 2025 22:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82CF6164BE7
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jan 2025 21:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AD31C3BF1;
	Fri,  3 Jan 2025 21:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h+z1nNDX"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4619E999;
	Fri,  3 Jan 2025 21:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938828; cv=none; b=kIPAUsDgXnC4l9bbJ9aDqHeW4U+ogoARsXGT1thjUYnwN8VTysdIsOawykJQlNjQ7TUU4tvhswfweyjxH6t7HOSzm5341df5zgCHPs3pboIeRv3lOrxMnw4IUmfvpYglvGt/HL66kOoMRgAt0byz9BNhMutcAzq1qkYicqwg8zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938828; c=relaxed/simple;
	bh=C9bnUzx8DVnLWb/PLlwh6kYph+F9kMv+XbsQxyIaABQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4LADUugbkCV+6zp4gU+xW03tPpKZKMY3MmAV23R+LhLjJiS92vqOxaHzJDEjvRD/lAFZBVJx2+xKD2P3j6uDxlV0qTMU4JbshGrCyx3xCoODj9vZ+9CT5TZ7ENQE7i9fK88oM64dhmVjQ8ayMJ0Z9EHvz7YALJwPBDN8JHN93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h+z1nNDX; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 638CDFF807;
	Fri,  3 Jan 2025 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735938824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALFvndifng1w+ByKqfnNsYkDgG+SVM4H8TPfd5/iYbo=;
	b=h+z1nNDXnXNViROWqV5QzG+QhLn1NuXjmaAPzumx3q5Bf6/8TElth00OTsOoToe4VQ6V7Y
	kl2xx5gWHqByDH2g4Ui7g8m8FNqfHYTSj6LSMq+NMy1g3wT7YDYamCakYLR6Gu3MuKY5u+
	dGczZ0MJ+cKmn8D9svGw93L8VS6+mgjcT3xRhpsezWwGveQO30ZJAVDliAunU1sT3mmzvr
	3jNITGXZ0zpfotvoFStnC4v9/ovIvT3u8b/FLrH2pV0r+VFCRR/3W7psQkNLyWIpN7Rtgh
	RYKuCbSyGJJHW+Br5bSS6cSA9A8yQe6sNM392JwZoujY3SDlpxj0ee5Nf/BSUQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 03 Jan 2025 22:12:54 +0100
Subject: [PATCH net-next v4 05/27] net: pse-pd: tps23881: Use helpers to
 calculate bit offset for a channel
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-feature_poe_port_prio-v4-5-dc91a3c0c187@bootlin.com>
References: <20250103-feature_poe_port_prio-v4-0-dc91a3c0c187@bootlin.com>
In-Reply-To: <20250103-feature_poe_port_prio-v4-0-dc91a3c0c187@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Donald Hunter <donald.hunter@gmail.com>, 
 Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>, 
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 devicetree@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-Sasl: kory.maincent@bootlin.com

From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

This driver frequently follows a pattern where two registers are read or
written in a single operation, followed by calculating the bit offset for
a specific channel.

Introduce helpers to streamline this process and reduce code redundancy,
making the codebase cleaner and more maintainable.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Thanks to Oleksij for the design of the helpers functions.

Change in v3:
- Small fix: use chan >= 4 instead of chan > 4;

Change in v2:
- New patch
---
 drivers/net/pse-pd/tps23881.c | 107 +++++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 38 deletions(-)

diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
index a3507520ff87..4a75206b2de6 100644
--- a/drivers/net/pse-pd/tps23881.c
+++ b/drivers/net/pse-pd/tps23881.c
@@ -53,6 +53,55 @@ static struct tps23881_priv *to_tps23881_priv(struct pse_controller_dev *pcdev)
 	return container_of(pcdev, struct tps23881_priv, pcdev);
 }
 
+/*
+ * Helper to extract a value from a u16 register value, which is made of two
+ * u8 registers. The function calculates the bit offset based on the channel
+ * and extracts the relevant bits using a provided field mask.
+ *
+ * @param reg_val: The u16 register value (composed of two u8 registers).
+ * @param chan: The channel number (0-7).
+ * @param field_offset: The base bit offset to apply (e.g., 0 or 4).
+ * @param field_mask: The mask to apply to extract the required bits.
+ * @return: The extracted value for the specific channel.
+ */
+static u16 tps23881_calc_val(u16 reg_val, u8 chan, u8 field_offset,
+			     u16 field_mask)
+{
+	if (chan >= 4)
+		reg_val >>= 8;
+
+	return (reg_val >> field_offset) & field_mask;
+}
+
+/*
+ * Helper to combine individual channel values into a u16 register value.
+ * The function sets the value for a specific channel in the appropriate
+ * position.
+ *
+ * @param reg_val: The current u16 register value.
+ * @param chan: The channel number (0-7).
+ * @param field_offset: The base bit offset to apply (e.g., 0 or 4).
+ * @param field_mask: The mask to apply for the field (e.g., 0x0F).
+ * @param field_val: The value to set for the specific channel (masked by
+ *                   field_mask).
+ * @return: The updated u16 register value with the channel value set.
+ */
+static u16 tps23881_set_val(u16 reg_val, u8 chan, u8 field_offset,
+			    u16 field_mask, u16 field_val)
+{
+	field_val &= field_mask;
+
+	if (chan < 4) {
+		reg_val &= ~(field_mask << field_offset);
+		reg_val |= (field_val << field_offset);
+	} else {
+		reg_val &= ~(field_mask << (field_offset + 8));
+		reg_val |= (field_val << (field_offset + 8));
+	}
+
+	return reg_val;
+}
+
 static int tps23881_pi_enable(struct pse_controller_dev *pcdev, int id)
 {
 	struct tps23881_priv *priv = to_tps23881_priv(pcdev);
@@ -64,17 +113,12 @@ static int tps23881_pi_enable(struct pse_controller_dev *pcdev, int id)
 		return -ERANGE;
 
 	chan = priv->port[id].chan[0];
-	if (chan < 4)
-		val = BIT(chan);
-	else
-		val = BIT(chan + 4);
+	val = tps23881_set_val(0, chan, 0, BIT(chan % 4), BIT(chan % 4));
 
 	if (priv->port[id].is_4p) {
 		chan = priv->port[id].chan[1];
-		if (chan < 4)
-			val |= BIT(chan);
-		else
-			val |= BIT(chan + 4);
+		val = tps23881_set_val(val, chan, 0, BIT(chan % 4),
+				       BIT(chan % 4));
 	}
 
 	return i2c_smbus_write_word_data(client, TPS23881_REG_PW_EN, val);
@@ -91,17 +135,12 @@ static int tps23881_pi_disable(struct pse_controller_dev *pcdev, int id)
 		return -ERANGE;
 
 	chan = priv->port[id].chan[0];
-	if (chan < 4)
-		val = BIT(chan + 4);
-	else
-		val = BIT(chan + 8);
+	val = tps23881_set_val(0, chan, 4, BIT(chan % 4), BIT(chan % 4));
 
 	if (priv->port[id].is_4p) {
 		chan = priv->port[id].chan[1];
-		if (chan < 4)
-			val |= BIT(chan + 4);
-		else
-			val |= BIT(chan + 8);
+		val = tps23881_set_val(val, chan, 4, BIT(chan % 4),
+				       BIT(chan % 4));
 	}
 
 	return i2c_smbus_write_word_data(client, TPS23881_REG_PW_EN, val);
@@ -113,6 +152,7 @@ static int tps23881_pi_is_enabled(struct pse_controller_dev *pcdev, int id)
 	struct i2c_client *client = priv->client;
 	bool enabled;
 	u8 chan;
+	u16 val;
 	int ret;
 
 	ret = i2c_smbus_read_word_data(client, TPS23881_REG_PW_STATUS);
@@ -120,17 +160,13 @@ static int tps23881_pi_is_enabled(struct pse_controller_dev *pcdev, int id)
 		return ret;
 
 	chan = priv->port[id].chan[0];
-	if (chan < 4)
-		enabled = ret & BIT(chan);
-	else
-		enabled = ret & BIT(chan + 4);
+	val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
+	enabled = !!(val);
 
 	if (priv->port[id].is_4p) {
 		chan = priv->port[id].chan[1];
-		if (chan < 4)
-			enabled &= !!(ret & BIT(chan));
-		else
-			enabled &= !!(ret & BIT(chan + 4));
+		val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
+		enabled &= !!(val);
 	}
 
 	/* Return enabled status only if both channel are on this state */
@@ -146,6 +182,7 @@ static int tps23881_ethtool_get_status(struct pse_controller_dev *pcdev,
 	struct i2c_client *client = priv->client;
 	bool enabled, delivering;
 	u8 chan;
+	u16 val;
 	int ret;
 
 	ret = i2c_smbus_read_word_data(client, TPS23881_REG_PW_STATUS);
@@ -153,23 +190,17 @@ static int tps23881_ethtool_get_status(struct pse_controller_dev *pcdev,
 		return ret;
 
 	chan = priv->port[id].chan[0];
-	if (chan < 4) {
-		enabled = ret & BIT(chan);
-		delivering = ret & BIT(chan + 4);
-	} else {
-		enabled = ret & BIT(chan + 4);
-		delivering = ret & BIT(chan + 8);
-	}
+	val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
+	enabled = !!(val);
+	val = tps23881_calc_val(ret, chan, 4, BIT(chan % 4));
+	delivering = !!(val);
 
 	if (priv->port[id].is_4p) {
 		chan = priv->port[id].chan[1];
-		if (chan < 4) {
-			enabled &= !!(ret & BIT(chan));
-			delivering &= !!(ret & BIT(chan + 4));
-		} else {
-			enabled &= !!(ret & BIT(chan + 4));
-			delivering &= !!(ret & BIT(chan + 8));
-		}
+		val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
+		enabled &= !!(val);
+		val = tps23881_calc_val(ret, chan, 4, BIT(chan % 4));
+		delivering &= !!(val);
 	}
 
 	/* Return delivering status only if both channel are on this state */

-- 
2.34.1


