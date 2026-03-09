Return-Path: <linux-doc+bounces-78432-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB7OBBCTrml0GQIAu9opvQ
	(envelope-from <linux-doc+bounces-78432-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 10:29:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B532362C3
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 10:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B4F3067FCE
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 09:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED717379EE5;
	Mon,  9 Mar 2026 09:25:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483F33C51A
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048316; cv=none; b=u//KwHszFaRJmIyR3zxImtb0lya7EK+DKYFceu9FlkECMwUrie92Zgq1n+41t2pbxu9gXFP0iMMtOkoRvIkJyM7sEZ0Hat0iB2dTdN0H1MiGR1IuSuNRiDHWnrdacXhbEoRGvA33N2/IHqlrMBmKObfMCL6N59IPU7DJ5l28P+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048316; c=relaxed/simple;
	bh=X0rzyuW2W8mSHHwqcJKwaZ3TJyFOdZzD6Suz3gpC+jU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MTi+2ZBsfP0sBGIbZeHFIddgeEXPDPjPMXzaxVaFHJ9fSHpMeujaNhDRM4Qwa7vktDeqrvBLBFGb5nV2B3peOecaaQ1DyCrVZQ5D3XBrsFmzNopRbfaoiCbX/RgWzTYVrf+YKEnHf0uDQ8FmplPlvCbtpHLJgRjX7zoakeXjjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWrL-0003Eg-Co; Mon, 09 Mar 2026 10:25:07 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWrJ-004VVI-1C;
	Mon, 09 Mar 2026 10:25:06 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzWrK-000000004hp-2lI5;
	Mon, 09 Mar 2026 10:25:06 +0100
Message-ID: <8dc9221ea83c9adeba3183cc370a6a4874562376.camel@pengutronix.de>
Subject: Re: [PATCH v3 00/14] reset: major reset core refactoring
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 10:25:06 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 78B532362C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:url,pengutronix.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.350];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-78432-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Fr, 2026-03-06 at 18:22 +0100, Bartosz Golaszewski wrote:
> Here is the promised refactoring of the reset core. The main goal of the
> series is to make the reset subsystem fwnode-agnostic - meaning it can
> work with all kinds of firmware nodes instead of being OF-centric - but
> there are some other related changes in here as well. I'm sending it all
> out for review to give Phillipp a better picture of the end result but
> individual pieces can be picked up earlier if accepted.
[...]
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied to reset/next, thanks!

[01/14] reset: gpio: remove unneeded OF-node put
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dfe3da77f2f94
[02/14] reset: gpio: add a devlink between reset-gpio and its consumer
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Da9b95ce36de4
[03/14] reset: gpio: simplify fallback device matching
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dad9d28e68f4f
[04/14] reset: gpio: remove unneeded auxiliary_set_drvdata()
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D1acd46638408
[05/14] reset: warn on reset-gpio release
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D20adbf3b8f5c
[06/14] reset: fold ida_alloc() into reset_create_gpio_aux_device()
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D6703784ab9a8
[07/14] reset: use lock guards in reset core
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D1f10008aff71
[08/14] reset: handle removing supplier before consumers
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D78ebbff6d1a0
[09/14] reset: protect struct reset_controller_dev with its own mutex
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D44a0acb2caca
[10/14] reset: protect struct reset_control with its own mutex
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D8c91302a29bc
[11/14] reset: convert of_reset_control_get_count() to using firmware nodes
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9d52054a4fc3
[12/14] reset: convert the core API to using firmware nodes
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dba8dbbb14b7e
[13/14] reset: convert reset core to using firmware nodes
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9035073d0ef1
[14/14] reset: gpio: make the driver fwnode-agnostic
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dfaaad5006e58

regards
Philipp

