Return-Path: <linux-doc+bounces-89707-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE1xMUCjFmqBnwcAu9opvQ
	(envelope-from <linux-doc+bounces-89707-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 09:54:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C663E5E0AC6
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 09:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB1EC300BC59
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 07:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE503CD8BD;
	Wed, 27 May 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VPIWEIh0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9343C8700
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868473; cv=none; b=phy9SloERfFsT7sFU01hWlzjPUzOvTNoA5w1tPXeRPX3aQOPaGizghBQWHuWbi/szLr+LSR9uG4U+QJdUA8QNlp8qqpaOZbDoKgO4r276p/GWQLsbhYuEyuOlvZub5R6QxOIEqFF7rJe8cDN/ZTci218MKc/tjQUmq06U9Vssq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868473; c=relaxed/simple;
	bh=CCnbIBach2b7ZY6IjHTu31zdg4aqc0EOJLy/8+XgcvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zl+SjIuw689rEZUMy/mFEmMhCa2x8qLtTn9Hk5Ljx2+7Z7fleexTFPMtv683ja9zfdYKO68BO2C5uOWL5hIsZR7gA1UMYbl6EGW8gK8U8sjhT2zvgfLiNTa3Dhl2z/A1ynx00qIcDvmtpn1tVTB4CngQXR4eQbk68cNRH8eSQeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VPIWEIh0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5A60C2C65F;
	Wed, 27 May 2026 07:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18C5D601A1;
	Wed, 27 May 2026 07:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E85710888942;
	Wed, 27 May 2026 09:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CCnbIBach2b7ZY6IjHTu31zdg4aqc0EOJLy/8+XgcvQ=;
	b=VPIWEIh0sjpPUqOYdaRpqxskqNu0SooOSXIFx4pGTi1qMovcRTMmaBerYwGL1G5fDkmvbg
	TRZyPkVyg1wVotOa630qjGY4iI2yk2q8GrVOZQ5V5D0y35eo6o8LuJQTyr8DSuKmx0dkII
	cju7pr+Fx3QoiY/0FaMT+lDED0ta7X7TO88h1kcqyLy1yUDbvEaofmOQiXDN8MkgcTgA2v
	rL/FzzHn5KzjVlnOh49gyK6dNq5OzoL9Vlg8394N8GW7G8JLftajR4AGmbJ7Pu8QDBe01M
	Qnmz51goUmQC2PIsnUPZXnjjGA0bOavyw4gTjnGh/fWPRmX+pvWNcLbU6IeXJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v6 00/28] mtd: spi-nor: Enhance software protection
In-Reply-To: <2vxz8q964210.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 17:35:23 +0200")
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
	<2vxz8q964210.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:54:25 +0200
Message-ID: <87h5ntl232.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89707-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C663E5E0AC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> Applied to spi-nor/next. This should give us around 3 weeks to soak in
> linux next.

That's fine. Most of the build related breakages will usually be
discovered within one week. Testing feedback will anyway be much longer
to come.

> Expect the SPI NOR PR a little bit later than usual, around
> the start of the merge window so we can maximize the exposure of these
> patches.

I try to send the MTD PR between mid and end of the first week of the
merge window, getting your PR on the first days of the merge window is
still completely okay since the branches are already pulled into
linux-next.

> Apologies once again for the crappy contributor experience, I tried to
> get to this sooner, but wasn't much successful at it :-/

No worries :-)

Thanks,
Miqu=C3=A8l

