Return-Path: <linux-doc+bounces-3892-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A58027B0
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 22:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F391F21243
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 21:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB33199A1;
	Sun,  3 Dec 2023 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lNeuh7iw"
X-Original-To: linux-doc@vger.kernel.org
X-Greylist: delayed 25064 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Dec 2023 13:11:55 PST
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B58D6
	for <linux-doc@vger.kernel.org>; Sun,  3 Dec 2023 13:11:55 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 9tkhrjQzbnYhw9tkhrWksH; Sun, 03 Dec 2023 22:11:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701637913;
	bh=/iWSzUSCtFxSRa7nJPgd9T8NZlrqaIvJ6JJK7oUVfkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lNeuh7iw0dmLd7K5RcK/cw56GO34h3LHTskBM0f9tZZQQAx7Av1Z3uQFkqwpmbHsv
	 ypXPbhrtsL5+vQMNPwbP+ckmaGZioLgfr9l2wIpMw6S+JRyytKA5+/YpijhJHnxHxf
	 08GD5f04SFs2kw12PjEc1BiU4IGkB9x+RVYu6X5hF3UyzNoZPX03B01rtFy6G3LA0l
	 Gv1ytpLjnipBqwaO4IEl0/6VlQ6TRtDFAfsMlkGgcvZpXtIxG3E5mtzr+PipsrEPBV
	 IgDH0dws3sqVBqjsRQM9aTxwb5bDhtzEthUKjTJ3sJq6Ywq4ROKvs4dDC/ep7/QTHg
	 IXhysDhb5Q1hQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Dec 2023 22:11:53 +0100
X-ME-IP: 92.140.202.140
Message-ID: <6eeead27-e1b1-48e4-8a3b-857e1c33496b@wanadoo.fr>
Date: Sun, 3 Dec 2023 22:11:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/8] net: pse-pd: Add PD692x0 PSE controller
 driver
Content-Language: fr
To: Kory Maincent <kory.maincent@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Dent Project <dentproject@linuxfoundation.org>
References: <20231201-feature_poe-v2-0-56d8cac607fa@bootlin.com>
 <20231201-feature_poe-v2-8-56d8cac607fa@bootlin.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231201-feature_poe-v2-8-56d8cac607fa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/12/2023 à 18:10, Kory Maincent a écrit :
> Add a new driver for the PD692x0 I2C Power Sourcing Equipment controller.
> This driver only support i2c communication for now.
> 
> Sponsored-by: Dent Project <dentproject@linuxfoundation.org>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> This driver is based on the patch merged in an immutable branch from Jakub
> repo. It is Tagged at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git firmware_loader-add-upload-error
> 
> Change in v2:
> - Drop of_match_ptr
> - Follow the "c33" PoE prefix naming change.
> - Remove unused delay_recv variable. Then, remove struct pd692x0_msg_content
>    which is similar to struct pd692x0_msg.
> - Fix a weird sleep loop.
> - Improve pd692x0_recv_msg for better readability.
> - Fix a warning reported by Simon on a pd692x0_fw_write_line call.
> ---

...

> +static int pd692x0_fw_get_next_line(const u8 *data,
> +				    char *line, size_t size)
> +{
> +	size_t line_size;
> +	int i;
> +
> +	line_size = min_t(size_t, size, (size_t)PD692X0_FW_LINE_MAX_SZ);

Nit: useless size_t cast
> +
> +	memset(line, 0, PD692X0_FW_LINE_MAX_SZ);
> +	for (i = 0; i < line_size - 1; i++) {
> +		if (*data == '\r' && *(data + 1) == '\n') {
> +			line[i] = '\r';
> +			line[i + 1] = '\n';
> +			return i + 2;
> +		}
> +		line[i] = *data;
> +		data++;
> +	}
> +
> +	return 0;
> +}

...

> +static int pd692x0_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pd692x0_msg buf = {0};
> +	struct pd692x0_msg_ver ver;
> +	struct pd692x0_priv *priv;
> +	struct fw_upload *fwl;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "i2c check functionality failed\n");
> +		return -ENXIO;
> +	}
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = client;
> +	i2c_set_clientdata(client, priv);
> +
> +	priv->pcdev.owner = THIS_MODULE;
> +	priv->pcdev.ops = &pd692x0_ops;
> +	priv->pcdev.dev = dev;
> +	priv->pcdev.types = PSE_C33;
> +	priv->pcdev.of_pse_n_cells = 1;
> +	priv->pcdev.nr_lines = PD692X0_MAX_LOGICAL_PORTS;
> +	ret = devm_pse_controller_register(dev, &priv->pcdev);
> +	if (ret) {
> +		return dev_err_probe(dev, ret,
> +				     "failed to register PSE controller\n");
> +	}

Nit: un-needed {}

> +
> +	fwl = firmware_upload_register(THIS_MODULE, dev, dev_name(dev),
> +				       &pd692x0_fw_ops, priv);
> +	if (IS_ERR(fwl)) {
> +		dev_err(dev, "Failed to register to the Firmware Upload API\n");
> +		ret = PTR_ERR(fwl);
> +		return ret;

Nit: return dev_err_probe()?

> +	}
> +	priv->fwl = fwl;
> +
> +	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		dev_err(dev, "Failed to get device status\n");
> +		ret = -EIO;
> +		goto err_fw_unregister;
> +	}
> +
> +	if (buf.key != 0x03 || buf.echo != 0xff || buf.sub[0] & 0x01) {
> +		dev_err(dev, "PSE controller error\n");
> +		ret = -EIO;
> +		goto err_fw_unregister;
> +	}
> +
> +	if (buf.sub[0] & 0x02) {
> +		dev_err(dev, "PSE firmware error. Please update it.\n");
> +		priv->fw_state = PD692X0_FW_BROKEN;
> +		return 0;
> +	}
> +
> +	ver = pd692x0_get_sw_version(priv);
> +	dev_info(&client->dev, "Software version %d.%02d.%d.%d\n", ver.prod,
> +		 ver.maj_sw_ver, ver.min_sw_ver, ver.pa_sw_ver);
> +
> +	if (ver.maj_sw_ver != PD692X0_FW_MAJ_VER) {
> +		dev_err(dev, "Too old firmware version. Please update it\n");
> +		priv->fw_state = PD692X0_FW_NEED_UPDATE;
> +		return 0;
> +	}
> +
> +	ret = pd692x0_update_matrix(priv);
> +	if (ret < 0) {
> +		dev_err(dev, "Error configuring ports matrix (%pe)\n",
> +			ERR_PTR(ret));
> +		goto err_fw_unregister;
> +	}
> +
> +	priv->fw_state = PD692X0_FW_OK;
> +	return 0;
> +
> +err_fw_unregister:
> +	firmware_upload_unregister(priv->fwl);
> +	return ret;
> +}

...


