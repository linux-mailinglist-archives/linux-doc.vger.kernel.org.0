Return-Path: <linux-doc+bounces-89062-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHpNGZObEGpuagYAu9opvQ
	(envelope-from <linux-doc+bounces-89062-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 20:08:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8BF5B8CFE
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 20:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36F103002892
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD661368D7F;
	Fri, 22 May 2026 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9ViQnfR"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B933563C7;
	Fri, 22 May 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473294; cv=none; b=cLY1M+cm6Tqtl632Cy5kk+6OPYSayGpy6jj1aK0JvARTgXWmKatXsx4xzft6mDOeVad0PaiYZroaqLm/cm2PzBPP//GkdUltZIK+adlcF2433M7QdSYXajiivjegkR6Nz9bkkid1RtRatdGVzInw1DbpOn/U9nRzG54VZwA37zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473294; c=relaxed/simple;
	bh=D+QlwgyspGCxRrFsO0ZnTGhtWwf3XXksBQG1mD/ntFs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbnRFkM8CMOnZOIWK9r6UN5Dk+nxeU9Ds+9+1ySzWi/zkUz4igfHZ5m0tCMhb2G6slYVnMM/OEmQVcsOeC4ytty0vXoS7UBH6KBO4v5B/CYEN7SziYIr+gwMHk5+6q03KRNRV/riAD94s7oCJ5JFp6grszJ7dEscgkR20uk8mTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9ViQnfR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C21F000E9;
	Fri, 22 May 2026 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779473277;
	bh=HYE2un0+Wolz9Xbz/PTK0lTQWAFkFE1pz8lK5GQKOns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P9ViQnfROsULbADXDJLeYrUzNXQJuOoKl8GUvCGqEwJdJD3Pg1StMt9WqyNRYWcv4
	 GPLN+l+4VDfxU7MUdBj2xwUbhkyodFnOkJ3JybK0Mb96EZChjTokabOu8m7buT7SGQ
	 qUU6TH4UicB1VAOnrq10n2CLS3Wh4QTW+gx20USneS0mFMxB8sMFTMwZ5fWUjnn5yO
	 1mdsHa60i03rqbSWuI2A/yDqZy6bJdvFW8O+IOvBc+9iLBuZKtFRVcDj9v9yzlqxc6
	 8rOeb8LMBPMRmo/M8Mm6DblEOLbXdz0pXA7W/lq6ZAgZtkLvBfrynmWnodGbj9dx+1
	 8E+jR6w8ZV6ig==
Date: Fri, 22 May 2026 19:07:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v5 11/13] iio: frequency: ad9910: show channel priority
 in debugfs
Message-ID: <20260522190746.4c802584@jic23-huawei>
In-Reply-To: <20260517-ad9910-iio-driver-v5-11-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
	<20260517-ad9910-iio-driver-v5-11-31599c88314a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89062-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,analog.com:email]
X-Rspamd-Queue-Id: 4E8BF5B8CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 17 May 2026 19:37:55 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Expose frequency_source, phase_source and amplitude_source attributes in
> debugfs. Those indicate from which channel the specific DDS parameter is
> being sourced by returning its label. The implementation follows the
> priority table found in the datasheet.
> 

Examples here would be good.

I guess maybe this suffers the same label problem as the parent stuff.
Same solution?


> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>


