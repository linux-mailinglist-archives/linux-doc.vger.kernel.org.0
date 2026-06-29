Return-Path: <linux-doc+bounces-93933-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QDAVESsqQmrW1AkAu9opvQ
	(envelope-from <linux-doc+bounces-93933-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 10:17:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA286D7662
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 10:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=karo-electronics.de header.s=kas202603021246 header.b=ecw7eren;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93933-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93933-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=karo-electronics.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0142F3098434
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 08:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3873B4EB7;
	Mon, 29 Jun 2026 08:00:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6253B4EB0;
	Mon, 29 Jun 2026 08:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720023; cv=none; b=UcXwu85HR8wtpwgtwnhd0l7qgxk4MvAFbCYoU8Z8qxQJbHk9ozmZ2mynMpbPCjFjN1V0Vitl+SZNbw1XS2IMtKA9GqLIhxJKZAQlsBFIDR5d9j4XBWl3Bn3sYOWpGl8dzP0rKSsDmuguT7/HWjALJsRobhRmZ+xNtd2/Jg44nkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720023; c=relaxed/simple;
	bh=Mu/vYRPrMM6y78Zq6iLYUkQGJTBkafHpPpDy8E5c9xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwXpN5w01tAxYSCXSHl+K451mrYv+WKVW+jwPsH7oVkRAf+0htZc3Atdjg1HEOqA2cHy3uMge37OZq8DmfoL8Z2/fwSJKfuag27fyrfX92wr7Js+eRYyMWf8/Vj4Ze4SvJmd//toQWnz6HoKplIw60mY0GLRa7qfJzIIjP4CrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=KARO-electronics.de; spf=pass smtp.mailfrom=KARO-electronics.de; dkim=pass (2048-bit key) header.d=karo-electronics.de header.i=@karo-electronics.de header.b=ecw7eren; arc=none smtp.client-ip=85.13.167.58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1782719411;
	bh=Qylp1+q58BKXjVYMlUJn3x4tvz3kf67QuXXQvLn3hVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ecw7erenvWIYPBx2V7ZPPuTiP0QJvB7JeAWgS4GWnn8/503xZok/8BGzb9DeXRFBc
	 XeC7jO4MWatNjCHC1ECcBW6XrZdV0OBa382Qs/IVNEJ5dgLX3G92WP+J1ri7YIyWer
	 dwai6hyb94q6EmVN0GrRTOkeBo/h0lefqhkodnLOH1A79zFz1cvQTTHVYCYQsOCsz1
	 c62YtKjIwpqQE3i0RhHvCf2yilcCcl4J95W3ejucUfo5okw7f5V89GB8iMAPWRex8x
	 ZZ1n2IpEQXDTL/6Gfp4KBftpnC4mSJJIA2vDTx0WN8aEMFIQMHm9Gls1wkkKm9TBcP
	 0b7q1/LHFGtGQ==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 8485F7722430;
	Mon, 29 Jun 2026 09:50:10 +0200 (CEST)
Date: Mon, 29 Jun 2026 09:50:09 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frieder Schrempf
 <frieder.schrempf@kontron.de>, kernel test robot <lkp@intel.com>,
 sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v26 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <20260629095009.3256f956@karo-electronics.de>
In-Reply-To: <20260629-imx-se-if-v26-3-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
	<20260629-imx-se-if-v26-3-146446285744@nxp.com>
Organization: Ka-Ro electronics GmbH
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: /
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[karo-electronics.de,none];
	R_DKIM_ALLOW(-0.20)[karo-electronics.de:s=kas202603021246];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93933-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pankaj.gupta@oss.nxp.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:pankaj.gupta@nxp.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:frieder.schrempf@kontron.de,m:lkp@intel.com,m:sashiko-bot@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[LW@KARO-electronics.de,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,kontron.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[LW@KARO-electronics.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[karo-electronics.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,karo-electronics.de:dkim,karo-electronics.de:mid,KARO-electronics.de:from_mime,nxp.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEA286D7662

Hi,

On Mon, 29 Jun 2026 17:51:59 +0530 pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>=20
> Add MU-based communication interface for secure enclave.
>=20
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
>=20
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>=20
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
>=20
[...]
> +	ret =3D se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
> +				  true);
> +	if (ret)
> +		goto exit;
[...]
> +/* Fill a command message header with a given command ID and length in b=
ytes. */
> +static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se=
_msg_hdr *hdr,
> +				      u8 cmd, u32 len, bool is_base_api)
> +{
> +	hdr->tag =3D priv->if_defs->cmd_tag;
> +	hdr->ver =3D (is_base_api) ? priv->if_defs->base_api_ver : priv->if_def=
s->fw_api_ver;
> +	hdr->command =3D cmd;
> +	hdr->size =3D len >> 2;
> +
> +	return 0;
> +}
>
I don't see a point in having a function always return zero and
implement error checks that will never be used.

[...]
> +static const struct of_device_id se_match[] =3D {
> +	{ .compatible =3D "fsl,imx8ulp-se-ele-hsm", .data =3D &imx8ulp_se_ele_h=
sm},
> +	{ .compatible =3D "fsl,imx93-se-ele-hsm", .data =3D &imx93_se_ele_hsm},
> +	{},
>
Since the last entry in this array must be a NULL entry, there should be
no comma after the {}. This will generate a compile error if (e.g. by
patch conflict resolution) an entry is added after the end marker.



Lothar Wa=C3=9Fmann

