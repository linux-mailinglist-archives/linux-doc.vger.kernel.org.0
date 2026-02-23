Return-Path: <linux-doc+bounces-76508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h4m4Ncv7m2kC+wMAu9opvQ
	(envelope-from <linux-doc+bounces-76508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 08:03:39 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7811727CF
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 08:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFC933008E2D
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 07:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4E923EA83;
	Mon, 23 Feb 2026 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxHeyb1J"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24323A92E;
	Mon, 23 Feb 2026 07:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830216; cv=none; b=ACpwH7xU6Jll0d2aV9HqZKeaFfXAeAF5X8Npvxoo19TCl6Lsnw+iC0Xpa71+WLQD7u5mcJKV8ZtyLottipcxB6pHJBEyGzU7+pnkgImgxtl5zLXa/MLiPC34faUczWBLVZ/MUte8Bl4t6qdIE8AZZqadpg10KiGCIvEyDtNuAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830216; c=relaxed/simple;
	bh=cuwuknpS1pW8yV4asOrDWVKBN4lDIswqzZGs3qfKvdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqIcq6bp6k6IIzBpBu13e4qgxT7LME5Jpghww+Eq0pyJKHqZwoUk8BFgCJA9lCUZxzaNzPu++TgzhN75YkPQz85VpQAXBYTj4CExU7q0hpHzjn4seXAmLShaWN+n9z7KlAP+3bSQmFocBFJMqLHVhJU4FMnMolRu/ffwfmrI20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxHeyb1J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10FFC116C6;
	Mon, 23 Feb 2026 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771830215;
	bh=cuwuknpS1pW8yV4asOrDWVKBN4lDIswqzZGs3qfKvdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxHeyb1Jacf58l/yDl+gwSH5xxJoeCHH+sqH1JBWIL6wjAq4IJXywE6TXVSP4jknV
	 ozlhjUygK0rYHc6Lzj1eLPw00ySCUaw+oaocU8tdyZvW90ZQ5Jh8g3IZHljqNLClzT
	 zX/Skc/I1itP423REh0O4vjxBlTJKvW6dk8TkC3r/2t/sZxxKVn4QahtMzOxbrNfUC
	 hp9WSRpvCQTyVvpy0rQI4MCI6hLYBvx9Kwj3+bCeQHdO7iRjeqKnAoTOUpHVFnDmR6
	 YdRQ1st1fHAJGEtfRgYrvpc1bHiPAeMkyu0sKmMOTe9OYUtvAlDa07RyqsRsX2F2gt
	 sY9BZBMsUEKRw==
Date: Mon, 23 Feb 2026 15:03:30 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linusw@kernel.org>, chrome-platform@lists.linux.dev,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v8 1/3] revocable: Revocable resource management
Message-ID: <aZv7whUgUOyIFoYS@tzungbi-laptop>
References: <20260213092307.858908-1-tzungbi@kernel.org>
 <20260213092307.858908-2-tzungbi@kernel.org>
 <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76508-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A7811727CF
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:37:50AM -0800, Bartosz Golaszewski wrote:
> On Fri, 13 Feb 2026 10:23:05 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> > +
> 
> [snip]
> 
> > +/**
> > + * struct revocable_consumer - A handle for resource consumer.
> > + * @rp: The pointer of resource provider.
> > + * @idx: The index for the SRCU critical section.
> > + */
> > +struct revocable_consumer {
> > +	struct revocable *rp;
> > +	int idx;
> > +};
> > +
> > +void revocable_get(struct revocable *rp);
> > +void revocable_put(struct revocable *rp);
> > +struct revocable *revocable_alloc(void *res);
> 
> Is there any reason why we couldn't do:
> 
> int revocable_init(struct revocable *rp, void *res);
> 
> and then:
> 
> struct gpio_device {
> 	struct revocable rp;
> 	...
> };
> 
> revocable_init(&gdev->rp, gc);
> 
> ? It would be functionally equivalent to what we're doing now in GPIO.

In the case of struct gpio_device, it is possible to embed struct revocable
directly.  Since the lifetime of gpio_device matches the revocable object,
the reference counting mechanism in struct revocable is redundant in this
specific instance.

However, the design allows for cases where there is no persistent parent
object.  For example, a revocable handle may exist in the dev-managed
context of a kernel thread.  In such cases, consumers are required to hold
a reference to the handle.

