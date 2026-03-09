Return-Path: <linux-doc+bounces-78430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LnfEi6Rrmk7GQIAu9opvQ
	(envelope-from <linux-doc+bounces-78430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 10:21:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78723613F
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 10:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DDE93007A6C
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967DF3793CD;
	Mon,  9 Mar 2026 09:21:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9B377EC6
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048101; cv=none; b=dy6ngp+I6WYcodw5mzVcUGSNIUAYDrTKs52u64FmNlJtC/9geuUi+IS3COJeJdPuWMsGFkB2//qKwCEsNiKxvs8PZa6zerb+X4JVpUHaSwM6IlCalsgh/MJ7JFSQIl9Zzk102TLLsun1NvX+aM6kMAobLPNAJu1+7OoLzOpv7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048101; c=relaxed/simple;
	bh=pNVASGNKTkVHmMv/3r/pFQp0I95m8g288bnL/FyxU30=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D2N/qeRB+lk2xCBVtaXpWaWhSHEcjfFqo+/iT91whxZ3y6b5I2NPW0OcAfyQkdpmr23QETUDhOwPmn67ojIwFA8yfMZz0jLUBnJhbxGmxDWsRc/Et9C8HrLdnRv+dTgchpRNa+qsQprm2HSkYopzEPeT79AWxP8hrk85dsV/+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWnp-0002kR-Dm; Mon, 09 Mar 2026 10:21:29 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWnn-004VUn-0x;
	Mon, 09 Mar 2026 10:21:28 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWno-000000004NG-2PF3;
	Mon, 09 Mar 2026 10:21:28 +0100
Message-ID: <d8e0055d62ce135b0792886805fe539c8b8b209d.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/14] reset: warn on reset-gpio release
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 10:21:28 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-5-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-5-599349522876@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
X-Rspamd-Queue-Id: 7C78723613F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.342];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-78430-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Fr, 2026-03-06 at 18:22 +0100, Bartosz Golaszewski wrote:
> While we implement an empty .release() callback for reset-gpio (driver
> core requires it), this function will never actually be called as nobody
> ever removes the device and the last reference is not dropped anywhere.
>=20
> This is by design - once created, the reset-gpio device stays in memory.
> Make the .release() callback emit a warning, should it ever be called
> due to a programming bug.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/reset/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 954df36a242e804b639027384700b8d988be0e90..3e55f794d539e4edc99104cb5=
396cac72ba30618 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -820,7 +820,7 @@ static void __reset_control_put_internal(struct reset=
_control *rstc)
> =20
>  static void reset_gpio_aux_device_release(struct device *dev)
>  {
> -
> +	WARN("reset-gpio device %s should never have been removed", dev_name(de=
v));

I'll change this to

	WARN(1, "reset-gpio device %s should never have been removed", dev_name(de=
v));

when applying.

regards
Philipp

