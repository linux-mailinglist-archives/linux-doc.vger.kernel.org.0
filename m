Return-Path: <linux-doc+bounces-91543-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mmMHOCHEJ2ov1wIAu9opvQ
	(envelope-from <linux-doc+bounces-91543-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:43:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429865D556
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91543-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91543-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A7F4300B19C
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 07:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFFB3911CD;
	Tue,  9 Jun 2026 07:43:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC734751E;
	Tue,  9 Jun 2026 07:43:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991008; cv=none; b=cRjB1OJ/xXtjItBR1aRlBL3KtcMT+991DNOx6/e2dw3YX0qmD9C46aee/P0eyeIHIhaCkhwrOgDBzhRh7tOsRjXT75etJSkZ6QozxL6UpUA3absFhfCpXC18RQ9lJjBcN2qcIbuuw6fJhz6skQ+x80fK4/SDOWkThONgbjkXjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991008; c=relaxed/simple;
	bh=b7Xhfwr8BIMeIpIF1Kl2vLRhU3A2mG576R24QvH6Zo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGi2ByQ1ASaOaKZdWYycEbi2f8+Eoz44Tl5PMZNDXZ/29usaTC99OTAy2zldl7LJrdR73gpA/pCrueNVGIumcq2eHMGpmIElg5pNZTfRvxN1kzBwYT2hw2Pq3gZEq4lRhWqTaoSxWjnts5KEhmpCmr046DVDCuXP65yJ3slg06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id D0A6E68B05; Tue,  9 Jun 2026 09:43:22 +0200 (CEST)
Date: Tue, 9 Jun 2026 09:43:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH 2/4] block: add a "tag" for block status codes
Message-ID: <20260609074322.GC6877@lst.de>
References: <20260608051416.1205282-1-hch@lst.de> <20260608051416.1205282-3-hch@lst.de> <f4c0895b-4758-4eb1-9c3a-38cda0db50d2@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4c0895b-4758-4eb1-9c3a-38cda0db50d2@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91543-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8429865D556

On Mon, Jun 08, 2026 at 02:55:20PM -0700, Bart Van Assche wrote:
> On 6/7/26 10:14 PM, Christoph Hellwig wrote:
>> +const char *blk_status_to_tag(blk_status_t status)
>> +{
>> +	int idx = (__force int)status;
>> +
>> +	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(blk_errors)))
>> +		return "<null>";
>> +	return blk_errors[idx].tag;
>> +}
>
> Since designated initializers are used to initialize blk_errors[], it's
> probably a good idea to check the value of blk_errors[idx].tag, e.g. as
> follows:
>
> return blk_errors[idx].tag ?: "<null>";

I'd go for the good old and readable if statement, but yes, I can add
extra error checking here.


