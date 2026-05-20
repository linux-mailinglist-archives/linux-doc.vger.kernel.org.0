Return-Path: <linux-doc+bounces-88692-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACZBArVFDmoM9gUAu9opvQ
	(envelope-from <linux-doc+bounces-88692-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 01:37:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22659CD1A
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 01:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DA4316FDB3
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 22:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB9139524E;
	Wed, 20 May 2026 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+RnrgCF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D1371CE3;
	Wed, 20 May 2026 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316386; cv=none; b=pgGm5cx5Hhkles3Mo8nnM6DNVg0JtfhwhyfJnLuzZnqHSTOglK1tdKX1kwVOe3XO3aUbCqsW7JqLVZEczd4ulZtcPbx2tCRBGANzmgGmN44b7YGMKNO0WODXymEY4uQwnlLtfihncSX2Tt57Ck0abh+lfk7CWT0Vm+3yIqikZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316386; c=relaxed/simple;
	bh=FXwEtPiTtY8NnrFt8WmwY1onC4xP3QHCk+kOM0E5nEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDvKUvEHvTJIULMdvQIWRgxbHmQ2uge3gAxNuIAASecQHvvZQf6qzZaap1YecpAH+1qzFzWNg9Gnf2iam1cCWakdCmE30MblUpeDkti+URz1DJscK+4HJZ7TqTU8KToD7DswyWusbDayCZ0mbJD1Z23f4zMoqH//5VqY0FFwFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+RnrgCF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5E41F000E9;
	Wed, 20 May 2026 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779316384;
	bh=FXwEtPiTtY8NnrFt8WmwY1onC4xP3QHCk+kOM0E5nEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b+RnrgCFsTXY6uym5xJad7XUGGEIMm+gTEU8fuATtNAN7vXektT7sHTbgaNkvrHus
	 LhVIWiO2yLloZFkRrh/GQVtProC8rdH00ky522apmnNMrWL5typwVNPQ/Cnr89CJf2
	 ROy29UJLg7ANFSWQhLPrFcmxCIN1nUB/SjG57PZUJ08I4ZoxZP420xXJWqeczG2G1v
	 o8G4dO5Fk62TN1elbpRPS8ccZC/rWTLLpQktPcLKJ5rJD/Bacf43CH4xgmwwVlXjX7
	 DfQHBY0LFlvU9w6wTFV5kYKj2XhMxDXX/z1wVMQvx/+0zSwwuG5IBz7Spm6dB1tyc0
	 ehpwgfa+Zn03Q==
Date: Wed, 20 May 2026 15:33:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, Felix Maurer <fmaurer@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Meghana Malladi <m-malladi@ti.com>, Jacob Keller
 <jacob.e.keller@intel.com>, David Carlier <devnexen@gmail.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
 <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <20260520153303.33692fe3@kernel.org>
In-Reply-To: <1d8ab51a-6943-4978-88cf-adda8cc57f7e@ti.com>
References: <20260514075605.850674-1-danishanwar@ti.com>
	<20260514075605.850674-3-danishanwar@ti.com>
	<20260518184506.694c584e@kernel.org>
	<E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
	<20260519165646.09b0783f@kernel.org>
	<1d8ab51a-6943-4978-88cf-adda8cc57f7e@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88692-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.dev,redhat.com,davemloft.net,google.com,kernel.org,lwn.net,linuxfoundation.org,lunn.ch,ti.com,intel.com,gmail.com,vger.kernel.org,lists.infradead.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5F22659CD1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 15:30:24 +0530 MD Danish Anwar wrote:
> What should be the next steps here? Is there any existing defined set of
> stats where I could populate stats from ICSSG firmware for HSR (similar
> to ndo_get_stats64 callback). Or de we need to implement a new callback
> that will do this for HSR.

I'd try to plumb this thru ndo_get_offload_stats
Close enough for my taste, let's see if anyone objects.

> I agree with Luka on the categorization,

Felix responded with the MIB counters which are even better.
We should probably define a struct with all of those and then
just fill in the ones you have.

Please do the same thing ethtool Netlink does, break the counters up,
each member to its own Netlink attr, in the kernel init them to ~0
and only report values the driver actually set to something.
We don't want to print 0 for stats driver doesn't support.

