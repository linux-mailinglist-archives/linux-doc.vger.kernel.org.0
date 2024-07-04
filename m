Return-Path: <linux-doc+bounces-20053-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16D92715C
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 10:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399941F2248F
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 08:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE001AB52B;
	Thu,  4 Jul 2024 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="alKBb3wC"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9E1A4F26;
	Thu,  4 Jul 2024 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720080749; cv=none; b=r2bq4nXnne03MAo03haQtgo5XsCBCs0JXshcByzNZfAq+8KavJlxLdWp4kQLviVyKSOsNIumzErWBXzJWUCmQXew+HCGqWIHkI1aimR6tZ9lUuuBHk21zyq3+LWV7QEXyA4uiRoKn80DaJZ2hqXxQmVxPJSN4nEyL2CnxNcduWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720080749; c=relaxed/simple;
	bh=3rh8s44gwpVSA2P0H6vqzXgLSYEwL15fgb6w2HXkJC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7FmkvIZ4xUL87Z4iYf8kL62xvBCpdNbv/e4RT2gKqImK0xSvs5Xv1F1KJT6SN+enUur5phl9VzSGqDw74Aeei/YTGrhprcXfYiDbPy5+P25dYR3sSsWwIKx88hrF+BOD+6GSUDLDSSOoQOBGLdWloKOwUYKNcIGsKY01ynYFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=alKBb3wC; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECA51BF210;
	Thu,  4 Jul 2024 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720080739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vqbKfcToo2LElfNBxWY9lcXSji4ZLPkqThWOK062gg=;
	b=alKBb3wCwqblPKG08tmJOISFa2cq+Mj2Y3Gie4zrc/jVnt/bD8zu9zSr+/lGDl99ywe8bP
	wBKjsFSvWiBUFeKiGD2mS9EEQXPlL7NpWqzM/LM3dHrbyATuFScb2RGWSk9z+gKUmRb/5r
	YEn3T6VpTcwNX5sVZdP8hSzPU8MBO96tmRnPEVAZ6+V4ODrlcpu4GxiV/rvv3JW2xMD+2c
	ztXtvJLqO5scRwPTOr6vq7zfVBDqBI6FN3Zg/oVJTGFgMF58XlhquK5uoiIFtGpjSR0N4E
	cxU1toEhJPhrrfZB4Db/iSrbI1XqDrxQiMdH8PdDDtQaJ5LJF42+3sv7eOU7eQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 04 Jul 2024 10:12:02 +0200
Subject: [PATCH net-next v6 7/7] net: pse-pd: pd692x0: Enhance with new
 current limit and voltage read callbacks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-feature_poe_power_cap-v6-7-320003204264@bootlin.com>
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

This patch expands PSE callbacks with newly introduced
pi_get/set_current_limit() and pi_get_voltage() callback.
It also add the power limit ranges description in the status returned.
The only way to set ps692x0 port power limit is by configure the power
class plus a small power supplement which maximum depends on each class.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Use uA and uV instead of mA and mV to have more precision in the power
  calculation. Need to use 64bit variables for the calculation.
- Modify the behavior in case of setting the current out of the available
  ranges. Report an error now.

