Return-Path: <linux-doc+bounces-13722-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666A89DE07
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 17:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73281F2A2C9
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 15:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DC113A878;
	Tue,  9 Apr 2024 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FVC1aHZU"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25912FF65;
	Tue,  9 Apr 2024 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675083; cv=none; b=e76/JukH2VeIs41/xNtQ+Pa9Jv9/Ii8l0ShHUct50No5BJCyDhwOop6ldAVgeyJ4gQBAwQHG2yRMWUueyllH9eMiujC5OIpAzo9T/0V5sVgDXCUah2mNDzp0xoTLzmY5EYpLiuJ200I11CngR0TLlckxHR0O4dV4Tbad+BuywMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675083; c=relaxed/simple;
	bh=OicPe2apnkmzCM/+kK6IVbj3lxMxl0Xb8XTydKxeN4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4WaemK2Iu2b7foKcXvRABPG90+hCyfUvd67vntQLKH/TGIHrlpltpfvCUvegWoydY3mNEdGMRvwn9n6zmr+y14q1KJATMGzCoSY2e59SNP49Q+SnjiYG2Kdf6vIMbBp4eTfUuquN5q1cUk6kT7f23K4yWHi2I48dzdiB6tlPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FVC1aHZU; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72B9EC000C;
	Tue,  9 Apr 2024 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712675077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tlcaVBCjzFkXgUlW5LL6I3JDt7G63hJu0bJA/wNnpQ=;
	b=FVC1aHZUTJmijTITNkjqKzSBGLFFuo8OuO64T5m+j/KYVXB+3Uu5pl2MjQnL0R5f4UZWNa
	prpB4/6G+R0Vgjna8gRNmCKU8LO5e5uDlxgm7HSVWGaUcmB/exuTEyDzvLKtQyly85gjeb
	nL9kJaZ7aDDpq5gyfUEHqG17G44m84vwWCQfzjiYW27tuY1CGuWDGwrhBVmFnyvp5U08aC
	/QAH3/JIS7u4RrHwxpEOzT2pyRxHp/2GjJ9ifyDvhxlNm/nvZQ597NFzMp9s/FcM3W6JrS
	ozmY6iaotB8Lkh7FwDYzDNnkc/zNEwBuUOcGVczaAriF9zdve4/AfKONCSWkYg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 09 Apr 2024 17:04:05 +0200
Subject: [PATCH net-next v7 15/17] net: pse-pd: Add PD692x0 PSE controller
 driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-feature_poe-v7-15-11e38efd4dee@bootlin.com>
References: <20240409-feature_poe-v7-0-11e38efd4dee@bootlin.com>
In-Reply-To: <20240409-feature_poe-v7-0-11e38efd4dee@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dent Project <dentproject@linuxfoundation.org>, 
 kernel@pengutronix.de, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev
X-GND-Sasl: kory.maincent@bootlin.com

From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

Add a new driver for the PD692x0 I2C Power Sourcing Equipment controller.
This driver only support i2c communication for now.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Change in v2:
- Drop of_match_ptr
- Follow the "c33" PoE prefix naming change.
- Remove unused delay_recv variable. Then, remove struct pd692x0_msg_content
  which is similar to struct pd692x0_msg.
- Fix a weird sleep loop.
- Improve pd692x0_recv_msg for better readability.
- Fix a warning reported by Simon on a pd692x0_fw_write_line call.

Change in v3:
- Fix few nit.
- Change the return value of pd692x0_try_recv_msg function.
- Replace a dev_err() function to dev_err_probe().
- Replace pd692x0_update_matrix by the newly introduced setup_pi_matrix callback.
- Follow new bindings of managers subnode description.
- Update the pse ops with the newly introduced pi_enable, pi_is_enabled and
  pi_disable ones.
- Replace firmware version check by a softer one (< instead of =!).
- Rearrange the probe function, which had wrong ordering on error case
  between pcdcev registering and software version read.
- Fixed the probe function in the case it is call two times. The status
  won't be sent automatically on the second times so ask for it.
---
 drivers/net/pse-pd/Kconfig   |   11 +
 drivers/net/pse-pd/Makefile  |    1 +
 drivers/net/pse-pd/pd692x0.c | 1223 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1235 insertions(+)

diff --git a/drivers/net/pse-pd/Kconfig b/drivers/net/pse-pd/Kconfig
index 687dec49c1e1..e3a6ba669f20 100644
--- a/drivers/net/pse-pd/Kconfig
+++ b/drivers/net/pse-pd/Kconfig
@@ -20,4 +20,15 @@ config PSE_REGULATOR
 	  Sourcing Equipment without automatic classification support. For
 	  example for basic implementation of PoDL (802.3bu) specification.
 
+config PSE_PD692X0
+	tristate "PD692X0 PSE controller"
+	depends on I2C
+	select FW_UPLOAD
+	help
+	  This module provides support for PD692x0 regulator based Ethernet
+	  Power Sourcing Equipment.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called pd692x0.
+
 endif
diff --git a/drivers/net/pse-pd/Makefile b/drivers/net/pse-pd/Makefile
index 1b8aa4c70f0b..9c12c4a65730 100644
--- a/drivers/net/pse-pd/Makefile
+++ b/drivers/net/pse-pd/Makefile
@@ -4,3 +4,4 @@
 obj-$(CONFIG_PSE_CONTROLLER) += pse_core.o
 
 obj-$(CONFIG_PSE_REGULATOR) += pse_regulator.o
