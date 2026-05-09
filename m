Return-Path: <linux-doc+bounces-86573-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL7nJ4uB/mnyrwAAu9opvQ
	(envelope-from <linux-doc+bounces-86573-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 02:36:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE994FD12D
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 02:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB9F7301C143
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 00:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE531E32D6;
	Sat,  9 May 2026 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="op6CoBOi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5631DF25C;
	Sat,  9 May 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286983; cv=none; b=p21LrJw2r1aVGP6DZOJp+e3QulHoDcZEoK5trua5tzenPW/jmw6jehI1ln0NEUHRVYHPkF+Wma6bHsbbH6x15Cc4Eco7jAwJUvHH4VrNrYTt/U+I0LaEV9oHhpWdcNM9LPLkIMUVkSPmqjn3QJYKDIKj79ZIhv9P7KaaWAgLkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286983; c=relaxed/simple;
	bh=uZN7YV12ZG1D9dVMKNnyTh/nlITOaJN+uamUZzYjPyU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dCylqr9NZnkvnYzX4FtNHJJy4AjjkaxOxaPyXbYA5tCfmuFck/E6BfiSfAgVZX2NQSjHssx4nQ1w5nUv2k9KDmbNgcynx6tPJ9NRv4Pywak9VZXIsMru5E05GqhOFxm8F3eIdMSSwXhH+W7Pq+oFLAyanSnzUBdjkccPgOosJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=op6CoBOi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E610C2BCB4;
	Sat,  9 May 2026 00:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778286982;
	bh=uZN7YV12ZG1D9dVMKNnyTh/nlITOaJN+uamUZzYjPyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=op6CoBOid1XF6Om2b/pucBPJ08v8JvjZggzwm2f6hnN6f2EG09lxgnT/aA3TrkEyC
	 /OHtTSypHARIdqmg+K6WocdYaNhcOxZSNjMXniX+x0keHc91J958Pa8Kbkm0W+iRot
	 PdGiPqsOVcBekk0jtiFIyowc846XFUAdMyUtXYPs=
Date: Fri, 8 May 2026 17:36:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-Id: <20260508173621.507bd86289fbef5617aea501@linux-foundation.org>
In-Reply-To: <af58hCeOU15570Yq@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
	<20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
	<af5Z2IvtS5pVorSl@laps>
	<20260508164925.20e09fba0277f0bc8ffc9a3d@linux-foundation.org>
	<af58hCeOU15570Yq@laps>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EEE994FD12D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86573-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Action: no action

On Fri, 8 May 2026 20:15:00 -0400 Sasha Levin <sashal@kernel.org> wrote:

> Livepatch is great when you have one. The problem is getting one...
> 
> To get a livepatch, somebody has to write the fix, build it against the exact
> kernel you're running (for distros, thats hundreds of different
> kernel/arch/flavor combinations), sign it, and get it onto every machine.
> 
> Most regular users won't be able to do it on their own because of secure boot
> limitations, so they depend on their vendor to provide them with one.
> 
> Yes, you could write a livepatch that just stubs the function out, same end
> state as killswitch, but you still have to build, sign, and ship a module per
> kernel to do it
> 
> Killswitch would be just a single write to /sys which an ordinary user can do
> to mitigate a critical issue immediately.

OK, thanks.  Worth adding the changelog in case someone else was
wondering?