Change in v4:
- Add support for c33 pse power limit ranges.
---
 drivers/net/pse-pd/pd692x0.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 216 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index cce1b7ce044b..29cc76a66c13 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -74,6 +74,8 @@ enum {
 	PD692X0_MSG_GET_PORT_STATUS,
 	PD692X0_MSG_DOWNLOAD_CMD,
 	PD692X0_MSG_GET_PORT_CLASS,
+	PD692X0_MSG_GET_PORT_MEAS,
+	PD692X0_MSG_GET_PORT_PARAM,
 
 	/* add new message above here */
 	PD692X0_MSG_CNT
@@ -135,7 +137,7 @@ static const struct pd692x0_msg pd692x0_msg_template_list[PD692X0_MSG_CNT] = {
 	[PD692X0_MSG_SET_PORT_PARAM] = {
 		.key = PD692X0_KEY_CMD,
 		.sub = {0x05, 0xc0},
-		.data = {   0, 0xff, 0xff, 0xff,
+		.data = { 0xf, 0xff, 0xff, 0xff,
 			 0x4e, 0x4e, 0x4e, 0x4e},
 	},
 	[PD692X0_MSG_GET_PORT_STATUS] = {
@@ -156,6 +158,18 @@ static const struct pd692x0_msg pd692x0_msg_template_list[PD692X0_MSG_CNT] = {
 		.data = {0x4e, 0x4e, 0x4e, 0x4e,
 			 0x4e, 0x4e, 0x4e, 0x4e},
 	},
+	[PD692X0_MSG_GET_PORT_MEAS] = {
+		.key = PD692X0_KEY_REQ,
+		.sub = {0x05, 0xc5},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_GET_PORT_PARAM] = {
+		.key = PD692X0_KEY_REQ,
+		.sub = {0x05, 0xc0},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
 };
 
 static u8 pd692x0_build_msg(struct pd692x0_msg *msg, u8 echo)
@@ -520,6 +534,106 @@ pd692x0_get_ext_state(struct ethtool_c33_pse_ext_state_info *c33_ext_state_info,
 	}
 }
 
+struct pd692x0_class_pw {
+	int class;
+	int class_cfg_value;
+	int class_pw;
+	int max_added_class_pw;
+};
+
+#define PD692X0_CLASS_PW_TABLE_SIZE 4
+/* 4/2 pairs class configuration power table in compliance mode.
+ * Need to be arranged in ascending order of power support.
+ */
+static const struct pd692x0_class_pw
+pd692x0_class_pw_table[PD692X0_CLASS_PW_TABLE_SIZE] = {
+	{.class = 3, .class_cfg_value = 0x3, .class_pw = 15000, .max_added_class_pw = 3100},
+	{.class = 4, .class_cfg_value = 0x2, .class_pw = 30000, .max_added_class_pw = 8000},
+	{.class = 6, .class_cfg_value = 0x1, .class_pw = 60000, .max_added_class_pw = 5000},
+	{.class = 8, .class_cfg_value = 0x0, .class_pw = 90000, .max_added_class_pw = 7500},
+};
+
+static int pd692x0_pi_get_pw_from_table(int op_mode, int added_pw)
+{
+	const struct pd692x0_class_pw *pw_table;
+	int i;
+
+	pw_table = pd692x0_class_pw_table;
+	for (i = 0; i < PD692X0_CLASS_PW_TABLE_SIZE; i++, pw_table++) {
+		if (pw_table->class_cfg_value == op_mode)
+			return pw_table->class_pw + added_pw * 100;
+	}
+
+	return -ERANGE;
+}
+
+static int pd692x0_pi_set_pw_from_table(struct device *dev,
+					struct pd692x0_msg *msg, int pw)
+{
+	const struct pd692x0_class_pw *pw_table;
+	int i;
+
+	pw_table = pd692x0_class_pw_table;
+	if (pw < pw_table->class_pw) {
+		dev_err(dev,
+			"Power limit %dmW not supported. Ranges minimal available: [%d-%d]\n",
+			pw,
+			pw_table->class_pw,
+			pw_table->class_pw + pw_table->max_added_class_pw);
+		return -ERANGE;
+	}
+
+	for (i = 0; i < PD692X0_CLASS_PW_TABLE_SIZE; i++, pw_table++) {
+		if (pw > (pw_table->class_pw + pw_table->max_added_class_pw))
+			continue;
+
+		if (pw < pw_table->class_pw) {
+			dev_err(dev,
+				"Power limit %dmW not supported. Ranges availables: [%d-%d] or [%d-%d]\n",
+				pw,
+				(pw_table - 1)->class_pw,
+				(pw_table - 1)->class_pw + (pw_table - 1)->max_added_class_pw,
+				pw_table->class_pw,
+				pw_table->class_pw + pw_table->max_added_class_pw);
+			return -ERANGE;
+		}
+
+		msg->data[2] = pw_table->class_cfg_value;
+		msg->data[3] = (pw - pw_table->class_pw) / 100;
+		return 0;
+	}
+
+	pw_table--;
+	dev_warn(dev,
+		 "Power limit %dmW not supported. Set to highest power limit %dmW\n",
+		 pw, pw_table->class_pw + pw_table->max_added_class_pw);
+	msg->data[2] = pw_table->class_cfg_value;
+	msg->data[3] = pw_table->max_added_class_pw / 100;
+	return 0;
+}
+
+static int
+pd692x0_pi_get_pw_ranges(struct pse_control_status *st)
+{
+	const struct pd692x0_class_pw *pw_table;
+	int i;
+
+	pw_table = pd692x0_class_pw_table;
+	st->c33_pw_limit_ranges = kcalloc(PD692X0_CLASS_PW_TABLE_SIZE,
+					  sizeof(struct ethtool_c33_pse_pw_limit_range),
+					  GFP_KERNEL);
+	if (!st->c33_pw_limit_ranges)
+		return -ENOMEM;
+
+	for (i = 0; i < PD692X0_CLASS_PW_TABLE_SIZE; i++, pw_table++) {
+		st->c33_pw_limit_ranges[i].min = pw_table->class_pw;
+		st->c33_pw_limit_ranges[i].max = pw_table->class_pw + pw_table->max_added_class_pw;
+	}
+
+	st->c33_pw_limit_nb_ranges = i;
+	return 0;
+}
+
 static int pd692x0_ethtool_get_status(struct pse_controller_dev *pcdev,
 				      unsigned long id,
 				      struct netlink_ext_ack *extack,
@@ -558,9 +672,20 @@ static int pd692x0_ethtool_get_status(struct pse_controller_dev *pcdev,
 	priv->admin_state[id] = status->c33_admin_state;
 
 	pd692x0_get_ext_state(&status->c33_ext_state_info, buf.sub[0]);
-
 	status->c33_actual_pw = (buf.data[0] << 4 | buf.data[1]) * 100;
 
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_PARAM];
+	msg.sub[2] = id;
+	memset(&buf, 0, sizeof(buf));
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	ret = pd692x0_pi_get_pw_from_table(buf.data[0], buf.data[1]);
+	if (ret < 0)
+		return ret;
+	status->c33_avail_pw_limit = ret;
+
 	memset(&buf, 0, sizeof(buf));
 	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_CLASS];
 	msg.sub[2] = id;
@@ -572,6 +697,10 @@ static int pd692x0_ethtool_get_status(struct pse_controller_dev *pcdev,
 	if (class <= 8)
 		status->c33_pw_class = class;
 
+	ret = pd692x0_pi_get_pw_ranges(status);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -850,12 +979,97 @@ static int pd692x0_setup_pi_matrix(struct pse_controller_dev *pcdev)
 	return ret;
 }
 
+static int pd692x0_pi_get_voltage(struct pse_controller_dev *pcdev, int id)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_MEAS];
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	/* Convert 0.1V unit to uV */
+	return (buf.sub[0] << 8 | buf.sub[1]) * 100000;
+}
+
+static int pd692x0_pi_get_current_limit(struct pse_controller_dev *pcdev,
+					int id)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int mW, uV, uA, ret;
+	s64 tmp_64;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_PARAM];
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	ret = pd692x0_pi_get_pw_from_table(buf.data[2], buf.data[3]);
+	if (ret < 0)
+		return ret;
+	mW = ret;
+
+	ret = pd692x0_pi_get_voltage(pcdev, id);
+	if (ret < 0)
+		return ret;
+	uV = ret;
+
+	tmp_64 = mW;
+	tmp_64 *= 1000000000ull;
+	/* uA = mW * 1000000000 / uV */
+	uA = DIV_ROUND_CLOSEST_ULL(tmp_64, uV);
+	return uA;
+}
+
+static int pd692x0_pi_set_current_limit(struct pse_controller_dev *pcdev,
+					int id, int max_uA)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct device *dev = &priv->client->dev;
+	struct pd692x0_msg msg, buf = {0};
+	int uV, ret, mW;
+	s64 tmp_64;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	ret = pd692x0_pi_get_voltage(pcdev, id);
+	if (ret < 0)
+		return ret;
+	uV = ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_SET_PORT_PARAM];
+	msg.sub[2] = id;
+	tmp_64 = uV;
+	tmp_64 *= max_uA;
+	/* mW = uV * uA / 1000000000 */
+	mW = DIV_ROUND_CLOSEST_ULL(tmp_64, 1000000000);
+	ret = pd692x0_pi_set_pw_from_table(dev, &msg, mW);
+	if (ret)
+		return ret;
+
+	return pd692x0_sendrecv_msg(priv, &msg, &buf);
+}
+
 static const struct pse_controller_ops pd692x0_ops = {
 	.setup_pi_matrix = pd692x0_setup_pi_matrix,
 	.ethtool_get_status = pd692x0_ethtool_get_status,
 	.pi_enable = pd692x0_pi_enable,
 	.pi_disable = pd692x0_pi_disable,
 	.pi_is_enabled = pd692x0_pi_is_enabled,
+	.pi_get_voltage = pd692x0_pi_get_voltage,
+	.pi_get_current_limit = pd692x0_pi_get_current_limit,
+	.pi_set_current_limit = pd692x0_pi_set_current_limit,
 };
 
 #define PD692X0_FW_LINE_MAX_SZ 0xff

-- 
2.34.1


