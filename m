Return-Path: <linux-doc+bounces-91542-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cYPGNyrEJ2ox1wIAu9opvQ
	(envelope-from <linux-doc+bounces-91542-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:43:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08965D55E
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91542-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91542-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55961304670B
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C752A3DBD4F;
	Tue,  9 Jun 2026 07:41:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C7386C2D;
	Tue,  9 Jun 2026 07:41:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990898; cv=none; b=O1rsoL89x8DlY/tAgfp3zgwX7X95DbIn7K+SOnE1u3jcqX2VbQZjYLGFQ7V5/IrhV/9q1UAKwxhT005or3jqhN6xW4GfT0d7vhR2WezztjPkdfaCOS056q9xBGuW7AECyEzx/bEpFYqiAB2yXKpC9KY/kfnHcH8UPdBdkrw3wUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990898; c=relaxed/simple;
	bh=CK6Z6Ppqff7Zpmhk33RkTjjq1PaE0R7Guz72XBD6Hw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtLLrACMkekg7l2bD6rQHnYuaBska+kxGwkOsHslkiwfKeIMOu6zR07Qm0bReMfPX4Uith/L1TTIJZr2Ri/X3cmJ52cuTiC4TBCBosXThTNqPngt48Yl1h/1AhIMx2iJTefJ/7E8DOapAdIDo9NtYa4R7UEcwnTt8QDTMWKFyQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id AE17B68B05; Tue,  9 Jun 2026 09:41:22 +0200 (CEST)
Date: Tue, 9 Jun 2026 09:41:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH 4/4] block: add configurable error injection
Message-ID: <20260609074122.GB6877@lst.de>
References: <20260608051416.1205282-1-hch@lst.de> <20260608051416.1205282-5-hch@lst.de> <bac50400-dd86-4c7f-bab3-481c1306877b@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac50400-dd86-4c7f-bab3-481c1306877b@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91542-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:hch@lst.de,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA08965D55E

On Mon, Jun 08, 2026 at 08:53:22AM -0600, Jens Axboe wrote:
> > +	if (!test_bit(GD_ERROR_INJECT, &bio->bi_bdev->bd_disk->state))
> > +		return false;
> > +	return __blk_error_inject(bio);
> > +}
> 
> I really hate this part, that's a pretty deep set of pointer chasings to
> figure out if injection is enabled or not,

It's to the bdev we use everywhere, and then to the disk which we use
in a lot of places in the submission path.

The only easy way to reduce it would be to move the state to the
block_device.  We currently don't do partitions in debugfs, but maybe
we should?

> when in practice error
> injection is only ever enabled for specific test cases and distros
> invariably will set CONFIG_BLK_ERROR_INJECTION because they turn on
> every damn thing under the sun.
> 
> IOW, that won't fly for the hot path. Maybe a static key would be useful
> here?

a static_key makes sense here, probably including the legacy error
injection.