+obj-$(CONFIG_PSE_PD692X0) += pd692x0.o
diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
new file mode 100644
index 000000000000..6488b941703c
--- /dev/null
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -0,0 +1,1223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the Microchip PD692X0 PoE PSE Controller driver (I2C bus)
+ *
+ * Copyright (c) 2023 Bootlin, Kory Maincent <kory.maincent@bootlin.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pse-pd/pse.h>
+
+#define PD692X0_PSE_NAME "pd692x0_pse"
+
+#define PD692X0_MAX_PIS	48
+#define PD692X0_MAX_MANAGERS		12
+#define PD692X0_MAX_MANAGER_PORTS	8
+#define PD692X0_MAX_HW_PORTS	(PD692X0_MAX_MANAGERS * PD692X0_MAX_MANAGER_PORTS)
+
+#define PD69200_BT_PROD_VER	24
+#define PD69210_BT_PROD_VER	26
+#define PD69220_BT_PROD_VER	29
+
+#define PD692X0_FW_MAJ_VER	3
+#define PD692X0_FW_MIN_VER	5
+#define PD692X0_FW_PATCH_VER	5
+
+enum pd692x0_fw_state {
+	PD692X0_FW_UNKNOWN,
+	PD692X0_FW_OK,
+	PD692X0_FW_BROKEN,
+	PD692X0_FW_NEED_UPDATE,
+	PD692X0_FW_PREPARE,
+	PD692X0_FW_WRITE,
+	PD692X0_FW_COMPLETE,
+};
+
+struct pd692x0_msg {
+	u8 key;
+	u8 echo;
+	u8 sub[3];
+	u8 data[8];
+	__be16 chksum;
+} __packed;
+
+struct pd692x0_msg_ver {
+	u8 prod;
+	u8 maj_sw_ver;
+	u8 min_sw_ver;
+	u8 pa_sw_ver;
+	u8 param;
+	u8 build;
+};
+
+enum {
+	PD692X0_KEY_CMD,
+	PD692X0_KEY_PRG,
+	PD692X0_KEY_REQ,
+	PD692X0_KEY_TLM,
+	PD692X0_KEY_TEST,
+	PD692X0_KEY_REPORT = 0x52
+};
+
+enum {
+	PD692X0_MSG_RESET,
+	PD692X0_MSG_GET_SYS_STATUS,
+	PD692X0_MSG_GET_SW_VER,
+	PD692X0_MSG_SET_TMP_PORT_MATRIX,
+	PD692X0_MSG_PRG_PORT_MATRIX,
+	PD692X0_MSG_SET_PORT_PARAM,
+	PD692X0_MSG_GET_PORT_STATUS,
+	PD692X0_MSG_DOWNLOAD_CMD,
+
+	/* add new message above here */
+	PD692X0_MSG_CNT
+};
+
+struct pd692x0_priv {
+	struct i2c_client *client;
+	struct pse_controller_dev pcdev;
+	struct device_node *np;
+
+	enum pd692x0_fw_state fw_state;
+	struct fw_upload *fwl;
+	bool cancel_request;
+
+	u8 msg_id;
+	bool last_cmd_key;
+	unsigned long last_cmd_key_time;
+
+	enum ethtool_c33_pse_admin_state admin_state[PD692X0_MAX_PIS];
+};
+
+/* Template list of communication messages. The non-null bytes defined here
+ * constitute the fixed portion of the messages. The remaining bytes will
+ * be configured later within the functions. Refer to the "PD692x0 BT Serial
+ * Communication Protocol User Guide" for comprehensive details on messages
+ * content.
+ */
+static const struct pd692x0_msg pd692x0_msg_template_list[PD692X0_MSG_CNT] = {
+	[PD692X0_MSG_RESET] = {
+		.key = PD692X0_KEY_CMD,
+		.sub = {0x07, 0x55, 0x00},
+		.data = {0x55, 0x00, 0x55, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_GET_SYS_STATUS] = {
+		.key = PD692X0_KEY_REQ,
+		.sub = {0x07, 0xd0, 0x4e},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_GET_SW_VER] = {
+		.key = PD692X0_KEY_REQ,
+		.sub = {0x07, 0x1e, 0x21},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_SET_TMP_PORT_MATRIX] = {
+		.key = PD692X0_KEY_CMD,
+		.sub	 = {0x05, 0x43},
+		.data = {   0, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_PRG_PORT_MATRIX] = {
+		.key = PD692X0_KEY_CMD,
+		.sub = {0x07, 0x43, 0x4e},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_SET_PORT_PARAM] = {
+		.key = PD692X0_KEY_CMD,
+		.sub = {0x05, 0xc0},
+		.data = {   0, 0xff, 0xff, 0xff,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_GET_PORT_STATUS] = {
+		.key = PD692X0_KEY_REQ,
+		.sub = {0x05, 0xc1},
+		.data = {0x4e, 0x4e, 0x4e, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+	[PD692X0_MSG_DOWNLOAD_CMD] = {
+		.key = PD692X0_KEY_PRG,
+		.sub = {0xff, 0x99, 0x15},
+		.data = {0x16, 0x16, 0x99, 0x4e,
+			 0x4e, 0x4e, 0x4e, 0x4e},
+	},
+};
+
+static u8 pd692x0_build_msg(struct pd692x0_msg *msg, u8 echo)
+{
+	u8 *data = (u8 *)msg;
+	u16 chksum = 0;
+	int i;
+
+	msg->echo = echo++;
+	if (echo == 0xff)
+		echo = 0;
+
+	for (i = 0; i < sizeof(*msg) - sizeof(msg->chksum); i++)
+		chksum += data[i];
+
+	msg->chksum = cpu_to_be16(chksum);
+
+	return echo;
+}
+
+static int pd692x0_send_msg(struct pd692x0_priv *priv, struct pd692x0_msg *msg)
+{
+	const struct i2c_client *client = priv->client;
+	int ret;
+
+	if (msg->key == PD692X0_KEY_CMD && priv->last_cmd_key) {
+		int cmd_msleep;
+
+		cmd_msleep = 30 - jiffies_to_msecs(jiffies - priv->last_cmd_key_time);
+		if (cmd_msleep > 0)
+			msleep(cmd_msleep);
+	}
+
+	/* Add echo and checksum bytes to the message */
+	priv->msg_id = pd692x0_build_msg(msg, priv->msg_id);
+
+	ret = i2c_master_send(client, (u8 *)msg, sizeof(*msg));
+	if (ret != sizeof(*msg))
+		return -EIO;
+
+	return 0;
+}
+
+static int pd692x0_reset(struct pd692x0_priv *priv)
+{
+	const struct i2c_client *client = priv->client;
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_RESET];
+	ret = pd692x0_send_msg(priv, &msg);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to reset the controller (%pe)\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	msleep(30);
+
+	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
+	if (ret != sizeof(buf))
+		return ret < 0 ? ret : -EIO;
+
+	/* Is the reply a successful report message */
+	if (buf.key != PD692X0_KEY_REPORT || buf.sub[0] || buf.sub[1])
+		return -EIO;
+
+	msleep(300);
+
+	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
+	if (ret != sizeof(buf))
+		return ret < 0 ? ret : -EIO;
+
+	/* Is the boot status without error */
+	if (buf.key != 0x03 || buf.echo != 0xff || buf.sub[0] & 0x1) {
+		dev_err(&client->dev, "PSE controller error\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static bool pd692x0_try_recv_msg(const struct i2c_client *client,
+				 struct pd692x0_msg *msg,
+				 struct pd692x0_msg *buf)
+{
+	/* Wait 30ms before readback as mandated by the protocol */
+	msleep(30);
+
+	memset(buf, 0, sizeof(*buf));
+	i2c_master_recv(client, (u8 *)buf, sizeof(*buf));
+	if (buf->key)
+		return 0;
+
+	msleep(100);
+
+	memset(buf, 0, sizeof(*buf));
+	i2c_master_recv(client, (u8 *)buf, sizeof(*buf));
+	if (buf->key)
+		return 0;
+
+	return 1;
+}
+
+/* Implementation of I2C communication, specifically addressing scenarios
+ * involving communication loss. Refer to the "Synchronization During
+ * Communication Loss" section in the Communication Protocol document for
+ * further details.
+ */
+static int pd692x0_recv_msg(struct pd692x0_priv *priv,
+			    struct pd692x0_msg *msg,
+			    struct pd692x0_msg *buf)
+{
+	const struct i2c_client *client = priv->client;
+	int ret;
+
+	ret = pd692x0_try_recv_msg(client, msg, buf);
+	if (!ret)
+		goto out_success;
+
+	dev_warn(&client->dev,
+		 "Communication lost, rtnl is locked until communication is back!");
+
+	ret = pd692x0_send_msg(priv, msg);
+	if (ret)
+		return ret;
+
+	ret = pd692x0_try_recv_msg(client, msg, buf);
+	if (!ret)
+		goto out_success2;
+
+	msleep(10000);
+
+	ret = pd692x0_send_msg(priv, msg);
+	if (ret)
+		return ret;
+
+	ret = pd692x0_try_recv_msg(client, msg, buf);
+	if (!ret)
+		goto out_success2;
+
+	return pd692x0_reset(priv);
+
+out_success2:
+	dev_warn(&client->dev, "Communication is back, rtnl is unlocked!");
+out_success:
+	if (msg->key == PD692X0_KEY_CMD) {
+		priv->last_cmd_key = true;
+		priv->last_cmd_key_time = jiffies;
+	} else {
+		priv->last_cmd_key = false;
+	}
+
+	return 0;
+}
+
+static int pd692x0_sendrecv_msg(struct pd692x0_priv *priv,
+				struct pd692x0_msg *msg,
+				struct pd692x0_msg *buf)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	ret = pd692x0_send_msg(priv, msg);
+	if (ret)
+		return ret;
+
+	ret = pd692x0_recv_msg(priv, msg, buf);
+	if (ret)
+		return ret;
+
+	if (msg->echo != buf->echo) {
+		dev_err(dev,
+			"Wrong match in message ID, expect %d received %d.\n",
+			msg->echo, buf->echo);
+		return -EIO;
+	}
+
+	/* If the reply is a report message is it successful */
+	if (buf->key == PD692X0_KEY_REPORT &&
+	    (buf->sub[0] || buf->sub[1])) {
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static struct pd692x0_priv *to_pd692x0_priv(struct pse_controller_dev *pcdev)
+{
+	return container_of(pcdev, struct pd692x0_priv, pcdev);
+}
+
+static int pd692x0_fw_unavailable(struct pd692x0_priv *priv)
+{
+	switch (priv->fw_state) {
+	case PD692X0_FW_OK:
+		return 0;
+	case PD692X0_FW_PREPARE:
+	case PD692X0_FW_WRITE:
+	case PD692X0_FW_COMPLETE:
+		dev_err(&priv->client->dev, "Firmware update in progress!\n");
+		return -EBUSY;
+	case PD692X0_FW_BROKEN:
+	case PD692X0_FW_NEED_UPDATE:
+	default:
+		dev_err(&priv->client->dev,
+			"Firmware issue. Please update it!\n");
+		return -EOPNOTSUPP;
+	}
+}
+
+static int pd692x0_pi_enable(struct pse_controller_dev *pcdev, int id)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	if (priv->admin_state[id] == ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED)
+		return 0;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_SET_PORT_PARAM];
+	msg.data[0] = 0x1;
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	priv->admin_state[id] = ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED;
+
+	return 0;
+}
+
+static int pd692x0_pi_disable(struct pse_controller_dev *pcdev, int id)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	if (priv->admin_state[id] == ETHTOOL_C33_PSE_ADMIN_STATE_DISABLED)
+		return 0;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_SET_PORT_PARAM];
+	msg.data[0] = 0x0;
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	priv->admin_state[id] = ETHTOOL_C33_PSE_ADMIN_STATE_DISABLED;
+
+	return 0;
+}
+
+static int pd692x0_pi_is_enabled(struct pse_controller_dev *pcdev, int id)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_STATUS];
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (buf.sub[1]) {
+		priv->admin_state[id] = ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED;
+		return 1;
+	} else {
+		priv->admin_state[id] = ETHTOOL_C33_PSE_ADMIN_STATE_DISABLED;
+		return 0;
+	}
+}
+
+static int pd692x0_ethtool_get_status(struct pse_controller_dev *pcdev,
+				      unsigned long id,
+				      struct netlink_ext_ack *extack,
+				      struct pse_control_status *status)
+{
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_msg msg, buf = {0};
+	int ret;
+
+	ret = pd692x0_fw_unavailable(priv);
+	if (ret)
+		return ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_PORT_STATUS];
+	msg.sub[2] = id;
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	/* Compare Port Status (Communication Protocol Document par. 7.1) */
+	if ((buf.sub[0] & 0xf0) == 0x80 || (buf.sub[0] & 0xf0) == 0x90)
+		status->c33_pw_status = ETHTOOL_C33_PSE_PW_D_STATUS_DELIVERING;
+	else if (buf.sub[0] == 0x1b || buf.sub[0] == 0x22)
+		status->c33_pw_status = ETHTOOL_C33_PSE_PW_D_STATUS_SEARCHING;
+	else if (buf.sub[0] == 0x12)
+		status->c33_pw_status = ETHTOOL_C33_PSE_PW_D_STATUS_FAULT;
+	else
+		status->c33_pw_status = ETHTOOL_C33_PSE_PW_D_STATUS_DISABLED;
+
+	if (buf.sub[1])
+		status->c33_admin_state = ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED;
+	else
+		status->c33_admin_state = ETHTOOL_C33_PSE_ADMIN_STATE_DISABLED;
+
+	priv->admin_state[id] = status->c33_admin_state;
+
+	return 0;
+}
+
+static struct pd692x0_msg_ver pd692x0_get_sw_version(struct pd692x0_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct pd692x0_msg msg, buf = {0};
+	struct pd692x0_msg_ver ver = {0};
+	int ret;
+
+	msg = pd692x0_msg_template_list[PD692X0_MSG_GET_SW_VER];
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get PSE version (%pe)\n", ERR_PTR(ret));
+		return ver;
+	}
+
+	/* Extract version from the message */
+	ver.prod = buf.sub[2];
+	ver.maj_sw_ver = (buf.data[0] << 8 | buf.data[1]) / 100;
+	ver.min_sw_ver = ((buf.data[0] << 8 | buf.data[1]) / 10) % 10;
+	ver.pa_sw_ver = (buf.data[0] << 8 | buf.data[1]) % 10;
+	ver.param = buf.data[2];
+	ver.build = buf.data[3];
+
+	return ver;
+}
+
+struct pd692x0_manager {
+	struct device_node *port_node[PD692X0_MAX_MANAGER_PORTS];
+	int nports;
+};
+
+struct pd692x0_matrix {
+	u8 hw_port_a;
+	u8 hw_port_b;
+};
+
+static int
+pd692x0_of_get_ports_manager(struct pd692x0_priv *priv,
+			     struct pd692x0_manager *manager,
+			     struct device_node *np)
+{
+	struct device_node *node;
+	int ret, nports, i;
+
+	nports = 0;
+	for_each_child_of_node(np, node) {
+		u32 port;
+
+		if (!of_node_name_eq(node, "port"))
+			continue;
+
+		ret = of_property_read_u32(node, "reg", &port);
+		if (ret)
+			goto out;
+
+		if (port >= PD692X0_MAX_MANAGER_PORTS || port != nports) {
+			dev_err(&priv->client->dev,
+				"wrong number or order of manager ports (%d)\n",
+				port);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		of_node_get(node);
+		manager->port_node[port] = node;
+		nports++;
+	}
+
+	manager->nports = nports;
+	return 0;
+
+out:
+	for (i = 0; i < nports; i++) {
+		of_node_put(manager->port_node[i]);
+		manager->port_node[i] = NULL;
+	}
+	of_node_put(node);
+	return ret;
+}
+
+static int
+pd692x0_of_get_managers(struct pd692x0_priv *priv,
+			struct pd692x0_manager manager[PD692X0_MAX_MANAGERS])
+{
+	struct device_node *managers_node, *node;
+	int ret, nmanagers, i, j;
+
+	if (!priv->np)
+		return -EINVAL;
+
+	nmanagers = 0;
+	managers_node = of_get_child_by_name(priv->np, "managers");
+	if (!managers_node)
+		return -EINVAL;
+
+	for_each_child_of_node(managers_node, node) {
+		u32 manager_id;
+
+		if (!of_node_name_eq(node, "manager"))
+			continue;
+
+		ret = of_property_read_u32(node, "reg", &manager_id);
+		if (ret)
+			goto out;
+
+		if (manager_id >= PD692X0_MAX_MANAGERS ||
+		    manager_id != nmanagers) {
+			dev_err(&priv->client->dev,
+				"wrong number or order of managers (%d)\n",
+				manager_id);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ret = pd692x0_of_get_ports_manager(priv, &manager[manager_id],
+						   node);
+		if (ret)
+			goto out;
+
+		nmanagers++;
+	}
+
+	of_node_put(managers_node);
+	return nmanagers;
+
+out:
+	for (i = 0; i < nmanagers; i++) {
+		for (j = 0; j < manager[i].nports; j++) {
+			of_node_put(manager[i].port_node[j]);
+			manager[i].port_node[j] = NULL;
+		}
+	}
+
+	of_node_put(node);
+	of_node_put(managers_node);
+	return ret;
+}
+
+static int
+pd692x0_set_port_matrix(const struct pse_pi_pairset *pairset,
+			const struct pd692x0_manager *manager,
+			int nmanagers, struct pd692x0_matrix *port_matrix)
+{
+	int i, j, port_cnt;
+	bool found = false;
+
+	if (!pairset->np)
+		return 0;
+
+	/* Look on every managers */
+	port_cnt = 0;
+	for (i = 0; i < nmanagers; i++) {
+		/* Look on every ports of the manager */
+		for (j = 0; j < manager[i].nports; j++) {
+			if (pairset->np == manager[i].port_node[j]) {
+				found = true;
+				break;
+			}
+		}
+		port_cnt += j;
+
+		if (found)
+			break;
+	}
+
+	if (!found)
+		return -ENODEV;
+
+	if (pairset->pinout == ALTERNATIVE_A)
+		port_matrix->hw_port_a = port_cnt;
+	else if (pairset->pinout == ALTERNATIVE_B)
+		port_matrix->hw_port_b = port_cnt;
+
+	return 0;
+}
+
+static int
+pd692x0_set_ports_matrix(struct pd692x0_priv *priv,
+			 const struct pd692x0_manager *manager,
+			 int nmanagers,
+			 struct pd692x0_matrix port_matrix[PD692X0_MAX_PIS])
+{
+	struct pse_controller_dev *pcdev = &priv->pcdev;
+	int i, ret;
+
+	/* Init Matrix */
+	for (i = 0; i < PD692X0_MAX_PIS; i++) {
+		port_matrix[i].hw_port_a = 0xff;
+		port_matrix[i].hw_port_b = 0xff;
+	}
+
+	/* Update with values for every PSE PIs */
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		ret = pd692x0_set_port_matrix(&pcdev->pi[i].pairset[0],
+					      manager, nmanagers,
+					      &port_matrix[i]);
+		if (ret) {
+			dev_err(&priv->client->dev,
+				"unable to configure pi %d pairset 0", i);
+			return ret;
+		}
+
+		ret = pd692x0_set_port_matrix(&pcdev->pi[i].pairset[1],
+					      manager, nmanagers,
+					      &port_matrix[i]);
+		if (ret) {
+			dev_err(&priv->client->dev,
+				"unable to configure pi %d pairset 1", i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+pd692x0_write_ports_matrix(struct pd692x0_priv *priv,
+			   const struct pd692x0_matrix port_matrix[PD692X0_MAX_PIS])
+{
+	struct pd692x0_msg msg, buf;
+	int ret, i;
+
+	/* Write temporary Matrix */
+	msg = pd692x0_msg_template_list[PD692X0_MSG_SET_TMP_PORT_MATRIX];
+	for (i = 0; i < PD692X0_MAX_PIS; i++) {
+		msg.sub[2] = i;
+		msg.data[0] = port_matrix[i].hw_port_b;
+		msg.data[1] = port_matrix[i].hw_port_a;
+
+		ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Program Matrix */
+	msg = pd692x0_msg_template_list[PD692X0_MSG_PRG_PORT_MATRIX];
+	ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int pd692x0_setup_pi_matrix(struct pse_controller_dev *pcdev)
+{
+	struct pd692x0_manager manager[PD692X0_MAX_MANAGERS] = {0};
+	struct pd692x0_priv *priv = to_pd692x0_priv(pcdev);
+	struct pd692x0_matrix port_matrix[PD692X0_MAX_PIS];
+	int ret, i, j, nmanagers;
+
+	/* Should we flash the port matrix */
+	if (priv->fw_state != PD692X0_FW_OK &&
+	    priv->fw_state != PD692X0_FW_COMPLETE)
+		return 0;
+
+	ret = pd692x0_of_get_managers(priv, manager);
+	if (ret < 0)
+		return ret;
+
+	nmanagers = ret;
+	ret = pd692x0_set_ports_matrix(priv, manager, nmanagers, port_matrix);
+	if (ret)
+		goto out;
+
+	ret = pd692x0_write_ports_matrix(priv, port_matrix);
+	if (ret)
+		goto out;
+
+out:
+	for (i = 0; i < nmanagers; i++) {
+		for (j = 0; j < manager[i].nports; j++)
+			of_node_put(manager[i].port_node[j]);
+	}
+	return ret;
+}
+
+static const struct pse_controller_ops pd692x0_ops = {
+	.setup_pi_matrix = pd692x0_setup_pi_matrix,
+	.ethtool_get_status = pd692x0_ethtool_get_status,
+	.pi_enable = pd692x0_pi_enable,
+	.pi_disable = pd692x0_pi_disable,
+	.pi_is_enabled = pd692x0_pi_is_enabled,
+};
+
+#define PD692X0_FW_LINE_MAX_SZ 0xff
+static int pd692x0_fw_get_next_line(const u8 *data,
+				    char *line, size_t size)
+{
+	size_t line_size;
+	int i;
+
+	line_size = min_t(size_t, size, PD692X0_FW_LINE_MAX_SZ);
+
+	memset(line, 0, PD692X0_FW_LINE_MAX_SZ);
+	for (i = 0; i < line_size - 1; i++) {
+		if (*data == '\r' && *(data + 1) == '\n') {
+			line[i] = '\r';
+			line[i + 1] = '\n';
+			return i + 2;
+		}
+		line[i] = *data;
+		data++;
+	}
+
+	return -EIO;
+}
+
+static enum fw_upload_err
+pd692x0_fw_recv_resp(const struct i2c_client *client, unsigned long ms_timeout,
+		     const char *msg_ok, unsigned int msg_size)
+{
+	/* Maximum controller response size */
+	char fw_msg_buf[5] = {0};
+	unsigned long timeout;
+	int ret;
+
+	if (msg_size > sizeof(fw_msg_buf))
+		return FW_UPLOAD_ERR_RW_ERROR;
+
+	/* Read until we get something */
+	timeout = msecs_to_jiffies(ms_timeout) + jiffies;
+	while (true) {
+		if (time_is_before_jiffies(timeout))
+			return FW_UPLOAD_ERR_TIMEOUT;
+
+		ret = i2c_master_recv(client, fw_msg_buf, 1);
+		if (ret < 0 || *fw_msg_buf == 0) {
+			usleep_range(1000, 2000);
+			continue;
+		} else {
+			break;
+		}
+	}
+
+	/* Read remaining characters */
+	ret = i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
+	if (strncmp(fw_msg_buf, msg_ok, msg_size)) {
+		dev_err(&client->dev,
+			"Wrong FW download process answer (%*pE)\n",
+			msg_size, fw_msg_buf);
+		return FW_UPLOAD_ERR_HW_ERROR;
+	}
+
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static int pd692x0_fw_write_line(const struct i2c_client *client,
+				 const char line[PD692X0_FW_LINE_MAX_SZ],
+				 const bool last_line)
+{
+	int ret;
+
+	while (*line != 0) {
+		ret = i2c_master_send(client, line, 1);
+		if (ret < 0)
+			return FW_UPLOAD_ERR_RW_ERROR;
+		line++;
+	}
+
+	if (last_line) {
+		ret = pd692x0_fw_recv_resp(client, 100, "TP\r\n",
+					   sizeof("TP\r\n") - 1);
+		if (ret)
+			return ret;
+	} else {
+		ret = pd692x0_fw_recv_resp(client, 100, "T*\r\n",
+					   sizeof("T*\r\n") - 1);
+		if (ret)
+			return ret;
+	}
+
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static enum fw_upload_err pd692x0_fw_reset(const struct i2c_client *client)
+{
+	const struct pd692x0_msg zero = {0};
+	struct pd692x0_msg buf = {0};
+	unsigned long timeout;
+	char cmd[] = "RST";
+	int ret;
+
+	ret = i2c_master_send(client, cmd, strlen(cmd));
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to reset the controller (%pe)\n",
+			ERR_PTR(ret));
+		return ret;
+	}
+
+	timeout = msecs_to_jiffies(10000) + jiffies;
+	while (true) {
+		if (time_is_before_jiffies(timeout))
+			return FW_UPLOAD_ERR_TIMEOUT;
+
+		ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
+		if (ret < 0 ||
+		    !memcmp(&buf, &zero, sizeof(buf)))
+			usleep_range(1000, 2000);
+		else
+			break;
+	}
+
+	/* Is the reply a successful report message */
+	if (buf.key != PD692X0_KEY_TLM || buf.echo != 0xff ||
+	    buf.sub[0] & 0x01) {
+		dev_err(&client->dev, "PSE controller error\n");
+		return FW_UPLOAD_ERR_HW_ERROR;
+	}
+
+	/* Is the firmware operational */
+	if (buf.sub[0] & 0x02) {
+		dev_err(&client->dev,
+			"PSE firmware error. Please update it.\n");
+		return FW_UPLOAD_ERR_HW_ERROR;
+	}
+
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static enum fw_upload_err pd692x0_fw_prepare(struct fw_upload *fwl,
+					     const u8 *data, u32 size)
+{
+	struct pd692x0_priv *priv = fwl->dd_handle;
+	const struct i2c_client *client = priv->client;
+	enum pd692x0_fw_state last_fw_state;
+	int ret;
+
+	priv->cancel_request = false;
+	last_fw_state = priv->fw_state;
+
+	priv->fw_state = PD692X0_FW_PREPARE;
+
+	/* Enter program mode */
+	if (last_fw_state == PD692X0_FW_BROKEN) {
+		const char *msg = "ENTR";
+		const char *c;
+
+		c = msg;
+		do {
+			ret = i2c_master_send(client, c, 1);
+			if (ret < 0)
+				return FW_UPLOAD_ERR_RW_ERROR;
+			if (*(c + 1))
+				usleep_range(10000, 20000);
+		} while (*(++c));
+	} else {
+		struct pd692x0_msg msg, buf;
+
+		msg = pd692x0_msg_template_list[PD692X0_MSG_DOWNLOAD_CMD];
+		ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"Failed to enter programming mode (%pe)\n",
+				ERR_PTR(ret));
+			return FW_UPLOAD_ERR_RW_ERROR;
+		}
+	}
+
+	ret = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
+	if (ret)
+		goto err_out;
+
+	if (priv->cancel_request) {
+		ret = FW_UPLOAD_ERR_CANCELED;
+		goto err_out;
+	}
+
+	return FW_UPLOAD_ERR_NONE;
+
+err_out:
+	pd692x0_fw_reset(priv->client);
+	priv->fw_state = last_fw_state;
+	return ret;
+}
+
+static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
+					   const u8 *data, u32 offset,
+					   u32 size, u32 *written)
+{
+	struct pd692x0_priv *priv = fwl->dd_handle;
+	char line[PD692X0_FW_LINE_MAX_SZ];
+	const struct i2c_client *client;
+	int ret, i;
+	char cmd;
+
+	client = priv->client;
+	priv->fw_state = PD692X0_FW_WRITE;
+
+	/* Erase */
+	cmd = 'E';
+	ret = i2c_master_send(client, &cmd, 1);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to boot programming mode (%pe)\n",
+			ERR_PTR(ret));
+		return FW_UPLOAD_ERR_RW_ERROR;
+	}
+
+	ret = pd692x0_fw_recv_resp(client, 100, "TOE\r\n", sizeof("TOE\r\n") - 1);
+	if (ret)
+		return ret;
+
+	ret = pd692x0_fw_recv_resp(client, 5000, "TE\r\n", sizeof("TE\r\n") - 1);
+	if (ret)
+		dev_warn(&client->dev,
+			 "Failed to erase internal memory, however still try to write Firmware\n");
+
+	ret = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
+	if (ret)
+		dev_warn(&client->dev,
+			 "Failed to erase internal memory, however still try to write Firmware\n");
+
+	if (priv->cancel_request)
+		return FW_UPLOAD_ERR_CANCELED;
+
+	/* Program */
+	cmd = 'P';
+	ret = i2c_master_send(client, &cmd, sizeof(char));
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to boot programming mode (%pe)\n",
+			ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = pd692x0_fw_recv_resp(client, 100, "TOP\r\n", sizeof("TOP\r\n") - 1);
+	if (ret)
+		return ret;
+
+	i = 0;
+	while (i < size) {
+		ret = pd692x0_fw_get_next_line(data, line, size - i);
+		if (ret < 0) {
+			ret = FW_UPLOAD_ERR_FW_INVALID;
+			goto err;
+		}
+
+		i += ret;
+		data += ret;
+		if (line[0] == 'S' && line[1] == '0') {
+			continue;
+		} else if (line[0] == 'S' && line[1] == '7') {
+			ret = pd692x0_fw_write_line(client, line, true);
+			if (ret)
+				goto err;
+		} else {
+			ret = pd692x0_fw_write_line(client, line, false);
+			if (ret)
+				goto err;
+		}
+
+		if (priv->cancel_request) {
+			ret = FW_UPLOAD_ERR_CANCELED;
+			goto err;
+		}
+	}
+	*written = i;
+
+	msleep(400);
+
+	return FW_UPLOAD_ERR_NONE;
+
+err:
+	strscpy_pad(line, "S7\r\n", sizeof(line));
+	pd692x0_fw_write_line(client, line, true);
+	return ret;
+}
+
+static enum fw_upload_err pd692x0_fw_poll_complete(struct fw_upload *fwl)
+{
+	struct pd692x0_priv *priv = fwl->dd_handle;
+	const struct i2c_client *client = priv->client;
+	struct pd692x0_msg_ver ver;
+	int ret;
+
+	priv->fw_state = PD692X0_FW_COMPLETE;
+
+	ret = pd692x0_fw_reset(client);
+	if (ret)
+		return ret;
+
+	ver = pd692x0_get_sw_version(priv);
+	if (ver.maj_sw_ver < PD692X0_FW_MAJ_VER) {
+		dev_err(&client->dev,
+			"Too old firmware version. Please update it\n");
+		priv->fw_state = PD692X0_FW_NEED_UPDATE;
+		return FW_UPLOAD_ERR_FW_INVALID;
+	}
+
+	ret = pd692x0_setup_pi_matrix(&priv->pcdev);
+	if (ret < 0) {
+		dev_err(&client->dev, "Error configuring ports matrix (%pe)\n",
+			ERR_PTR(ret));
+		priv->fw_state = PD692X0_FW_NEED_UPDATE;
+		return FW_UPLOAD_ERR_HW_ERROR;
+	}
+
+	priv->fw_state = PD692X0_FW_OK;
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static void pd692x0_fw_cancel(struct fw_upload *fwl)
+{
+	struct pd692x0_priv *priv = fwl->dd_handle;
+
+	priv->cancel_request = true;
+}
+
+static void pd692x0_fw_cleanup(struct fw_upload *fwl)
+{
+	struct pd692x0_priv *priv = fwl->dd_handle;
+
+	switch (priv->fw_state) {
+	case PD692X0_FW_WRITE:
+		pd692x0_fw_reset(priv->client);
+		fallthrough;
+	case PD692X0_FW_COMPLETE:
+		priv->fw_state = PD692X0_FW_BROKEN;
+		break;
+	default:
+		break;
+	}
+}
+
+static const struct fw_upload_ops pd692x0_fw_ops = {
+	.prepare = pd692x0_fw_prepare,
+	.write = pd692x0_fw_write,
+	.poll_complete = pd692x0_fw_poll_complete,
+	.cancel = pd692x0_fw_cancel,
+	.cleanup = pd692x0_fw_cleanup,
+};
+
+static int pd692x0_i2c_probe(struct i2c_client *client)
+{
+	struct pd692x0_msg msg, buf = {0}, zero = {0};
+	struct device *dev = &client->dev;
+	struct pd692x0_msg_ver ver;
+	struct pd692x0_priv *priv;
+	struct fw_upload *fwl;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(dev, "i2c check functionality failed\n");
+		return -ENXIO;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		dev_err(dev, "Failed to get device status\n");
+		return -EIO;
+	}
+
+	/* Probe has been already run and the status dumped */
+	if (!memcmp(&buf, &zero, sizeof(buf))) {
+		/* Ask again the controller status */
+		msg = pd692x0_msg_template_list[PD692X0_MSG_GET_SYS_STATUS];
+		ret = pd692x0_sendrecv_msg(priv, &msg, &buf);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get device status\n");
+			return ret;
+		}
+	}
+
+	if (buf.key != 0x03 || buf.sub[0] & 0x01) {
+		dev_err(dev, "PSE controller error\n");
+		return -EIO;
+	}
+	if (buf.sub[0] & 0x02) {
+		dev_err(dev, "PSE firmware error. Please update it.\n");
+		priv->fw_state = PD692X0_FW_BROKEN;
+	} else {
+		ver = pd692x0_get_sw_version(priv);
+		dev_info(&client->dev, "Software version %d.%02d.%d.%d\n",
+			 ver.prod, ver.maj_sw_ver, ver.min_sw_ver,
+			 ver.pa_sw_ver);
+
+		if (ver.maj_sw_ver < PD692X0_FW_MAJ_VER) {
+			dev_err(dev, "Too old firmware version. Please update it\n");
+			priv->fw_state = PD692X0_FW_NEED_UPDATE;
+		} else {
+			priv->fw_state = PD692X0_FW_OK;
+		}
+	}
+
+	priv->np = dev->of_node;
+	priv->pcdev.nr_lines = PD692X0_MAX_PIS;
+	priv->pcdev.owner = THIS_MODULE;
+	priv->pcdev.ops = &pd692x0_ops;
+	priv->pcdev.dev = dev;
+	priv->pcdev.types = ETHTOOL_PSE_C33;
+	ret = devm_pse_controller_register(dev, &priv->pcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register PSE controller\n");
+
+	fwl = firmware_upload_register(THIS_MODULE, dev, dev_name(dev),
+				       &pd692x0_fw_ops, priv);
+	if (IS_ERR(fwl))
+		return dev_err_probe(dev, PTR_ERR(fwl),
+				     "failed to register to the Firmware Upload API\n");
+	priv->fwl = fwl;
+
+	return 0;
+}
+
+static void pd692x0_i2c_remove(struct i2c_client *client)
+{
+	struct pd692x0_priv *priv = i2c_get_clientdata(client);
+
+	firmware_upload_unregister(priv->fwl);
+}
+
+static const struct i2c_device_id pd692x0_id[] = {
+	{ PD692X0_PSE_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, pd692x0_id);
+
+static const struct of_device_id pd692x0_of_match[] = {
+	{ .compatible = "microchip,pd69200", },
+	{ .compatible = "microchip,pd69210", },
+	{ .compatible = "microchip,pd69220", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, pd692x0_of_match);
+
+static struct i2c_driver pd692x0_driver = {
+	.probe		= pd692x0_i2c_probe,
+	.remove		= pd692x0_i2c_remove,
+	.id_table	= pd692x0_id,
+	.driver		= {
+		.name		= PD692X0_PSE_NAME,
+		.of_match_table = pd692x0_of_match,
+	},
+};
+module_i2c_driver(pd692x0_driver);
+
+MODULE_AUTHOR("Kory Maincent <kory.maincent@bootlin.com>");
+MODULE_DESCRIPTION("Microchip PD692x0 PoE PSE Controller driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


